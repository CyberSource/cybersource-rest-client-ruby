# CyberSource::PaymentTokensApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**retrieve_or_delete_payment_token**](PaymentTokensApi.md#retrieve_or_delete_payment_token) | **POST** /pts/v2/payment-tokens | Retrieve or Delete Payment Token


# **retrieve_or_delete_payment_token**
> InlineResponse201 retrieve_or_delete_payment_token(request)

Retrieve or Delete Payment Token

This API can be used in two flavours - for retrieval or deletion of vault id. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentTokensApi.new

request = CyberSource::Request.new # Request | 


begin
  #Retrieve or Delete Payment Token
  result = api_instance.retrieve_or_delete_payment_token(request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentTokensApi->retrieve_or_delete_payment_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**Request**](Request.md)|  | 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



