# CyberSource::PaymentTokensApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**retrieve_or_delete_payment_token**](PaymentTokensApi.md#retrieve_or_delete_payment_token) | **POST** /pts/v2/payment-tokens | Retrieve or Delete Payment Token


# **retrieve_or_delete_payment_token**
> RetrieveOrDeletePaymentTokenResponse retrieve_or_delete_payment_token(payment_token_request)

Retrieve or Delete Payment Token

This API can be used in two flavours - for retrieval or deletion of vault id. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentTokensApi.new

payment_token_request = CyberSource::PaymentTokenRequest.new # PaymentTokenRequest | 


begin
  #Retrieve or Delete Payment Token
  result = api_instance.retrieve_or_delete_payment_token(payment_token_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentTokensApi->retrieve_or_delete_payment_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_token_request** | [**PaymentTokenRequest**](PaymentTokenRequest.md)|  | 

### Return type

[**RetrieveOrDeletePaymentTokenResponse**](RetrieveOrDeletePaymentTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json, application/json; charset=utf-8
 - **Accept**: application/hal+json



