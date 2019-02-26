require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class CreateCredit
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::CreateCreditRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::CreditApi.new(api_client, config)
  
     #Reading from Input CSV file
     csv_text = File.read("QaScripts\\CSV_Files\\Payments\\CoreServices\\CreateProcessCredit.csv")
     csv = CSV.parse(csv_text, :headers => true)
     csv.each do |row|

      client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
      client_reference_information.code = "test_credit"
      request.client_reference_information = client_reference_information
      
      order_information = CyberSource::Ptsv2paymentsOrderInformation.new
      bill_to_information = CyberSource::Ptsv2paymentsOrderInformationBillTo.new
      bill_to_information.country = "US"
      bill_to_information.last_name = "Deo"
      bill_to_information.address1 = "1 Market St"
      bill_to_information.postal_code = "94105"
      bill_to_information.locality = "san francisco"
      bill_to_information.administrative_area = "CA"
      bill_to_information.first_name = "John"
      bill_to_information.phone_number = "4158880000"
      bill_to_information.email = "test@cybs.com"
      order_information.bill_to = bill_to_information
      request.order_information = order_information
  
      amount_information = CyberSource::Ptsv2paymentsOrderInformationAmountDetails.new
      amount_information.total_amount = row[1]
      amount_information.currency = "USD"
      order_information.amount_details = amount_information
      request.order_information = order_information
  
      payment_information = CyberSource::Ptsv2paymentsPaymentInformation.new
      card_information =CyberSource::Ptsv2paymentsPaymentInformationCard.new
      card_information.expiration_year = "2031"
      card_information.number = "5555555555554444"
      card_information.expiration_month = "12"
      card_information.type = "002"
      payment_information.card = card_information
      request.payment_information = payment_information
    begin
      response_body , response_code, response_headers = api_instance.create_credit(request)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['status'] != ConstantUtility::STATUS_PENDING
          writeToCSV << [row[0], 'ProcessCredit', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_PENDING, DateTime.now]
        elsif resp['id'] == nil
          writeToCSV << [row[0], 'ProcessCredit', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        elsif resp['creditAmountDetails']['creditAmount'] == row[1]
          writeToCSV << [row[0], 'ProcessCredit', 'Pass:' + response_code.to_s + '-' + resp['id'], row[2], DateTime.now]
        else
          writeToCSV << [row[0], 'ProcessCredit', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        writeToCSV << [row[0], 'ProcessCredit', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  CreateCredit.new.main
end
