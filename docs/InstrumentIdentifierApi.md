# CyberSource::InstrumentIdentifierApi

All URIs are relative to *https://api.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**instrumentidentifiers_post**](InstrumentIdentifierApi.md#instrumentidentifiers_post) | **POST** /instrumentidentifiers | Create an Instrument Identifier
[**instrumentidentifiers_token_id_delete**](InstrumentIdentifierApi.md#instrumentidentifiers_token_id_delete) | **DELETE** /instrumentidentifiers/{tokenId} | Delete an Instrument Identifier
[**instrumentidentifiers_token_id_get**](InstrumentIdentifierApi.md#instrumentidentifiers_token_id_get) | **GET** /instrumentidentifiers/{tokenId} | Retrieve an Instrument Identifier
[**instrumentidentifiers_token_id_patch**](InstrumentIdentifierApi.md#instrumentidentifiers_token_id_patch) | **PATCH** /instrumentidentifiers/{tokenId} | Update a Instrument Identifier
[**instrumentidentifiers_token_id_paymentinstruments_get**](InstrumentIdentifierApi.md#instrumentidentifiers_token_id_paymentinstruments_get) | **GET** /instrumentidentifiers/{tokenId}/paymentinstruments | Retrieve all Payment Instruments associated with an Instrument Identifier


# **instrumentidentifiers_post**
> InlineResponse2007 instrumentidentifiers_post(profile_id, opts)

Create an Instrument Identifier

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

opts = { 
  body: CyberSource::Body.new # Body | Please specify either a Card or Bank Account.
}

begin
  #Create an Instrument Identifier
  result = api_instance.instrumentidentifiers_post(profile_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->instrumentidentifiers_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **body** | [**Body**](Body.md)| Please specify either a Card or Bank Account. | [optional] 

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **instrumentidentifiers_token_id_delete**
> instrumentidentifiers_token_id_delete(profile_id, token_id)

Delete an Instrument Identifier

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.


begin
  #Delete an Instrument Identifier
  api_instance.instrumentidentifiers_token_id_delete(profile_id, token_id)
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->instrumentidentifiers_token_id_delete: #{e}"
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

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **instrumentidentifiers_token_id_get**
> InlineResponse2007 instrumentidentifiers_token_id_get(profile_id, token_id)

Retrieve an Instrument Identifier

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.


begin
  #Retrieve an Instrument Identifier
  result = api_instance.instrumentidentifiers_token_id_get(profile_id, token_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->instrumentidentifiers_token_id_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier. | 

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **instrumentidentifiers_token_id_patch**
> InlineResponse2007 instrumentidentifiers_token_id_patch(profile_id, token_id, body)

Update a Instrument Identifier

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier

body = CyberSource::Body1.new # Body1 | Please specify the previous transaction Id to update.


begin
  #Update a Instrument Identifier
  result = api_instance.instrumentidentifiers_token_id_patch(profile_id, token_id, body)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->instrumentidentifiers_token_id_patch: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier | 
 **body** | [**Body1**](Body1.md)| Please specify the previous transaction Id to update. | 

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **instrumentidentifiers_token_id_paymentinstruments_get**
> InlineResponse2008 instrumentidentifiers_token_id_paymentinstruments_get(profile_id, token_id, opts)

Retrieve all Payment Instruments associated with an Instrument Identifier

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.

opts = { 
  offset: "offset_example", # String | Starting Payment Instrument record in zero-based dataset that should be returned as the first object in the array. Default is 0.
  limit: "20" # String | The maximum number of Payment Instruments that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100.
}

begin
  #Retrieve all Payment Instruments associated with an Instrument Identifier
  result = api_instance.instrumentidentifiers_token_id_paymentinstruments_get(profile_id, token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->instrumentidentifiers_token_id_paymentinstruments_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier. | 
 **offset** | **String**| Starting Payment Instrument record in zero-based dataset that should be returned as the first object in the array. Default is 0. | [optional] 
 **limit** | **String**| The maximum number of Payment Instruments that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100. | [optional] [default to 20]

### Return type

[**InlineResponse2008**](InlineResponse2008.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



