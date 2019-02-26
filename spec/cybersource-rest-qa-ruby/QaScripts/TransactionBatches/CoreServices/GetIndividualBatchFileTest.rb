require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetIndividualBatchFile
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::TransactionBatchApi.new(api_client, config)

    csv_text = File.read("QaScripts\\CSV_Files\\TransactionBatches\\CoreServices\\GetIndividualBatchFile.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    id = row[1]
    begin
     response_body, response_code, response_headers = api_instance.pts_v1_transaction_batches_id_get(id)
     resp = JSON.parse(response_body)
     #Writing to output CSV file
     CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
      if resp['id'] == row[1]
        writeToCSV << [row[0], 'GetIndividualBatchFile', 'Pass:' + response_code.to_s, row[2], DateTime.now]
      else
        writeToCSV << [row[0], 'GetIndividualBatchFile', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
      end
     end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetIndividualBatchFile', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetIndividualBatchFile.new.main
end


