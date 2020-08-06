# CyberSource::KeyGenerationApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**generate_public_key**](KeyGenerationApi.md#generate_public_key) | **POST** /flex/v1/keys | Generate Key


# **generate_public_key**
> FlexV1KeysPost200Response generate_public_key(format, generate_public_key_request)

Generate Key

Generate a one-time use public key and key ID to encrypt the card number in the follow-on Tokenize Card request. The key used to encrypt the card number on the cardholder’s device or browser is valid for 15 minutes and must be used to verify the signature in the response message. CyberSource recommends creating a new key for each order. Generating a key is an authenticated request initiated from your servers, prior to requesting to tokenize the card data from your customer’s device or browser.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::KeyGenerationApi.new

format = "JWT" # String | Indicator to enable the receipt of the Keys response in Flex 11+ format (JWT) or legacy (parameter not required)

generate_public_key_request = CyberSource::GeneratePublicKeyRequest.new # GeneratePublicKeyRequest | 


begin
  #Generate Key
  result = api_instance.generate_public_key(format, generate_public_key_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling KeyGenerationApi->generate_public_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **format** | **String**| Indicator to enable the receipt of the Keys response in Flex 11+ format (JWT) or legacy (parameter not required) | [default to JWT]
 **generate_public_key_request** | [**GeneratePublicKeyRequest**](GeneratePublicKeyRequest.md)|  | 

### Return type

[**FlexV1KeysPost200Response**](FlexV1KeysPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json



