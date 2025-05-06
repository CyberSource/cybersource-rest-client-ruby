require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetListOfBatchFiles
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::TransactionBatchesApi.new(api_client, config)

    csv_text = File.read("QaScripts\\CSV_Files\\TransactionBatches\\CoreServices\\GetListOfBatchFiles.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    start_time = row[1]
    end_time = row[2]
    begin
     response_body, response_code, response_headers = api_instance.pts_v1_transaction_batches_get(start_time, end_time)
     resp = JSON.parse(response_body)
     #Writing to output CSV file
     CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
      if response_code != nil
        writeToCSV << [row[0], 'GetListOfBatchFiles', 'Pass:' + response_code.to_s, row[3], DateTime.now]
      else
        writeToCSV << [row[0], 'GetListOfBatchFiles', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
      end
     end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetListOfBatchFiles', 'Fail:' + err.code.to_s, resp['message'] + '-' + resp['invalidFields']['reasonMessage'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetListOfBatchFiles.new.main
end


