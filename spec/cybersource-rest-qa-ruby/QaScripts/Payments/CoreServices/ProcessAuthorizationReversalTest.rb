require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class ProcessAuthorizationReversal
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::AuthReversalRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReversalApi.new(api_client, config)
    #Reading from Input CSV file
    csv_text = File.read("QaScripts\\CSV_Files\\Payments\\CoreServices\\CreateReversal.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    payment_id = row[1]

    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_reversal"
    request.client_reference_information = client_reference_information
    
    reversal_information = CyberSource::Ptsv2paymentsidreversalsReversalInformation.new
    reversal_information.reason = "testing"
    
    amount_details = CyberSource::Ptsv2paymentsidreversalsReversalInformationAmountDetails.new
    amount_details.total_amount = row[2]
    
    reversal_information.amount_details = amount_details
    request.reversal_information = reversal_information
    begin
      response_body , response_code, response_headers = api_instance.auth_reversal(payment_id, request)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['status'] != ConstantUtility::STATUS_REVERSED
          writeToCSV << [row[0], 'ProcessAuthorizationReversal', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_REVERSED, DateTime.now]
        elsif resp['id'] == nil
          writeToCSV << [row[0], 'ProcessAuthorizationReversal', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        elsif resp['reversalAmountDetails']['reversedAmount'] == row[2]
          writeToCSV << [row[0], 'ProcessAuthorizationReversal', 'Pass:' + response_code.to_s + '-' + resp['id'], row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'ProcessAuthorizationReversal', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body !=nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        writeToCSV << [row[0], 'ProcessAuthorizationReversal', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  ProcessAuthorizationReversal.new.main
end
