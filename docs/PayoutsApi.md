# CyberSource::PayoutsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**oct_create_payment**](PayoutsApi.md#oct_create_payment) | **POST** /pts/v2/payouts | Process a Payout


# **oct_create_payment**
> PtsV2PayoutsPost201Response oct_create_payment(oct_create_payment_request)

Process a Payout

Send funds from a selected funding source to a designated credit/debit card account or a prepaid card using an Original Credit Transaction (OCT). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PayoutsApi.new

oct_create_payment_request = CyberSource::OctCreatePaymentRequest.new # OctCreatePaymentRequest | 


begin
  #Process a Payout
  result = api_instance.oct_create_payment(oct_create_payment_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PayoutsApi->oct_create_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oct_create_payment_request** | [**OctCreatePaymentRequest**](OctCreatePaymentRequest.md)|  | 

### Return type

[**PtsV2PayoutsPost201Response**](PtsV2PayoutsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



