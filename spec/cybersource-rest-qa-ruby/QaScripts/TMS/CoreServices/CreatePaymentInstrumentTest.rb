require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

public
class CreatePaymentIdentifier
  def main
   config = MerchantConfiguration.new.merchantConfigProp()
   request = CyberSource::Body2.new
   api_client = CyberSource::ApiClient.new
   api_instance = CyberSource::PaymentInstrumentsApi.new(api_client, config)

    #Reading from input CSV file--
    csv_text = File.read("QaScripts\\CSV_Files\\TMS\\CoreServices\\CreatePaymentsInstrument.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    profile_id = row[1]
    card = CyberSource::Tmsv1paymentinstrumentsCard.new
    card.expiration_month = "09"
    card.expiration_year = "2022"
    card.type = "visa"
    request.card = card

    bill_to = CyberSource::Tmsv1paymentinstrumentsBillTo.new
    bill_to.first_name = "John"
    bill_to.last_name = "Deo"
    bill_to.company = "CyberSource"
    bill_to.address1 = "12 Main Street"
    bill_to.address2 = "20 My Street"
    bill_to.locality = "Foster City"
    bill_to.administrative_area = "CA"
    bill_to.postal_code = "90200"
    bill_to.country = "US"
    bill_to.email = "john.smith@example.com"
    bill_to.phone_number = "555123456"
    request.bill_to = bill_to
      
    instrument_identifier_card = CyberSource::Tmsv1instrumentidentifiersCard.new
    instrument_identifier_card.number = "4111111111111111"

    instrument_identifier = CyberSource::Tmsv1paymentinstrumentsInstrumentIdentifier.new
    instrument_identifier.card = instrument_identifier_card
    request.instrument_identifier = instrument_identifier

    begin
      response_body , response_code, response_headers  = api_instance.tms_v1_paymentinstruments_post(profile_id, request)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['state'] != ConstantUtility::STATE_ACTIVE
          writeToCSV << [row[0], 'CreatePaymentInstrument', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_ACTIVE, DateTime.now]
        elsif resp['id'] == nil
          writeToCSV << [row[0], 'CreatePaymentInstrument', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        elsif response_code != nil
          writeToCSV << [row[0], 'CreatePaymentInstrument', 'Pass:' + response_code.to_s + '-' + resp['id'], row[2], DateTime.now]
        else
          writeToCSV << [row[0], 'CreatePaymentInstrument', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'CreatePaymentInstrument', 'Fail:' + err.code.to_s, resp['errors'][0]['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  CreatePaymentIdentifier.new.main
end