require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetUserInformation
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::UserManagementApi.new(api_client, config)
    opts = {}
    csv_text = File.read("QaScripts\\CSV_Files\\UserManagement\\CoreServices\\GetUserInformation.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    opts[:'organization_id'] = row[1]
    begin
      response_body, response_code, response_headers = api_instance.get_users(opts)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['users'][0]['organizationInformation']['organizationId'] == row[1]
          writeToCSV << [row[0], 'GetUserInformation', 'Pass:' + response_code.to_s, row[5], DateTime.now]
        else
          writeToCSV << [row[0], 'GetUserInformation', 'Assertion Failed:' + response_code.to_s, row[5], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetUserInformation', 'Fail:' + err.code.to_s, row[5], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetUserInformation.new.main
end
