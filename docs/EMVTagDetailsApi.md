# CyberSource::EMVTagDetailsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_emv_tags**](EMVTagDetailsApi.md#get_emv_tags) | **GET** /tss/v2/transactions/emvTagDetails | Retrieve the EMV Dictionary
[**parse_emv_tags**](EMVTagDetailsApi.md#parse_emv_tags) | **POST** /tss/v2/transactions/emvTagDetails | Parse an EMV String


# **get_emv_tags**
> TssV2GetEmvTags200Response get_emv_tags

Retrieve the EMV Dictionary

Returns the entire EMV tag dictionary

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::EMVTagDetailsApi.new

begin
  #Retrieve the EMV Dictionary
  result = api_instance.get_emv_tags
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling EMVTagDetailsApi->get_emv_tags: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**TssV2GetEmvTags200Response**](TssV2GetEmvTags200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **parse_emv_tags**
> TssV2PostEmvTags200Response parse_emv_tags(body)

Parse an EMV String

Pass an EMV Tag-Length-Value (TLV) string for parsing.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::EMVTagDetailsApi.new

body = CyberSource::Body.new # Body | 


begin
  #Parse an EMV String
  result = api_instance.parse_emv_tags(body)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling EMVTagDetailsApi->parse_emv_tags: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Body**](Body.md)|  | 

### Return type

[**TssV2PostEmvTags200Response**](TssV2PostEmvTags200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



