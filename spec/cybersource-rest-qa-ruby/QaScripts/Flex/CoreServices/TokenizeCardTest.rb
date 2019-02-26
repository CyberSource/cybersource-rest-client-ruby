require 'cybersource_rest_client'
require_relative '../VerifyTokenTest.rb'
require_relative '../../../data/Configuration.rb'

# * This is a sample code to call Tokenization Api which will return key and
# * TokenizationApi Returns a token representing the supplied card details.
# * to verify the token with the key generated.

public
class TokenizeCard
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::TokenizeRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::FlexTokenApi.new(api_client, config)
    
    card_info = CyberSource::Flexv1tokensCardInfo.new
    card_info.card_number = "5555555555554444"
    card_info.card_expiration_month = "03"
    card_info.card_expiration_year = "2031"
    card_info.card_type = "002"
    request.card_info = card_info

    #Reading from input CSV file--
    csv_text = File.read("QaScripts\\CSV_Files\\Flex\\CoreServices\\CreateTokenizeCard.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    request.key_id = row[1]
    options = {}
    options[:'tokenize_request'] = request
    begin
      response_body, response_code, response_headers = api_instance.tokenize(options)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'TokenizeCard', 'Pass:' + response_code.to_s, row[2], DateTime.now]
        elsif resp['keyId'] == nil
          writeToCSV << [row[0], 'TokenizeCard', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        else
          writeToCSV << [row[0], 'TokenizeCard', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'TokenizeCard','Fail:' + err.code.to_s, resp['responseStatus']['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  TokenizeCard.new.main
end
