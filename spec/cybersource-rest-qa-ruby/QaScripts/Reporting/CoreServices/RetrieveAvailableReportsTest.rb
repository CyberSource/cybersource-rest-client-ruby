require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class RetrieveAvailableReports
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportsApi.new(api_client, config)
    opts = {}
    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\RetrieveAvailableReports.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    start_time = row[1]
    end_time = row[2]
    time_query_type = row[3]
    opts[:'reportMimeType'] = "text/csv"
    begin
      response_body, response_code, response_headers = api_instance.search_reports(start_time, end_time, time_query_type, opts)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'RetrieveAvailableReports', 'Pass:' + response_code.to_s, row[4], DateTime.now]
        else
          writeToCSV << [row[0], 'RetrieveAvailableReports', 'Assertion Failed:' + response_code.to_s, row[4], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'RetrieveAvailableReports', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  RetrieveAvailableReports.new.main
end


