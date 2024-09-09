require 'cybersource_rest_client'
require_relative '../../../data/Configuration.rb'

public
class GetPurchaseAndRefundDetails
  def main()
    config = MerchantConfiguration.new.merchantConfigProp()
    api_client = CyberSource::ApiClient.new
    api_instance = CyberSource::PurchaseAndRefundDetailsApi.new(api_client, config)
    csv_text = File.read("QaScripts\\CSV_Files\\Reporting\\CoreServices\\GetPurchaseAndRefundDetails.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
    start_time = row[1]
    end_time = row[2]
    opts = {}
    opts[:'organizationId'] = "testrest"
    opts[:'paymentSubtype'] =  "VI"
    opts[:'viewBy'] =  "requestDate"
    opts[:'groupName'] = "groupName"
    opts[:'offset'] = 20
    opts[:'limit'] = 200
    begin
      response_body, response_code, response_headers = api_instance.get_purchase_and_refund_details(start_time, end_time, opts)
      resp = JSON.parse(response_body)
      #Writing to output CSV file
      CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
        if response_code != nil
          writeToCSV << [row[0], 'GetPurchaseAndRefundDetails', 'Pass:' + response_code.to_s, row[4], DateTime.now]
        else
          writeToCSV << [row[0], 'GetPurchaseAndRefundDetails', 'Assertion Failed:' + response_code.to_s, row[4], DateTime.now]
        end
      end
    rescue StandardError => err
      if err.response_body != nil
        resp = JSON.parse(err.response_body)
        #Writing to output CSV file
        CSV.open("QaScripts\\CSV_Files\\TestReport\\TestResults.csv", "a+") do |writeToCSV|
          writeToCSV << [row[0], 'GetPurchaseAndRefundDetails', 'Fail:' + err.code.to_s, resp['message'], DateTime.now]
        end
      else 
        puts err
      end
    end
  end
  end
  GetPurchaseAndRefundDetails.new.main
end


