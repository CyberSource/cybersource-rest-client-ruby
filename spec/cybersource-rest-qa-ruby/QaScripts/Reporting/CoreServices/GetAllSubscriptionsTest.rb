require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetAllSubscriptions
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::ReportSubscriptionsApi.new(api_client, config)
    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\GetAllSubscriptions.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    begin
      response_body, response_code, response_headers = api_instance.get_all_subscriptions()
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'GetAllSubscriptions', 'Pass:' + response_code.to_s, row[1], DateTime.now]
        else
          writeToCSV << [row[0], 'GetAllSubscriptions', 'Assertion Failed:' + response_code.to_s, row[1], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetAllSubscriptions', 'Fail:' + err.code.to_s, row[1], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetAllSubscriptions.new.main
end


