# CyberSource::InstrumentIdentifierApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_instrument_identifier**](InstrumentIdentifierApi.md#delete_instrument_identifier) | **DELETE** /tms/v1/instrumentidentifiers/{instrumentIdentifierTokenId} | Delete an Instrument Identifier
[**get_instrument_identifier**](InstrumentIdentifierApi.md#get_instrument_identifier) | **GET** /tms/v1/instrumentidentifiers/{instrumentIdentifierTokenId} | Retrieve an Instrument Identifier
[**get_instrument_identifier_payment_instruments_list**](InstrumentIdentifierApi.md#get_instrument_identifier_payment_instruments_list) | **GET** /tms/v1/instrumentidentifiers/{instrumentIdentifierTokenId}/paymentinstruments | List Payment Instruments for an Instrument Identifier
[**patch_instrument_identifier**](InstrumentIdentifierApi.md#patch_instrument_identifier) | **PATCH** /tms/v1/instrumentidentifiers/{instrumentIdentifierTokenId} | Update an Instrument Identifier
[**post_instrument_identifier**](InstrumentIdentifierApi.md#post_instrument_identifier) | **POST** /tms/v1/instrumentidentifiers | Create an Instrument Identifier
[**post_instrument_identifier_enrollment**](InstrumentIdentifierApi.md#post_instrument_identifier_enrollment) | **POST** /tms/v1/instrumentidentifiers/{instrumentIdentifierTokenId}/enrollment | Enroll an Instrument Identifier for Network Tokenization


# **delete_instrument_identifier**
> delete_instrument_identifier(instrument_identifier_token_id, opts)

Delete an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

instrument_identifier_token_id = "instrument_identifier_token_id_example" # String | The TokenId of a Instrument Identifier.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Delete an Instrument Identifier
  api_instance.delete_instrument_identifier(instrument_identifier_token_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->delete_instrument_identifier: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instrument_identifier_token_id** | **String**| The TokenId of a Instrument Identifier. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_instrument_identifier**
> Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifier get_instrument_identifier(instrument_identifier_token_id, opts)

Retrieve an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

instrument_identifier_token_id = "instrument_identifier_token_id_example" # String | The TokenId of a Instrument Identifier.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Retrieve an Instrument Identifier
  result = api_instance.get_instrument_identifier(instrument_identifier_token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->get_instrument_identifier: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instrument_identifier_token_id** | **String**| The TokenId of a Instrument Identifier. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifier**](Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifier.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_instrument_identifier_payment_instruments_list**
> PaymentInstrumentListForCustomer get_instrument_identifier_payment_instruments_list(instrument_identifier_token_id, opts)

List Payment Instruments for an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

instrument_identifier_token_id = "instrument_identifier_token_id_example" # String | The TokenId of a Instrument Identifier.

opts = { 
  profile_id: "profile_id_example", # String | The id of a profile containing user specific TMS configuration.
  offset: 0, # Integer | Starting record in zero-based dataset that should be returned as the first object in the array. Default is 0.
  limit: 20 # Integer | The maximum number that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100.
}

begin
  #List Payment Instruments for an Instrument Identifier
  result = api_instance.get_instrument_identifier_payment_instruments_list(instrument_identifier_token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->get_instrument_identifier_payment_instruments_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instrument_identifier_token_id** | **String**| The TokenId of a Instrument Identifier. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 
 **offset** | **Integer**| Starting record in zero-based dataset that should be returned as the first object in the array. Default is 0. | [optional] [default to 0]
 **limit** | **Integer**| The maximum number that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100. | [optional] [default to 20]

### Return type

[**PaymentInstrumentListForCustomer**](PaymentInstrumentListForCustomer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **patch_instrument_identifier**
> Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifier patch_instrument_identifier(instrument_identifier_token_id, patch_instrument_identifier_request, opts)

Update an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

instrument_identifier_token_id = "instrument_identifier_token_id_example" # String | The TokenId of a Instrument Identifier.

patch_instrument_identifier_request = CyberSource::PatchInstrumentIdentifierRequest.new # PatchInstrumentIdentifierRequest | Specify the previous transaction ID to update.

opts = { 
  profile_id: "profile_id_example", # String | The id of a profile containing user specific TMS configuration.
  if_match: "if_match_example" # String | Contains an ETag value from a GET request to make the request conditional.
}

begin
  #Update an Instrument Identifier
  result = api_instance.patch_instrument_identifier(instrument_identifier_token_id, patch_instrument_identifier_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->patch_instrument_identifier: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instrument_identifier_token_id** | **String**| The TokenId of a Instrument Identifier. | 
 **patch_instrument_identifier_request** | [**PatchInstrumentIdentifierRequest**](PatchInstrumentIdentifierRequest.md)| Specify the previous transaction ID to update. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 
 **if_match** | **String**| Contains an ETag value from a GET request to make the request conditional. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifier**](Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifier.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_instrument_identifier**
> Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifier post_instrument_identifier(post_instrument_identifier_request, opts)

Create an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

post_instrument_identifier_request = CyberSource::PostInstrumentIdentifierRequest.new # PostInstrumentIdentifierRequest | Specify either a Card, Bank Account or Enrollable Card

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Create an Instrument Identifier
  result = api_instance.post_instrument_identifier(post_instrument_identifier_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->post_instrument_identifier: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **post_instrument_identifier_request** | [**PostInstrumentIdentifierRequest**](PostInstrumentIdentifierRequest.md)| Specify either a Card, Bank Account or Enrollable Card | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifier**](Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifier.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_instrument_identifier_enrollment**
> post_instrument_identifier_enrollment(instrument_identifier_token_id, post_instrument_identifier_enrollment_request, opts)

Enroll an Instrument Identifier for Network Tokenization

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

instrument_identifier_token_id = "instrument_identifier_token_id_example" # String | The TokenId of a Instrument Identifier.

post_instrument_identifier_enrollment_request = CyberSource::PostInstrumentIdentifierEnrollmentRequest.new # PostInstrumentIdentifierEnrollmentRequest | Specify Enrollable Card details

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Enroll an Instrument Identifier for Network Tokenization
  api_instance.post_instrument_identifier_enrollment(instrument_identifier_token_id, post_instrument_identifier_enrollment_request, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->post_instrument_identifier_enrollment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instrument_identifier_token_id** | **String**| The TokenId of a Instrument Identifier. | 
 **post_instrument_identifier_enrollment_request** | [**PostInstrumentIdentifierEnrollmentRequest**](PostInstrumentIdentifierEnrollmentRequest.md)| Specify Enrollable Card details | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



