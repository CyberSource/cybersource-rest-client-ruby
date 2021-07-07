require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
public
class GetSubscriptionForReportName
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportSubscriptionsApi.new(api_client, config)

    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\GetSubscriptionForReportName.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    report_Name = row[1]
    begin
      response_body, response_code, response_headers = api_instance.get_subscription(report_Name)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['reportName'] == row[1]
          writeToCSV << [row[0], 'GetSubscriptionForReportName', 'Pass:' + response_code.to_s, row[2], DateTime.now]
        else
          writeToCSV << [row[0], 'GetSubscriptionForReportName', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetSubscriptionForReportName', 'Fail:' + err.code.to_s, err.response_body['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetSubscriptionForReportName.new.main
end


