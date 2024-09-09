require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetReportingResourceInformation
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportDefinitionsApi.new(api_client, config)
    opts = {}
    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\GetReportingResourceInformation.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    opts[:'organization_id'] = row[1]
    begin
      response_body, response_code, response_headers = api_instance.get_resource_v2_info(opts)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'GetReportingResourceInformation', 'Pass:' + response_code.to_s, row[2], DateTime.now]
        else
          writeToCSV << [row[0], 'GetReportingResourceInformation', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetReportingResourceInformation', 'Fail:' + err.code.to_s, row[2], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetReportingResourceInformation.new.main
end