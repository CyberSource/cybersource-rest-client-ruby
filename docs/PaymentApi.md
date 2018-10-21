# CyberSource::PaymentApi

All URIs are relative to *https://api.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_payment**](PaymentApi.md#create_payment) | **POST** /v2/payments/ | Process a Payment
[**get_payment**](PaymentApi.md#get_payment) | **GET** /v2/payments/{id} | Retrieve a Payment


# **create_payment**
> InlineResponse201 create_payment(create_payment_request)

Process a Payment

Authorize the payment for the transaction. 

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::PaymentApi.new

create_payment_request = CyberSource::CreatePaymentRequest.new # CreatePaymentRequest | 


begin
  #Process a Payment
  result = api_instance.create_payment(create_payment_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentApi->create_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_payment_request** | [**CreatePaymentRequest**](CreatePaymentRequest.md)|  | 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_payment**
> InlineResponse2002 get_payment(id)

Retrieve a Payment

Include the payment ID in the GET request to retrieve the payment details.

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::PaymentApi.new

id = "id_example" # String | The payment ID returned from a previous payment request. 


begin
  #Retrieve a Payment
  result = api_instance.get_payment(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentApi->get_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The payment ID returned from a previous payment request.  | 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



