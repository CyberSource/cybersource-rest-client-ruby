require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class CreateAdhocReport
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    request= CyberSource::RequestBody1.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportsApi.new(api_client, config)

    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\CreateAdhocReport.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|

    request.report_definition_name = row[1]
    request.report_fields=[
      "Request.RequestID",
      "Request.TransactionDate",
      "Request.MerchantID"
    ]
    request.report_mime_type="application/xml"
    request.timezone = "GMT"
    request.report_name = row[2]
    request.report_start_time = row[3]
    request.report_end_time = row[4]
    report_pref = {}
    report_pref['SignedAmounts'] = "true"
    report_pref['fieldNameConvention'] = "SOAPI"
    request.report_preferences = report_pref
    
    begin
      response_body, response_code, response_headers = api_instance.create_report(request)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'CreateAdhocReport', 'Pass:' + response_code.to_s, row[5], DateTime.now]
        else
          writeToCSV << [row[0], 'CreateAdhocReport', 'Assertion Failed:' + response_code.to_s, row[5], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'CreateAdhocReport', 'Fail:' + err.code.to_s, resp['message'] + '-' + resp['fields'][0]['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  CreateAdhocReport.new.main
end