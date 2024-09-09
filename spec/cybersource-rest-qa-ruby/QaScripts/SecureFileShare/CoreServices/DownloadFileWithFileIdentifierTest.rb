require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class DownloadFileWithFileIdentifier
  def main()
    file_path = "..\\cybersource-rest-qa-ruby\\resource\\DownloadFileWithFileIdentifier.csv"
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::SecureFileShareApi.new(api_client, config)
    opts = {}
    csv_text = File.read("QaScripts\\CSV_Files\\SecureFileShare\\CoreServices\\DownloadFileWithFileIdentifier.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    file_id = row[2]
    opts[:'organization_id'] = row[1]
    begin
      response_body, response_code, response_headers = api_instance.get_file(file_id, opts)
      if response_body != nil
        f = File.new(file_path,"w")
        f.write(response_body)
        f.close
      end
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil && response_body != nil
          writeToCSV << [row[0], 'DownloadFileWithFileIdentifier', 'Pass:' + response_code.to_s, row[3], DateTime.now]
        else
          writeToCSV << [row[0], 'DownloadFileWithFileIdentifier', 'Assertion Failed:' + response_code.to_s, row[3], DateTime.now]
        end
    end
    rescue StandardError => err
      if err.response_body != nil
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'DownloadFileWithFileIdentifier', 'Fail:' + err.code.to_s, row[3], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  DownloadFileWithFileIdentifier.new.main
end


