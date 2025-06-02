require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class CreateSearchRequest
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::TssV2TransactionsPostResponse.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::SearchTransactionsApi.new(api_client, config)

    csv_text = File.read("QaScripts\\CSV_Files\\TransactionSearch\\CoreServices\\CreateSearchRequest.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    request.save = "false"
    request.name = row[1]
    request.timezone = "America/Chicago"
    request.query = row[2]
    request.offset = 0
    request.limit = 100
    request.sort = "id:asc,submitTimeUtc:asc"
    begin
      response_body, response_code, response_headers = api_instance.create_search(request)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['name'] == row[1]
          writeToCSV << [row[0], 'CreateSearchRequest', 'Pass:' + response_code.to_s, row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'CreateSearchRequest', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'CreateSearchRequest', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  CreateSearchRequest.new.main
end

