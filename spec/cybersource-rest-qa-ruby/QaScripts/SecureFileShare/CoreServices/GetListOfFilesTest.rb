require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetListOfFiles
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::SecureFileShareApi.new(api_client, config)
    opts = {}
    csv_text = File.read("QaScripts\\CSV_Files\\SecureFileShare\\CoreServices\\GetListOfFiles.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    start_date = row[2]
    end_date = row[3]
    opts[:'organization_id'] = row[1]
    begin
      response_body, response_code, response_headers = api_instance.get_file_details(start_date, end_date, opts)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'GetListOfFiles', 'Pass:' + response_code.to_s, row[4], DateTime.now]
        else
          writeToCSV << [row[0], 'GetListOfFiles', 'Assertion Failed:' + response_code.to_s, row[4], DateTime.now]
        end
    end
    rescue StandardError => err
      if err.response_body != nil
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetListOfFiles', 'Fail:' + err.code.to_s, err.response_body, DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetListOfFiles.new.main
end


