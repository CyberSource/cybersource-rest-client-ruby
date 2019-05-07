# CyberSource::PaymentInstrumentApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_payment_instrument**](PaymentInstrumentApi.md#create_payment_instrument) | **POST** /tms/v1/paymentinstruments | Create a Payment Instrument
[**delete_payment_instrument**](PaymentInstrumentApi.md#delete_payment_instrument) | **DELETE** /tms/v1/paymentinstruments/{tokenId} | Delete a Payment Instrument
[**get_payment_instrument**](PaymentInstrumentApi.md#get_payment_instrument) | **GET** /tms/v1/paymentinstruments/{tokenId} | Retrieve a Payment Instrument
[**update_payment_instrument**](PaymentInstrumentApi.md#update_payment_instrument) | **PATCH** /tms/v1/paymentinstruments/{tokenId} | Update a Payment Instrument


# **create_payment_instrument**
> TmsV1PaymentinstrumentsPatch200Response create_payment_instrument(profile_id, v_c_merchant_id, v_c_correlation_id, create_payment_instrument_request, opts)

Create a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

v_c_merchant_id = "v_c_merchant_id_example" # String | CyberSource merchant id.

v_c_correlation_id = "v_c_correlation_id_example" # String | The mandatory correlation id passed by upstream (calling) system.

create_payment_instrument_request = CyberSource::CreatePaymentInstrumentRequest.new # CreatePaymentInstrumentRequest | Specify the customer's payment details for card or bank account.

opts = { 
  client_application: "client_application_example" # String | Client application name
}

begin
  #Create a Payment Instrument
  result = api_instance.create_payment_instrument(profile_id, v_c_merchant_id, v_c_correlation_id, create_payment_instrument_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->create_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **v_c_merchant_id** | **String**| CyberSource merchant id. | 
 **v_c_correlation_id** | **String**| The mandatory correlation id passed by upstream (calling) system. | 
 **create_payment_instrument_request** | [**CreatePaymentInstrumentRequest**](CreatePaymentInstrumentRequest.md)| Specify the customer&#39;s payment details for card or bank account. | 
 **client_application** | **String**| Client application name | [optional] 

### Return type

[**TmsV1PaymentinstrumentsPatch200Response**](TmsV1PaymentinstrumentsPatch200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: */*
 - **Accept**: */*



# **delete_payment_instrument**
> delete_payment_instrument(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)

Delete a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

v_c_merchant_id = "v_c_merchant_id_example" # String | CyberSource merchant id.

v_c_correlation_id = "v_c_correlation_id_example" # String | The mandatory correlation id passed by upstream (calling) system.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.

opts = { 
  client_application: "client_application_example" # String | Client application name
}

begin
  #Delete a Payment Instrument
  api_instance.delete_payment_instrument(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->delete_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **v_c_merchant_id** | **String**| CyberSource merchant id. | 
 **v_c_correlation_id** | **String**| The mandatory correlation id passed by upstream (calling) system. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 
 **client_application** | **String**| Client application name | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: */*
 - **Accept**: */*



# **get_payment_instrument**
> TmsV1PaymentinstrumentsPatch200Response get_payment_instrument(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)

Retrieve a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

v_c_merchant_id = "v_c_merchant_id_example" # String | CyberSource merchant id.

v_c_correlation_id = "v_c_correlation_id_example" # String | The mandatory correlation id passed by upstream (calling) system.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.

opts = { 
  client_application: "client_application_example" # String | Client application name
}

begin
  #Retrieve a Payment Instrument
  result = api_instance.get_payment_instrument(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->get_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **v_c_merchant_id** | **String**| CyberSource merchant id. | 
 **v_c_correlation_id** | **String**| The mandatory correlation id passed by upstream (calling) system. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 
 **client_application** | **String**| Client application name | [optional] 

### Return type

[**TmsV1PaymentinstrumentsPatch200Response**](TmsV1PaymentinstrumentsPatch200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: */*
 - **Accept**: */*



# **update_payment_instrument**
> TmsV1PaymentinstrumentsPatch200Response update_payment_instrument(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, update_payment_instrument_request, opts)

Update a Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

v_c_merchant_id = "v_c_merchant_id_example" # String | CyberSource merchant id.

v_c_correlation_id = "v_c_correlation_id_example" # String | The mandatory correlation id passed by upstream (calling) system.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.

update_payment_instrument_request = CyberSource::UpdatePaymentInstrumentRequest.new # UpdatePaymentInstrumentRequest | Specify the customer's payment details.

opts = { 
  client_application: "client_application_example" # String | Client application name
}

begin
  #Update a Payment Instrument
  result = api_instance.update_payment_instrument(profile_id, v_c_merchant_id, v_c_correlation_id, token_id, update_payment_instrument_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->update_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **v_c_merchant_id** | **String**| CyberSource merchant id. | 
 **v_c_correlation_id** | **String**| The mandatory correlation id passed by upstream (calling) system. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 
 **update_payment_instrument_request** | [**UpdatePaymentInstrumentRequest**](UpdatePaymentInstrumentRequest.md)| Specify the customer&#39;s payment details. | 
 **client_application** | **String**| Client application name | [optional] 

### Return type

[**TmsV1PaymentinstrumentsPatch200Response**](TmsV1PaymentinstrumentsPatch200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: */*
 - **Accept**: */*



