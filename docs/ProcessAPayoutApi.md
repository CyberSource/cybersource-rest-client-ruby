# CyberSource::ProcessAPayoutApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**oct_create_payment**](ProcessAPayoutApi.md#oct_create_payment) | **POST** /pts/v2/payouts/ | Process a Payout


# **oct_create_payment**
> oct_create_payment(oct_create_payment_request)

Process a Payout

Send funds from a selected funding source to a designated credit/debit card account or a prepaid card using an Original Credit Transaction (OCT). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ProcessAPayoutApi.new

oct_create_payment_request = CyberSource::PtsV2PayoutsPostResponse.new # PtsV2PayoutsPostResponse | 


begin
  #Process a Payout
  api_instance.oct_create_payment(oct_create_payment_request)
rescue CyberSource::ApiError => e
  puts "Exception when calling ProcessAPayoutApi->oct_create_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oct_create_payment_request** | [**PtsV2PayoutsPostResponse**](PtsV2PayoutsPostResponse.md)|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



