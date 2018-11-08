# CyberSource::InstrumentIdentifiersApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tms_v1_instrumentidentifiers_post**](InstrumentIdentifiersApi.md#tms_v1_instrumentidentifiers_post) | **POST** /tms/v1/instrumentidentifiers | Create an Instrument Identifier


# **tms_v1_instrumentidentifiers_post**
> TmsV1InstrumentidentifiersPost200Response tms_v1_instrumentidentifiers_post(profile_id, body)

Create an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifiersApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

body = CyberSource::Body.new # Body | Please specify either a Card or Bank Account.


begin
  #Create an Instrument Identifier
  result = api_instance.tms_v1_instrumentidentifiers_post(profile_id, body)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifiersApi->tms_v1_instrumentidentifiers_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **body** | [**Body**](Body.md)| Please specify either a Card or Bank Account. | 

### Return type

[**TmsV1InstrumentidentifiersPost200Response**](TmsV1InstrumentidentifiersPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



