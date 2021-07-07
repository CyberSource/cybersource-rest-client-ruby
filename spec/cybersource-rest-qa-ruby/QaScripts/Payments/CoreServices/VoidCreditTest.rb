require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class VoidCredit
  def main
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::VoidCreditRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::VoidApi.new(api_client, config)
		#Reading from input CSV file--
    csv_text = File.read("QaScripts\\CSV_Files\\Payments\\CoreServices\\VoidCredit.csv")
		csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|

    credit_id = row[1]

    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_credit_void"
    request.client_reference_information = client_reference_information
    
    begin
			response_body , response_code, response_headers = api_instance.void_credit(request, credit_id)
			resp = JSON.parse(response_body)
			#Writing to output CSV file
			CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
				if resp['status'] != ConstantUtility::STATUS_VOIDED
					writeToCSV << [row[0], 'VoidCredit', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_VOIDED, DateTime.now]
				elsif resp['id'] == nil
					writeToCSV << [row[0], 'VoidCredit', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
				else
					writeToCSV << [row[0], 'VoidCredit', 'Pass:' + response_code.to_s + '-' + resp['id'], row[2], DateTime.now]
				end
			end
		rescue StandardError => err
			if err.response_body != nil
				resp = JSON.parse(err.response_body)
				#Writing to output CSV file
				CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
				writeToCSV << [row[0], 'VoidCredit', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
				end
			else 
				puts err
			end
		end
	end
	end
	VoidCredit.new.main
end
