require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class CreateInstrumentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::Body.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifiersApi.new(api_client, config)

    #Reading from input CSV file--
    csv_text = File.read("QaScripts\\CSV_Files\\TMS\\CoreServices\\CreateInstrumentIdentifier.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    profile_id = row[2]

    instrument_card_info = CyberSource::Tmsv1instrumentidentifiersCard.new
    instrument_card_info.number = "1234567890123"
    request.card = instrument_card_info
    
    instrument_processing_information_merchant_initiator = CyberSource::Tmsv1instrumentidentifiersAuthorizationOptionsMerchantInitiatedTransaction.new
    instrument_processing_information_merchant_initiator.previous_transaction_id = row[1]

    
    instrument_processing_information_initiator = CyberSource::Tmsv1instrumentidentifiersProcessingInformationAuthorizationOptionsInitiator.new
    instrument_processing_information_initiator.merchant_initiated_transaction = instrument_processing_information_merchant_initiator

    instrument_processing_information_auth = CyberSource::Tmsv1instrumentidentifiersProcessingInformationAuthorizationOptions.new
    instrument_processing_information_auth.initiator = instrument_processing_information_initiator

    instrument_processing_information = CyberSource::Tmsv1instrumentidentifiersProcessingInformation.new
    instrument_processing_information.authorization_options = instrument_processing_information_auth
    
    request.processing_information = instrument_processing_information

    begin
      response_body, response_code, response_headers = api_instance.tms_v1_instrumentidentifiers_post(profile_id, request)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['state'] != ConstantUtility::STATE_ACTIVE
          writeToCSV << [row[0], 'CreateInstrumentIdentifier', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_ACTIVE, DateTime.now]
        elsif resp['id'] == nil
          writeToCSV << [row[0], 'CreateInstrumentIdentifier', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        elsif resp['processingInformation']['authorizationOptions']['initiator']['merchantInitiatedTransaction']['previousTransactionId'] == row[1]
          writeToCSV << [row[0], 'CreateInstrumentIdentifier', 'Pass:' + response_code.to_s + '-' + resp['id'], row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'CreateInstrumentIdentifier', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'CreateInstrumentIdentifier', 'Fail:' + err.code.to_s, resp['errors'][0]['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  CreateInstrumentIdentifier.new.main
end