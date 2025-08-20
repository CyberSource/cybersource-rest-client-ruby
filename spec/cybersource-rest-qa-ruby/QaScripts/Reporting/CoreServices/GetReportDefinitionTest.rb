require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetReportDefinition
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportDefinitionsApi.new(api_client, config)

    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\GetReportDefinition.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    report_definition_name = row[1]
    begin
      response_body, response_code, response_headers = api_instance.get_resource_info_by_report_definition(report_definition_name)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['reportDefintionName'] == row[1]
          writeToCSV << [row[0], 'GetReportDefinition', 'Pass:' + response_code.to_s, row[2], DateTime.now]
        else
          writeToCSV << [row[0], 'GetReportDefinition', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetReportDefinition', 'Fail:' + err.code.to_s, row[2], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetReportDefinition.new.main
end