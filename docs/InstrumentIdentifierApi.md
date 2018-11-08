# CyberSource::InstrumentIdentifierApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tms_v1_instrumentidentifiers_token_id_delete**](InstrumentIdentifierApi.md#tms_v1_instrumentidentifiers_token_id_delete) | **DELETE** /tms/v1/instrumentidentifiers/{tokenId} | Delete an Instrument Identifier
[**tms_v1_instrumentidentifiers_token_id_get**](InstrumentIdentifierApi.md#tms_v1_instrumentidentifiers_token_id_get) | **GET** /tms/v1/instrumentidentifiers/{tokenId} | Retrieve an Instrument Identifier
[**tms_v1_instrumentidentifiers_token_id_patch**](InstrumentIdentifierApi.md#tms_v1_instrumentidentifiers_token_id_patch) | **PATCH** /tms/v1/instrumentidentifiers/{tokenId} | Update a Instrument Identifier


# **tms_v1_instrumentidentifiers_token_id_delete**
> tms_v1_instrumentidentifiers_token_id_delete(profile_id, token_id)

Delete an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.


begin
  #Delete an Instrument Identifier
  api_instance.tms_v1_instrumentidentifiers_token_id_delete(profile_id, token_id)
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->tms_v1_instrumentidentifiers_token_id_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier. | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **tms_v1_instrumentidentifiers_token_id_get**
> TmsV1InstrumentidentifiersPost200Response tms_v1_instrumentidentifiers_token_id_get(profile_id, token_id)

Retrieve an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.


begin
  #Retrieve an Instrument Identifier
  result = api_instance.tms_v1_instrumentidentifiers_token_id_get(profile_id, token_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->tms_v1_instrumentidentifiers_token_id_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier. | 

### Return type

[**TmsV1InstrumentidentifiersPost200Response**](TmsV1InstrumentidentifiersPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **tms_v1_instrumentidentifiers_token_id_patch**
> TmsV1InstrumentidentifiersPost200Response tms_v1_instrumentidentifiers_token_id_patch(profile_id, token_id, body)

Update a Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.

body = CyberSource::Body1.new # Body1 | Please specify the previous transaction Id to update.


begin
  #Update a Instrument Identifier
  result = api_instance.tms_v1_instrumentidentifiers_token_id_patch(profile_id, token_id, body)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->tms_v1_instrumentidentifiers_token_id_patch: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier. | 
 **body** | [**Body1**](Body1.md)| Please specify the previous transaction Id to update. | 

### Return type

[**TmsV1InstrumentidentifiersPost200Response**](TmsV1InstrumentidentifiersPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



