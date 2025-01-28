require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class RefundPayment
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::RefundPaymentRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::RefundApi.new(api_client, config)
    
     #Reading from Input CSV file
     csv_text = File.read("QaScripts\\CSV_Files\\Payments\\CoreServices\\RefundPayment.csv")
     csv = CSV.parse(csv_text, :headers => true)
     csv.each do |row|
         payment_id = row[1]
         client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
         client_reference_information.code = "test_refund_payment"
         request.client_reference_information = client_reference_information
     
         order_information = CyberSource::Ptsv2paymentsOrderInformation.new
         amount_details = CyberSource::Ptsv2paymentsOrderInformationAmountDetails.new
         amount_details.total_amount = row[2]
         amount_details.currency ="USD"
         order_information.amount_details = amount_details
         request.order_information = order_information
    
    begin
      response_body , response_code, response_headers = api_instance.refund_payment(request, payment_id)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['status'] != ConstantUtility::STATUS_PENDING
          writeToCSV << [row[0], 'RefundPayment', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_PENDING, DateTime.now]
        elsif resp['id'] == nil
          writeToCSV << [row[0], 'RefundPayment', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        elsif resp['refundAmountDetails']['refundAmount'] == row[2]
          writeToCSV << [row[0], 'RefundPayment', 'Pass:' + response_code.to_s + '-' + resp['id'], row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'RefundPayment', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        writeToCSV << [row[0], 'RefundPayment', 'Fail:' + err.code.to_s, resp['reason'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  RefundPayment.new.main
end
