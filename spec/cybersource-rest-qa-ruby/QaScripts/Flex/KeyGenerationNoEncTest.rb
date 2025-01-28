require 'cybersource_rest_client'
require_relative '../../data/Configuration.rb'
# * This is a sample code to call KeyGenerationApi,
# * Generate Key - with Encryption Type as none
# * GeneratePublickey method will create a new Public Key and Key ID

public
class NoEncGeneratekey
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::KeyParameters.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::KeyGenerationApi.new(api_client, config)

    #Reading from input CSV file--
    csv_text = File.read("QaScripts\\CSV_Files\\Flex\\CreateKeyGenerationNoEnc.csv")
    csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|

    request.encryption_type = row[1]
    options = {}
    options[:'generate_public_key_request'] = request
    begin
      response_body, response_code, response_headers = api_instance.generate_public_key(options)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'KeyGenerationNoEncryption', 'Pass:' + response_code.to_s, row[2], DateTime.now]
        elsif resp['keyId'] == nil
          writeToCSV << [row[0], 'KeyGenerationNoEncryption', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        else
          writeToCSV << [row[0], 'KeyGenerationNoEncryption', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'KeyGenerationNoEncryption', 'Fail:' + err.code.to_s, row[2], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  NoEncGeneratekey.new.main
end