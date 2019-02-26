require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class DeleteSubscriptionOfReportNameByOrganization
  def main(report_name)
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportSubscriptionsApi.new(api_client, config)
    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\DeleteSubscriptionOfReportNameByOrganization.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    report_name = row[1]
    begin
      response_body, response_code, response_headers = api_instance.delete_subscription(report_name)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'DeleteSubscriptionOfReportNameByOrganization', 'Pass:' + response_code.to_s, row[2], DateTime.now]
        else
          writeToCSV << [row[0], 'DeleteSubscriptionOfReportNameByOrganization', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'DeleteSubscriptionOfReportNameByOrganization', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  DeleteSubscriptionOfReportNameByOrganization.new.main("testrest_subcription_v1")
end


