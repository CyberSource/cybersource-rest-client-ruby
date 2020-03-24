# CyberSource::PaymentBatchSummariesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_payment_batch_summary**](PaymentBatchSummariesApi.md#get_payment_batch_summary) | **GET** /reporting/v3/payment-batch-summaries | Get Payment Batch Summary Data


# **get_payment_batch_summary**
> ReportingV3PaymentBatchSummariesGet200Response get_payment_batch_summary(start_time, end_time, opts)

Get Payment Batch Summary Data

Scope can be either account/merchant or reseller.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentBatchSummariesApi.new

start_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

end_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

opts = { 
  organization_id: "organization_id_example", # String | Valid Cybersource Organization Id
  roll_up: "roll_up_example", # String | Conditional - RollUp for data for day/week/month. Required while getting breakdown data for a Merchant
  breakdown: "breakdown_example", # String | Conditional - Breakdown on account_rollup/all_merchant/selected_merchant. Required while getting breakdown data for a Merchant.
  start_day_of_week: 56 # Integer | Optional - Start day of week to breakdown data for weeks in a month
}

begin
  #Get Payment Batch Summary Data
  result = api_instance.get_payment_batch_summary(start_time, end_time, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentBatchSummariesApi->get_payment_batch_summary: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_time** | **DateTime**| Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **end_time** | **DateTime**| Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 
 **roll_up** | **String**| Conditional - RollUp for data for day/week/month. Required while getting breakdown data for a Merchant | [optional] 
 **breakdown** | **String**| Conditional - Breakdown on account_rollup/all_merchant/selected_merchant. Required while getting breakdown data for a Merchant. | [optional] 
 **start_day_of_week** | **Integer**| Optional - Start day of week to breakdown data for weeks in a month | [optional] 

### Return type

[**ReportingV3PaymentBatchSummariesGet200Response**](ReportingV3PaymentBatchSummariesGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



