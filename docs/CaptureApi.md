# CyberSource::CaptureApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**capture_payment**](CaptureApi.md#capture_payment) | **POST** /pts/v2/payments/{id}/captures | Capture a Payment


# **capture_payment**
> PtsV2PaymentsCapturesPost201Response capture_payment(capture_payment_request, id)

Capture a Payment

Include the payment ID in the POST request to capture the payment amount.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CaptureApi.new

capture_payment_request = CyberSource::CapturePaymentRequest.new # CapturePaymentRequest | 

id = 'id_example' # String | The payment ID returned from a previous payment request. This ID links the capture to the payment. 


begin
  #Capture a Payment
  result = api_instance.capture_payment(capture_payment_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CaptureApi->capture_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **capture_payment_request** | [**CapturePaymentRequest**](CapturePaymentRequest.md)|  | 
 **id** | **String**| The payment ID returned from a previous payment request. This ID links the capture to the payment.  | 

### Return type

[**PtsV2PaymentsCapturesPost201Response**](PtsV2PaymentsCapturesPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



