# CyberSource::DefaultApi

All URIs are relative to *https://api.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**oct_create_payment**](DefaultApi.md#oct_create_payment) | **POST** /v2/payouts/ | Process a Payout


# **oct_create_payment**
> oct_create_payment(oct_create_payment_request)

Process a Payout

Send funds from a selected funding source to a designated credit/debit card account or a prepaid card using an Original Credit Transaction (OCT). 

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::DefaultApi.new

oct_create_payment_request = CyberSource::OctCreatePaymentRequest.new # OctCreatePaymentRequest | 


begin
  #Process a Payout
  api_instance.oct_create_payment(oct_create_payment_request)
rescue CyberSource::ApiError => e
  puts "Exception when calling DefaultApi->oct_create_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **oct_create_payment_request** | [**OctCreatePaymentRequest**](OctCreatePaymentRequest.md)|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



