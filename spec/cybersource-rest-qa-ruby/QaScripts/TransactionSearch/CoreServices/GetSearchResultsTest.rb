require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetSearchResults
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::SearchTransactionsApi.new(api_client, config)

    csv_text = File.read("QaScripts\\CSV_Files\\TransactionSearch\\CoreServices\\GetSearchResults.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    id = row[1]
    begin
      response_body, response_code, response_headers = api_instance.get_search(id)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['searchId'] == row[1]
          writeToCSV << [row[0], 'GetSearchResults', 'Pass:' + response_code.to_s, row[2], DateTime.now]
        else
          writeToCSV << [row[0], 'GetSearchResults', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetSearchResults', 'Fail:' + err.code.to_s, row[2], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetSearchResults.new.main
end
