# CyberSource::PaymentInstrumentsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**tms_v1_instrumentidentifiers_token_id_paymentinstruments_get**](PaymentInstrumentsApi.md#tms_v1_instrumentidentifiers_token_id_paymentinstruments_get) | **GET** /tms/v1/instrumentidentifiers/{tokenId}/paymentinstruments | Retrieve all Payment Instruments associated with an Instrument Identifier
[**tms_v1_paymentinstruments_post**](PaymentInstrumentsApi.md#tms_v1_paymentinstruments_post) | **POST** /tms/v1/paymentinstruments | Create a Payment Instrument
[**tms_v1_paymentinstruments_token_id_delete**](PaymentInstrumentsApi.md#tms_v1_paymentinstruments_token_id_delete) | **DELETE** /tms/v1/paymentinstruments/{tokenId} | Delete a Payment Instrument
[**tms_v1_paymentinstruments_token_id_get**](PaymentInstrumentsApi.md#tms_v1_paymentinstruments_token_id_get) | **GET** /tms/v1/paymentinstruments/{tokenId} | Retrieve a Payment Instrument
[**tms_v1_paymentinstruments_token_id_patch**](PaymentInstrumentsApi.md#tms_v1_paymentinstruments_token_id_patch) | **PATCH** /tms/v1/paymentinstruments/{tokenId} | Update a Payment Instrument


# **tms_v1_instrumentidentifiers_token_id_paymentinstruments_get**
> TmsV1InstrumentidentifiersPaymentinstrumentsGet200Response tms_v1_instrumentidentifiers_token_id_paymentinstruments_get(profile_id, token_id, opts)

Retrieve all Payment Instruments associated with an Instrument Identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentsApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of an Instrument Identifier.

opts = { 
  offset: "offset_example", # String | Starting Payment Instrument record in zero-based dataset that should be returned as the first object in the array. Default is 0.
  limit: "20" # String | The maximum number of Payment Instruments that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100.
}

begin
  #Retrieve all Payment Instruments associated with an Instrument Identifier
  result = api_instance.tms_v1_instrumentidentifiers_token_id_paymentinstruments_get(profile_id, token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->tms_v1_instrumentidentifiers_token_id_paymentinstruments_get: #{e}"
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

[**TmsV1InstrumentidentifiersPaymentinstrumentsGet200Response**](TmsV1InstrumentidentifiersPaymentinstrumentsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **tms_v1_paymentinstruments_post**
> TmsV1PaymentinstrumentsPost201Response tms_v1_paymentinstruments_post(profile_id, body)

Create a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentsApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

body = CyberSource::Body2.new # Body2 | Please specify the customers payment details for card or bank account.


begin
  #Create a Payment Instrument
  result = api_instance.tms_v1_paymentinstruments_post(profile_id, body)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->tms_v1_paymentinstruments_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **body** | [**Body2**](Body2.md)| Please specify the customers payment details for card or bank account. | 

### Return type

[**TmsV1PaymentinstrumentsPost201Response**](TmsV1PaymentinstrumentsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **tms_v1_paymentinstruments_token_id_delete**
> tms_v1_paymentinstruments_token_id_delete(profile_id, token_id)

Delete a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentsApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.


begin
  #Delete a Payment Instrument
  api_instance.tms_v1_paymentinstruments_token_id_delete(profile_id, token_id)
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->tms_v1_paymentinstruments_token_id_delete: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **tms_v1_paymentinstruments_token_id_get**
> TmsV1PaymentinstrumentsPost201Response tms_v1_paymentinstruments_token_id_get(profile_id, token_id)

Retrieve a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentsApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.


begin
  #Retrieve a Payment Instrument
  result = api_instance.tms_v1_paymentinstruments_token_id_get(profile_id, token_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->tms_v1_paymentinstruments_token_id_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 

### Return type

[**TmsV1PaymentinstrumentsPost201Response**](TmsV1PaymentinstrumentsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **tms_v1_paymentinstruments_token_id_patch**
> TmsV1PaymentinstrumentsPost201Response tms_v1_paymentinstruments_token_id_patch(profile_id, token_id, body)

Update a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentsApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.

body = CyberSource::Body3.new # Body3 | Please specify the customers payment details.


begin
  #Update a Payment Instrument
  result = api_instance.tms_v1_paymentinstruments_token_id_patch(profile_id, token_id, body)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentsApi->tms_v1_paymentinstruments_token_id_patch: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 
 **body** | [**Body3**](Body3.md)| Please specify the customers payment details. | 

### Return type

[**TmsV1PaymentinstrumentsPost201Response**](TmsV1PaymentinstrumentsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



