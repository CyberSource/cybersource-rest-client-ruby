# CyberSource::VoidApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**mit_void**](VoidApi.md#mit_void) | **POST** /pts/v2/voids/ | Merchant Initiated Void
[**void_capture**](VoidApi.md#void_capture) | **POST** /pts/v2/captures/{id}/voids | Void a Capture
[**void_credit**](VoidApi.md#void_credit) | **POST** /pts/v2/credits/{id}/voids | Void a Credit
[**void_payment**](VoidApi.md#void_payment) | **POST** /pts/v2/payments/{id}/voids | Void a Payment
[**void_refund**](VoidApi.md#void_refund) | **POST** /pts/v2/refunds/{id}/voids | Void a Refund


# **mit_void**
> PtsV2PaymentsVoidsPost201Response mit_void(mit_void_request)

Merchant Initiated Void

This is to void a previous payment, capture, refund, or credit that merchant does not receive a reply.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::VoidApi.new

mit_void_request = CyberSource::MitVoidRequest.new # MitVoidRequest | 


begin
  #Merchant Initiated Void
  result = api_instance.mit_void(mit_void_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling VoidApi->mit_void: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **mit_void_request** | [**MitVoidRequest**](MitVoidRequest.md)|  | 

### Return type

[**PtsV2PaymentsVoidsPost201Response**](PtsV2PaymentsVoidsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **void_capture**
> PtsV2PaymentsVoidsPost201Response void_capture(void_capture_request, id)

Void a Capture

Include the capture ID in the POST request to cancel the capture.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::VoidApi.new

void_capture_request = CyberSource::VoidCaptureRequest.new # VoidCaptureRequest | 

id = "id_example" # String | The capture ID returned from a previous capture request.


begin
  #Void a Capture
  result = api_instance.void_capture(void_capture_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling VoidApi->void_capture: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **void_capture_request** | [**VoidCaptureRequest**](VoidCaptureRequest.md)|  | 
 **id** | **String**| The capture ID returned from a previous capture request. | 

### Return type

[**PtsV2PaymentsVoidsPost201Response**](PtsV2PaymentsVoidsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **void_credit**
> PtsV2PaymentsVoidsPost201Response void_credit(void_credit_request, id)

Void a Credit

Include the credit ID in the POST request to cancel the credit.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::VoidApi.new

void_credit_request = CyberSource::VoidCreditRequest.new # VoidCreditRequest | 

id = "id_example" # String | The credit ID returned from a previous credit request.


begin
  #Void a Credit
  result = api_instance.void_credit(void_credit_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling VoidApi->void_credit: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **void_credit_request** | [**VoidCreditRequest**](VoidCreditRequest.md)|  | 
 **id** | **String**| The credit ID returned from a previous credit request. | 

### Return type

[**PtsV2PaymentsVoidsPost201Response**](PtsV2PaymentsVoidsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **void_payment**
> PtsV2PaymentsVoidsPost201Response void_payment(void_payment_request, id)

Void a Payment

Include the payment ID in the POST request to cancel the payment.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::VoidApi.new

void_payment_request = CyberSource::VoidPaymentRequest.new # VoidPaymentRequest | 

id = "id_example" # String | The payment ID returned from a previous payment request.


begin
  #Void a Payment
  result = api_instance.void_payment(void_payment_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling VoidApi->void_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **void_payment_request** | [**VoidPaymentRequest**](VoidPaymentRequest.md)|  | 
 **id** | **String**| The payment ID returned from a previous payment request. | 

### Return type

[**PtsV2PaymentsVoidsPost201Response**](PtsV2PaymentsVoidsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **void_refund**
> PtsV2PaymentsVoidsPost201Response void_refund(void_refund_request, id)

Void a Refund

Include the refund ID in the POST request to cancel the refund.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::VoidApi.new

void_refund_request = CyberSource::VoidRefundRequest.new # VoidRefundRequest | 

id = "id_example" # String | The refund ID returned from a previous refund request.


begin
  #Void a Refund
  result = api_instance.void_refund(void_refund_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling VoidApi->void_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **void_refund_request** | [**VoidRefundRequest**](VoidRefundRequest.md)|  | 
 **id** | **String**| The refund ID returned from a previous refund request. | 

### Return type

[**PtsV2PaymentsVoidsPost201Response**](PtsV2PaymentsVoidsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



