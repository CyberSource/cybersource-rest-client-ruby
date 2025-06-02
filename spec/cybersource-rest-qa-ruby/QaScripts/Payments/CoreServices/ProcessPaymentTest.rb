require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'
require_relative '../../ConstantUtility.rb'

# * This is a sample code to call PaymentApi,
# * for Core Services - Process Payment
# * createPayment method will create a new payment

public
class CreatePayment
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    request = CyberSource::CreatePaymentRequest.new
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PaymentsApi.new(api_client, config)

    #Reading from Input CSV file
    csv_text = File.read("QaScripts\\CSV_Files\\Payments\\CoreServices\\CreateProcessPayment.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|

    client_reference_information = CyberSource::Ptsv2paymentsClientReferenceInformation.new
    client_reference_information.code = "test_payment"
    request.client_reference_information = client_reference_information
    processing_information = CyberSource::Ptsv2paymentsProcessingInformation.new
  
    aggregator_information = CyberSource::Ptsv2paymentsAggregatorInformation.new
    sub_merchant_information = CyberSource::Ptsv2paymentsAggregatorInformationSubMerchant.new
    sub_merchant_information.card_acceptor_id = "1234567890"
    sub_merchant_information.country = "US"
    sub_merchant_information.phone_number = "4158880000"
    sub_merchant_information.address1 = "1 Market St"
    sub_merchant_information.postal_code = "94105"
    sub_merchant_information.locality = "san francisco"
    sub_merchant_information.name = "Visa Inc"
    sub_merchant_information.administrative_area = "CA"
    sub_merchant_information.region = "PEN"
    sub_merchant_information.email = "test@cybs.com"
    aggregator_information.sub_merchant = sub_merchant_information
    aggregator_information.name = "V-Internatio"
    aggregator_information.aggregator_id = "123456789"
    request.aggregator_information = aggregator_information
    
    order_information = CyberSource::Ptsv2paymentsOrderInformation.new
    bill_to_information = CyberSource::Ptsv2paymentsOrderInformationBillTo.new
    bill_to_information.country = "US"
    bill_to_information.last_name = "Deo"
    bill_to_information.address2 = "Address 2"
    bill_to_information.address1 = "1 Market St"
    bill_to_information.postal_code = "94105"
    bill_to_information.locality = "san francisco"
    bill_to_information.administrative_area = "CA"
    bill_to_information.first_name = "John"
    bill_to_information.phone_number = "4158880000"
    bill_to_information.district = "MI"
    bill_to_information.building_number = "123"
    bill_to_information.company = "Visa"
    bill_to_information.email = "test@cybs.com"
    order_information.bill_to = bill_to_information
    request.order_information = order_information

    amount_information = CyberSource::Ptsv2paymentsOrderInformationAmountDetails.new
    amount_information.total_amount = row[1]
    amount_information.currency = "USD"
    order_information.amount_details = amount_information
    request.order_information = order_information

    payment_information = CyberSource::Ptsv2paymentsPaymentInformation.new
    card_information =CyberSource::Ptsv2paymentsPaymentInformationCard.new
    card_information.expiration_year = "2031"
    card_information.number = "5555555555554444"
    card_information.security_code = "123"
    card_information.expiration_month = "12"
    card_information.type = "002"
    payment_information.card = card_information
    request.payment_information = payment_information
    begin
      response_body , response_code, response_headers = api_instance.create_payment(request)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if resp['status'] != ConstantUtility::STATUS_AUTHORIZED
          writeToCSV << [row[0], 'ProcessPayment', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_AUTHORIZE, DateTime.now]
        elsif resp['id'] == nil
          writeToCSV << [row[0], 'ProcessPayment', 'Assertion Failed:' + response_code.to_s, ConstantUtility::MESSAGE_NULL_ID, DateTime.now]
        elsif resp['orderInformation']['amountDetails']['authorizedAmount'] == row[1]
          writeToCSV << [row[0], 'ProcessPayment', 'Pass:' + response_code.to_s + '-' + resp['id'], row[2], DateTime.now]
        else
          writeToCSV << [row[0], 'ProcessPayment', 'Assertion Failed:' + response_code.to_s, row[2], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'ProcessPayment', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  CreatePayment.new.main
end
