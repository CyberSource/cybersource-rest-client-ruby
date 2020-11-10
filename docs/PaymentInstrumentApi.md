# CyberSource::PaymentInstrumentApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_payment_instrument**](PaymentInstrumentApi.md#delete_payment_instrument) | **DELETE** /tms/v1/paymentinstruments/{paymentInstrumentTokenId} | Delete a Payment Instrument
[**get_payment_instrument**](PaymentInstrumentApi.md#get_payment_instrument) | **GET** /tms/v1/paymentinstruments/{paymentInstrumentTokenId} | Retrieve a Payment Instrument
[**patch_payment_instrument**](PaymentInstrumentApi.md#patch_payment_instrument) | **PATCH** /tms/v1/paymentinstruments/{paymentInstrumentTokenId} | Update a Payment Instrument
[**post_payment_instrument**](PaymentInstrumentApi.md#post_payment_instrument) | **POST** /tms/v1/paymentinstruments | Create a Payment Instrument


# **delete_payment_instrument**
> delete_payment_instrument(payment_instrument_token_id, opts)

Delete a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

payment_instrument_token_id = "payment_instrument_token_id_example" # String | The TokenId of a payment instrument.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Delete a Payment Instrument
  api_instance.delete_payment_instrument(payment_instrument_token_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->delete_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_instrument_token_id** | **String**| The TokenId of a payment instrument. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_payment_instrument**
> Tmsv2customersEmbeddedDefaultPaymentInstrument get_payment_instrument(payment_instrument_token_id, opts)

Retrieve a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

payment_instrument_token_id = "payment_instrument_token_id_example" # String | The TokenId of a payment instrument.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Retrieve a Payment Instrument
  result = api_instance.get_payment_instrument(payment_instrument_token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->get_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_instrument_token_id** | **String**| The TokenId of a payment instrument. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultPaymentInstrument**](Tmsv2customersEmbeddedDefaultPaymentInstrument.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **patch_payment_instrument**
> Tmsv2customersEmbeddedDefaultPaymentInstrument patch_payment_instrument(payment_instrument_token_id, patch_payment_instrument_request, opts)

Update a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

payment_instrument_token_id = "payment_instrument_token_id_example" # String | The TokenId of a payment instrument.

patch_payment_instrument_request = CyberSource::PatchPaymentInstrumentRequest.new # PatchPaymentInstrumentRequest | 

opts = { 
  profile_id: "profile_id_example", # String | The id of a profile containing user specific TMS configuration.
  if_match: "if_match_example" # String | Contains an ETag value from a GET request to make the request conditional.
}

begin
  #Update a Payment Instrument
  result = api_instance.patch_payment_instrument(payment_instrument_token_id, patch_payment_instrument_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->patch_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_instrument_token_id** | **String**| The TokenId of a payment instrument. | 
 **patch_payment_instrument_request** | [**PatchPaymentInstrumentRequest**](PatchPaymentInstrumentRequest.md)|  | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 
 **if_match** | **String**| Contains an ETag value from a GET request to make the request conditional. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultPaymentInstrument**](Tmsv2customersEmbeddedDefaultPaymentInstrument.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_payment_instrument**
> Tmsv2customersEmbeddedDefaultPaymentInstrument post_payment_instrument(post_payment_instrument_request, opts)

Create a Payment Instrument

Include an existing TMS Instrument Identifier id in the request body. * An Instrument Identifier token can be created by calling: **POST */tms/v1/instrumentidentifiers*** 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

post_payment_instrument_request = CyberSource::PostPaymentInstrumentRequest.new # PostPaymentInstrumentRequest | 

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Create a Payment Instrument
  result = api_instance.post_payment_instrument(post_payment_instrument_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->post_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **post_payment_instrument_request** | [**PostPaymentInstrumentRequest**](PostPaymentInstrumentRequest.md)|  | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultPaymentInstrument**](Tmsv2customersEmbeddedDefaultPaymentInstrument.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



