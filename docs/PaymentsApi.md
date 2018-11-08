# CyberSource::PaymentsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_payment**](PaymentsApi.md#create_payment) | **POST** /pts/v2/payments/ | Process a Payment


# **create_payment**
> PtsV2PaymentsPost201Response create_payment(create_payment_request)

Process a Payment

Authorize the payment for the transaction. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentsApi.new

create_payment_request = CyberSource::CreatePaymentRequest.new # CreatePaymentRequest | 


begin
  #Process a Payment
  result = api_instance.create_payment(create_payment_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentsApi->create_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_payment_request** | [**CreatePaymentRequest**](CreatePaymentRequest.md)|  | 

### Return type

[**PtsV2PaymentsPost201Response**](PtsV2PaymentsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



