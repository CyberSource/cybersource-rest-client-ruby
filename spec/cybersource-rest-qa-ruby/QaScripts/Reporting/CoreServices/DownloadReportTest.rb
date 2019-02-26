require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require 'csv'

public
class DownloadReport
  def main()
    file_path = "..\\cybersource-rest-qa-ruby\\resource\\DownloadReport.xml"
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportDownloadsApi.new(api_client, config)
    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\DownloadReport.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    opts = {}
    opts[:'organization_id'] = row[1]
    reportName = row[2]
    reportDate = row[3]
    begin
      response_body, response_code, response_headers = api_instance.download_report(reportDate, reportName, opts)
      if response_body != nil
        f = File.new(file_path,"w")
        f.write(response_body)
        f.close
      end
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil && response_body != nil
          writeToCSV << [row[0], 'DownloadReport', 'Pass:' + response_code.to_s, row[4], DateTime.now]
        else
          writeToCSV << [row[0], 'DownloadReport', 'Assertion Failed:' + response_code.to_s, row[4], DateTime.now]
        end
    end
    rescue StandardError => err
      if err.response_body != nil
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'DownloadReport', 'Fail:' + err.code.to_s, row[4], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  DownloadReport.new.main
end


