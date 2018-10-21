# CyberSource::RefundApi

All URIs are relative to *https://api.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_refund**](RefundApi.md#get_refund) | **GET** /v2/refunds/{id} | Retrieve a Refund
[**refund_capture**](RefundApi.md#refund_capture) | **POST** /v2/captures/{id}/refunds | Refund a Capture
[**refund_payment**](RefundApi.md#refund_payment) | **POST** /v2/payments/{id}/refunds | Refund a Payment


# **get_refund**
> InlineResponse2005 get_refund(id)

Retrieve a Refund

Include the refund ID in the GET request to to retrieve the refund details.

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::RefundApi.new

id = "id_example" # String | The refund ID. This ID is returned from a previous refund request.


begin
  #Retrieve a Refund
  result = api_instance.get_refund(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling RefundApi->get_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The refund ID. This ID is returned from a previous refund request. | 

### Return type

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **refund_capture**
> InlineResponse2013 refund_capture(refund_capture_request, id)

Refund a Capture

Include the capture ID in the POST request to refund the captured amount. 

### Example
```ruby
# load the gem
require 'cyberSource_client'

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

[**InlineResponse2013**](InlineResponse2013.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **refund_payment**
> InlineResponse2013 refund_payment(refund_payment_request, id)

Refund a Payment

Include the payment ID in the POST request to refund the payment amount. 

### Example
```ruby
# load the gem
require 'cyberSource_client'

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

[**InlineResponse2013**](InlineResponse2013.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



