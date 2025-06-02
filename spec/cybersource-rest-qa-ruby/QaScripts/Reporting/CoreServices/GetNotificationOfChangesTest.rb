require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetNotificationOfChanges
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::NotificationOfChangesApi.new(api_client, config)
    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\GetNotificationOfChanges.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    start_time = row[1]
    end_time = row[2]
    begin
      response_body , response_code, response_headers = api_instance.get_notification_of_change_report(start_time, end_time)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'GetNotificationOfChanges', 'Pass:' + response_code.to_s, row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'GetNotificationOfChanges', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetNotificationOfChanges', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetNotificationOfChanges.new.main
end


