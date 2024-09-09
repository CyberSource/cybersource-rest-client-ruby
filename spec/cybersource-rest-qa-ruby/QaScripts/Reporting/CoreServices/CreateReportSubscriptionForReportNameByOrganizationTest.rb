require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class CreateReportSubscriptionForReportNameByOrganization
  def main()
   config = MerchantConfiguration.new.merchantConfigProp()
   request= CyberSource::RequestBody.new
   api_client = CyberSource::ApiClient.new
   api_instance = CyberSource::ReportSubscriptionsApi.new(api_client, config)
   csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\CreateReportSubscriptionForReportNameByOrganization.csv")
   csv = CSV.parse(csv_text, :headers => true)
   csv.each do |row|
   request.report_definition_name=row[1]
   request.report_fields=[
         "Request.RequestID",
         "Request.TransactionDate",
         "Request.MerchantID"
   ]
   request.report_mime_type="text/csv"
   request.report_name = row[2]
   request.report_frequency= row[3]
   request.timezone="America/Chicago"
   request.start_time="0406"
   request.start_day=1
    begin
      response_body, response_code, response_headers = api_instance.create_subscription(request)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'CreateReportSubscriptionForReportNameByOrganization', 'Pass:' + response_code.to_s, row[4], DateTime.now]
        else
          writeToCSV << [row[0], 'CreateReportSubscriptionForReportNameByOrganization', 'Assertion Failed:' + response_code.to_s, row[4], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'CreateReportSubscriptionForReportNameByOrganization', 'Fail:' + err.code.to_s, resp['message'] + '-' + resp['fields'][0]['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  CreateReportSubscriptionForReportNameByOrganization.new.main
end
