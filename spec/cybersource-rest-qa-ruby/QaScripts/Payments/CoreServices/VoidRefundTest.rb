require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class VoidRefund
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::VoidRefundRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::VoidApi.new(api_client, config)
		#Reading from input CSV file--
    csv_text = File.read("QaScripts\\CSV_Files\\Payments\\CoreServices\\VoidRefund.csv")
		csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|

    refund_id = row[1]

    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_refund_void"
    request.client_reference_information = client_reference_information
   
    begin
			responsebody , code, headers = api_instance.void_refund(request,refund_id)
			resp = JSON.parse(responsebody)
			#Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['status'] != ConstantUtility::STATUS_PENDING
          writeToCSV << [row[0], 'VoidRefund', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_PENDING, DateTime.now]
        elsif resp['id'] == nil
          writeToCSV << [row[0], 'VoidRefund', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        elsif resp['refundAmountDetails']['refundAmount'] == row[2]
          writeToCSV << [row[0], 'VoidRefund', 'Pass:' + response_code.to_s + '-' + resp['id'], row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'VoidRefund', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        writeToCSV << [row[0], 'VoidRefund', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  VoidRefund.new.main
end
