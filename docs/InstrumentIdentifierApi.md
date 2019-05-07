# CyberSource::InstrumentIdentifierApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_instrument_identifier**](InstrumentIdentifierApi.md#create_instrument_identifier) | **POST** /tms/v1/instrumentidentifiers | Create an Instrument Identifier
[**delete_instrument_identifier**](InstrumentIdentifierApi.md#delete_instrument_identifier) | **DELETE** /tms/v1/instrumentidentifiers/{tokenId} | Delete an Instrument Identifier
[**get_all_payment_instruments**](InstrumentIdentifierApi.md#get_all_payment_instruments) | **GET** /tms/v1/instrumentidentifiers/{tokenId}/paymentinstruments | Retrieve all Payment Instruments associated with an Instrument Identifier
[**get_instrument_identifier**](InstrumentIdentifierApi.md#get_instrument_identifier) | **GET** /tms/v1/instrumentidentifiers/{tokenId} | Retrieve an Instrument Identifier
[**update_instrument_identifier**](InstrumentIdentifierApi.md#update_instrument_identifier) | **PATCH** /tms/v1/instrumentidentifiers/{tokenId} | Update a Instrument Identifier


# **create_instrument_identifier**
> TmsV1InstrumentIdentifiersPost200Response create_instrument_identifier(profile_id, v_c_merchant_id, v_c_correlation_id, create_instrument_identifier_request, opts)

Create an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

v_c_merchant_id = "v_c_merchant_id_example" # String | CyberSource merchant id.

v_c_correlation_id = "v_c_correlation_id_example" # String | The mandatory correlation id passed by upstream (calling) system.

create_instrument_identifier_request = CyberSource::CreateInstrumentIdentifierRequest.new # CreateInstrumentIdentifierRequest | Please specify either a Card, Bank Account or Enrollable Card

opts = { 
  client_application: "client_application_example" # String | Client application name
}

begin
  #Create an Instrument Identifier
  result = api_instance.create_instrument_identifier(profile_id, v_c_merchant_id, v_c_correlation_id, create_instrument_identifier_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->create_instrument_identifier: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **v_c_merchant_id** | **String**| CyberSource merchant id. | 
 **v_c_correlation_id** | **String**| The mandatory correlation id passed by upstream (calling) system. | 
 **create_instrument_identifier_request** | [**CreateInstrumentIdentifierRequest**](CreateInstrumentIdentifierRequest.md)| Please specify either a Card, Bank Account or Enrollable Card | 
 **client_application** | **String**| Client application name | [optional] 

### Return type

[**TmsV1InstrumentIdentifiersPost200Response**](TmsV1InstrumentIdentifiersPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/hal+json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **delete_instrument_identifier**
> delete_instrument_identifier(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)

Delete an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

v_c_merchant_id = "v_c_merchant_id_example" # String | CyberSource merchant id.

v_c_correlation_id = "v_c_correlation_id_example" # String | The mandatory correlation id passed by upstream (calling) system.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.

opts = { 
  client_application: "client_application_example" # String | Client application name
}

begin
  #Delete an Instrument Identifier
  api_instance.delete_instrument_identifier(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->delete_instrument_identifier: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **v_c_merchant_id** | **String**| CyberSource merchant id. | 
 **v_c_correlation_id** | **String**| The mandatory correlation id passed by upstream (calling) system. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier. | 
 **client_application** | **String**| Client application name | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: */*
 - **Accept**: */*



# **get_all_payment_instruments**
> TmsV1InstrumentIdentifiersPaymentInstrumentsGet200Response get_all_payment_instruments(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)

Retrieve all Payment Instruments associated with an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

v_c_merchant_id = "v_c_merchant_id_example" # String | CyberSource merchant id.

v_c_correlation_id = "v_c_correlation_id_example" # String | The mandatory correlation id passed by upstream (calling) system.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.

opts = { 
  client_application: "client_application_example", # String | Client application name
  offset: 0, # Integer | Starting Payment Instrument record in zero-based dataset that should be returned as the first object in the array. Default is 0.
  limit: 20 # Integer | The maximum number of Payment Instruments that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100.
}

begin
  #Retrieve all Payment Instruments associated with an Instrument Identifier
  result = api_instance.get_all_payment_instruments(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->get_all_payment_instruments: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **v_c_merchant_id** | **String**| CyberSource merchant id. | 
 **v_c_correlation_id** | **String**| The mandatory correlation id passed by upstream (calling) system. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier. | 
 **client_application** | **String**| Client application name | [optional] 
 **offset** | **Integer**| Starting Payment Instrument record in zero-based dataset that should be returned as the first object in the array. Default is 0. | [optional] [default to 0]
 **limit** | **Integer**| The maximum number of Payment Instruments that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100. | [optional] [default to 20]

### Return type

[**TmsV1InstrumentIdentifiersPaymentInstrumentsGet200Response**](TmsV1InstrumentIdentifiersPaymentInstrumentsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: */*
 - **Accept**: */*



# **get_instrument_identifier**
> TmsV1InstrumentIdentifiersPost200Response get_instrument_identifier(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)

Retrieve an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

v_c_merchant_id = "v_c_merchant_id_example" # String | CyberSource merchant id.

v_c_correlation_id = "v_c_correlation_id_example" # String | The mandatory correlation id passed by upstream (calling) system.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.

opts = { 
  client_application: "client_application_example" # String | Client application name
}

begin
  #Retrieve an Instrument Identifier
  result = api_instance.get_instrument_identifier(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->get_instrument_identifier: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **v_c_merchant_id** | **String**| CyberSource merchant id. | 
 **v_c_correlation_id** | **String**| The mandatory correlation id passed by upstream (calling) system. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier. | 
 **client_application** | **String**| Client application name | [optional] 

### Return type

[**TmsV1InstrumentIdentifiersPost200Response**](TmsV1InstrumentIdentifiersPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: */*
 - **Accept**: */*



# **update_instrument_identifier**
> TmsV1InstrumentIdentifiersPost200Response update_instrument_identifier(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, update_instrument_identifier_request, opts)

Update a Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InstrumentIdentifierApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

v_c_merchant_id = "v_c_merchant_id_example" # String | CyberSource merchant id.

v_c_correlation_id = "v_c_correlation_id_example" # String | The mandatory correlation id passed by upstream (calling) system.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.

update_instrument_identifier_request = CyberSource::UpdateInstrumentIdentifierRequest.new # UpdateInstrumentIdentifierRequest | Specify the previous transaction ID to update.

opts = { 
  client_application: "client_application_example" # String | Client application name
}

begin
  #Update a Instrument Identifier
  result = api_instance.update_instrument_identifier(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, update_instrument_identifier_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InstrumentIdentifierApi->update_instrument_identifier: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **v_c_merchant_id** | **String**| CyberSource merchant id. | 
 **v_c_correlation_id** | **String**| The mandatory correlation id passed by upstream (calling) system. | 
 **token_id** | **String**| The TokenId of an Instrument Identifier. | 
 **update_instrument_identifier_request** | [**UpdateInstrumentIdentifierRequest**](UpdateInstrumentIdentifierRequest.md)| Specify the previous transaction ID to update. | 
 **client_application** | **String**| Client application name | [optional] 

### Return type

[**TmsV1InstrumentIdentifiersPost200Response**](TmsV1InstrumentIdentifiersPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: */*
 - **Accept**: */*



