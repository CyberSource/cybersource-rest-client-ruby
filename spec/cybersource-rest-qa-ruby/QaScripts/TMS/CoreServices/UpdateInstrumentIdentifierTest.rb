require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

# * This is a sample code to call InstrumentIdentifierApi,
# * Update an Instrument Identifier
# * Include the profile_id, token_id in the POST request to create a instrument identifier.

public
class UpdateInstrumentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    body = CyberSource::Body1.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client, config)

    csv_text = File.read("QaScripts\\CSV_Files\\TMS\\CoreServices\\UpdateInstrumentIdentifier.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    profile_id = row[1]

    merchant_initiated_transaction = CyberSource::Tmsv1instrumentidentifiersAuthorizationOptionsMerchantInitiatedTransaction.new
    previous_transaction_id = "123456789012345"
    merchant_initiated_transaction.previous_transaction_id = previous_transaction_id

    initiator = CyberSource::Tmsv1instrumentidentifiersProcessingInformationAuthorizationOptionsInitiator.new
    initiator.merchant_initiated_transaction = merchant_initiated_transaction

    authorization_options = CyberSource::Tmsv1instrumentidentifiersProcessingInformationAuthorizationOptions.new
    authorization_options.initiator = initiator

    processing_information = CyberSource::Tmsv1instrumentidentifiersProcessingInformation.new
    processing_information.authorization_options = authorization_options

    body.processing_information = processing_information
    begin
      response_body , response_code, response_headers = api_instance.tms_v1_instrumentidentifiers_token_id_patch(profile_id, row[2], body)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['state'] != ConstantUtility::STATE_ACTIVE
          writeToCSV << [row[0], 'UpdateInstrumentIdentifier', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_ACTIVE, DateTime.now]
        elsif resp['id'] == nil
          writeToCSV << [row[0], 'UpdateInstrumentIdentifier', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        elsif resp['id'] == row[2]
          writeToCSV << [row[0], 'UpdateInstrumentIdentifier', 'Pass:' + response_code.to_s + '-' + resp['id'], row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'UpdateInstrumentIdentifier', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'UpdateInstrumentIdentifier', 'Fail:' + err.code.to_s, resp['errors'][0]['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  UpdateInstrumentIdentifier.new.main
end