require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class RetrieveInstrumentIdentifier
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::InstrumentIdentifierApi.new(api_client, config)

    #Reading from input CSV file--
    csv_text = File.read("QaScripts\\CSV_Files\\TMS\\CoreServices\\RetrieveInstrumentIdentifier.csv")
    csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        profile_id = row[1]
    begin
      response_body , response_code, response_headers = api_instance.tms_v1_instrumentidentifiers_token_id_get(profile_id, row[2])
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['state'] != ConstantUtility::STATE_ACTIVE
          writeToCSV << [row[0], 'RetrieveInstrumentIdentifier', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_ACTIVE, DateTime.now]
        elsif resp['id'] == nil
          writeToCSV << [row[0], 'RetrieveInstrumentIdentifier', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        elsif resp['id'] == row[2]
          writeToCSV << [row[0], 'RetrieveInstrumentIdentifier', 'Pass:' + response_code.to_s + '-' + resp['id'], row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'RetrieveInstrumentIdentifier', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'RetrieveInstrumentIdentifier', 'Fail:' + err.code.to_s, resp['errors'][0]['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  RetrieveInstrumentIdentifier.new.main
end
