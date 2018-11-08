# CyberSource::FlexTokenApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tokenize**](FlexTokenApi.md#tokenize) | **POST** /flex/v1/tokens/ | Flex Tokenize card


# **tokenize**
> FlexV1TokensPost200Response tokenize(opts)

Flex Tokenize card

Returns a token representing the supplied card details. The token replaces card data and can be used as the Subscription ID in the CyberSource Simple Order API or SCMP API. This is an unauthenticated call that you should initiate from your customer’s device or browser.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::FlexTokenApi.new

opts = { 
  tokenize_request: CyberSource::TokenizeRequest.new # TokenizeRequest | 
}

begin
  #Flex Tokenize card
  result = api_instance.tokenize(opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling FlexTokenApi->tokenize: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenize_request** | [**TokenizeRequest**](TokenizeRequest.md)|  | [optional] 

### Return type

[**FlexV1TokensPost200Response**](FlexV1TokensPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json



