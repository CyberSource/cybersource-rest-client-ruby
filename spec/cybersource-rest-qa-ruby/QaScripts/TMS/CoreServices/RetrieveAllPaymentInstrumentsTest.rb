require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class RetrieveAllPaymentInstruments
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PaymentInstrumentsApi.new(api_client, config)

    #Reading from input CSV file
    csv_text = File.read("QaScripts\\CSV_Files\\TMS\\CoreServices\\RetrieveAllPaymentInstruments.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    profile_id = row[1]
    token_id = row[2]
    begin
      response_body, response_code, response_headers = api_instance.tms_v1_instrumentidentifiers_token_id_paymentinstruments_get(profile_id, token_id)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['_links']['self']['href'].include? row[2]
          writeToCSV << [row[0], 'RetrieveAllPaymentInstruments', 'Pass:' + response_code.to_s + '-' + row[2], row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'RetrieveAllPaymentInstruments', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'RetrieveAllPaymentInstruments', 'Fail:' + err.code.to_s, resp['errors'][0]['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  RetrieveAllPaymentInstruments.new.main
end
