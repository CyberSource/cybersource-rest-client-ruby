# CyberSource::PaymentInstrumentApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_payment_instrument**](PaymentInstrumentApi.md#create_payment_instrument) | **POST** /tms/v1/paymentinstruments | Create a Payment Instrument
[**delete_payment_instrument**](PaymentInstrumentApi.md#delete_payment_instrument) | **DELETE** /tms/v1/paymentinstruments/{tokenId} | Delete a Payment Instrument
[**get_payment_instrument**](PaymentInstrumentApi.md#get_payment_instrument) | **GET** /tms/v1/paymentinstruments/{tokenId} | Retrieve a Payment Instrument
[**update_payment_instrument**](PaymentInstrumentApi.md#update_payment_instrument) | **PATCH** /tms/v1/paymentinstruments/{tokenId} | Update a Payment Instrument


# **create_payment_instrument**
> TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedPaymentInstruments create_payment_instrument(profile_id, create_payment_instrument_request)

Create a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

create_payment_instrument_request = CyberSource::CreatePaymentInstrumentRequest.new # CreatePaymentInstrumentRequest | Specify the customer's payment details for card or bank account.


begin
  #Create a Payment Instrument
  result = api_instance.create_payment_instrument(profile_id, create_payment_instrument_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->create_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **create_payment_instrument_request** | [**CreatePaymentInstrumentRequest**](CreatePaymentInstrumentRequest.md)| Specify the customer&#39;s payment details for card or bank account. | 

### Return type

[**TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedPaymentInstruments**](TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedPaymentInstruments.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **delete_payment_instrument**
> delete_payment_instrument(profile_id, token_id)

Delete a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.


begin
  #Delete a Payment Instrument
  api_instance.delete_payment_instrument(profile_id, token_id)
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->delete_payment_instrument: #{e}"
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



# **get_payment_instrument**
> TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedPaymentInstruments get_payment_instrument(profile_id, token_id)

Retrieve a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.


begin
  #Retrieve a Payment Instrument
  result = api_instance.get_payment_instrument(profile_id, token_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->get_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 

### Return type

[**TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedPaymentInstruments**](TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedPaymentInstruments.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **update_payment_instrument**
> TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedPaymentInstruments update_payment_instrument(profile_id, token_id, update_payment_instrument_request)

Update a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.

update_payment_instrument_request = CyberSource::UpdatePaymentInstrumentRequest.new # UpdatePaymentInstrumentRequest | Specify the customer's payment details.


begin
  #Update a Payment Instrument
  result = api_instance.update_payment_instrument(profile_id, token_id, update_payment_instrument_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->update_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 
 **update_payment_instrument_request** | [**UpdatePaymentInstrumentRequest**](UpdatePaymentInstrumentRequest.md)| Specify the customer&#39;s payment details. | 

### Return type

[**TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedPaymentInstruments**](TmsV1InstrumentIdentifiersPaymentInstrumentsGet200ResponseEmbeddedPaymentInstruments.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



