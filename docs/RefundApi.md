# CyberSource::RefundApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**refund_capture**](RefundApi.md#refund_capture) | **POST** /pts/v2/captures/{id}/refunds | Refund a Capture
[**refund_payment**](RefundApi.md#refund_payment) | **POST** /pts/v2/payments/{id}/refunds | Refund a Payment


# **refund_capture**
> PtsV2PaymentsRefundPost201Response refund_capture(refund_capture_request, id)

Refund a Capture

Include the capture ID in the POST request to refund the captured amount. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::RefundApi.new

refund_capture_request = CyberSource::RefundCaptureRequest.new # RefundCaptureRequest | 

id = "id_example" # String | The capture ID. This ID is returned from a previous capture request.


begin
  #Refund a Capture
  result = api_instance.refund_capture(refund_capture_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling RefundApi->refund_capture: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refund_capture_request** | [**RefundCaptureRequest**](RefundCaptureRequest.md)|  | 
 **id** | **String**| The capture ID. This ID is returned from a previous capture request. | 

### Return type

[**PtsV2PaymentsRefundPost201Response**](PtsV2PaymentsRefundPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **refund_payment**
> PtsV2PaymentsRefundPost201Response refund_payment(refund_payment_request, id)

Refund a Payment

Include the payment ID in the POST request to refund the payment amount. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::RefundApi.new

refund_payment_request = CyberSource::RefundPaymentRequest.new # RefundPaymentRequest | 

id = "id_example" # String | The payment ID. This ID is returned from a previous payment request.


begin
  #Refund a Payment
  result = api_instance.refund_payment(refund_payment_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling RefundApi->refund_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **refund_payment_request** | [**RefundPaymentRequest**](RefundPaymentRequest.md)|  | 
 **id** | **String**| The payment ID. This ID is returned from a previous payment request. | 

### Return type

[**PtsV2PaymentsRefundPost201Response**](PtsV2PaymentsRefundPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



