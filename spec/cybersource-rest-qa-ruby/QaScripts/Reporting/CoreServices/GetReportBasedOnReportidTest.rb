require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetReportBasedOnReportid
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportsApi.new(api_client, config)

    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\GetReportBasedOnReportid.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    opts = {}
    opts[:'organization_id'] = row[1]
    id = row[2]

    begin
      response_body, response_code, response_headers = api_instance.get_report_by_report_id(id, opts)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['reportId'] == row[2]
          writeToCSV << [row[0], 'GetReportBasedOnReportid', 'Pass:' + response_code.to_s, row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'GetReportBasedOnReportid', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetReportBasedOnReportid', 'Fail:' + err.code.to_s, row[3], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetReportBasedOnReportid.new.main
end


