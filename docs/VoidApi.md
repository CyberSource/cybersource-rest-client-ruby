# CyberSource::VoidApi

All URIs are relative to *https://api.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_void**](VoidApi.md#get_void) | **GET** /v2/voids/{id} | Retrieve A Void
[**void_capture**](VoidApi.md#void_capture) | **POST** /v2/captures/{id}/voids | Void a Capture
[**void_credit**](VoidApi.md#void_credit) | **POST** /v2/credits/{id}/voids | Void a Credit
[**void_payment**](VoidApi.md#void_payment) | **POST** /v2/payments/{id}/voids | Void a Payment
[**void_refund**](VoidApi.md#void_refund) | **POST** /v2/refunds/{id}/voids | Void a Refund


# **get_void**
> InlineResponse2015 get_void(id)

Retrieve A Void

Include the void ID in the GET request to retrieve the void details.

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::VoidApi.new

id = "id_example" # String | The void ID returned from a previous void request.


begin
  #Retrieve A Void
  result = api_instance.get_void(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling VoidApi->get_void: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The void ID returned from a previous void request. | 

### Return type

[**InlineResponse2015**](InlineResponse2015.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **void_capture**
> InlineResponse2015 void_capture(void_capture_request, id)

Void a Capture

Include the capture ID in the POST request to cancel the capture.

### Example
```ruby
# load the gem
require 'cyberSource_client'

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

[**InlineResponse2015**](InlineResponse2015.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **void_credit**
> InlineResponse2015 void_credit(void_credit_request, id)

Void a Credit

Include the credit ID in the POST request to cancel the credit.

### Example
```ruby
# load the gem
require 'cyberSource_client'

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

[**InlineResponse2015**](InlineResponse2015.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **void_payment**
> InlineResponse2015 void_payment(void_payment_request, id)

Void a Payment

Include the payment ID in the POST request to cancel the payment.

### Example
```ruby
# load the gem
require 'cyberSource_client'

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

[**InlineResponse2015**](InlineResponse2015.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **void_refund**
> InlineResponse2015 void_refund(void_refund_request, id)

Void a Refund

Include the refund ID in the POST request to cancel the refund.

### Example
```ruby
# load the gem
require 'cyberSource_client'

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

[**InlineResponse2015**](InlineResponse2015.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



