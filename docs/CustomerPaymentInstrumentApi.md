# CyberSource::CustomerPaymentInstrumentApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_customer_payment_instrument**](CustomerPaymentInstrumentApi.md#delete_customer_payment_instrument) | **DELETE** /tms/v2/customers/{customerTokenId}/payment-instruments/{paymentInstrumentTokenId} | Delete a Customer Payment Instrument
[**get_customer_payment_instrument**](CustomerPaymentInstrumentApi.md#get_customer_payment_instrument) | **GET** /tms/v2/customers/{customerTokenId}/payment-instruments/{paymentInstrumentTokenId} | Retrieve a Customer Payment Instrument
[**get_customer_payment_instruments_list**](CustomerPaymentInstrumentApi.md#get_customer_payment_instruments_list) | **GET** /tms/v2/customers/{customerTokenId}/payment-instruments | List Payment Instruments for a Customer
[**patch_customers_payment_instrument**](CustomerPaymentInstrumentApi.md#patch_customers_payment_instrument) | **PATCH** /tms/v2/customers/{customerTokenId}/payment-instruments/{paymentInstrumentTokenId} | Update a Customer Payment Instrument
[**post_customer_payment_instrument**](CustomerPaymentInstrumentApi.md#post_customer_payment_instrument) | **POST** /tms/v2/customers/{customerTokenId}/payment-instruments | Create a Customer Payment Instrument


# **delete_customer_payment_instrument**
> delete_customer_payment_instrument(customer_token_id, payment_instrument_token_id, opts)

Delete a Customer Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerPaymentInstrumentApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

payment_instrument_token_id = "payment_instrument_token_id_example" # String | The TokenId of a payment instrument.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Delete a Customer Payment Instrument
  api_instance.delete_customer_payment_instrument(customer_token_id, payment_instrument_token_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerPaymentInstrumentApi->delete_customer_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **payment_instrument_token_id** | **String**| The TokenId of a payment instrument. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_customer_payment_instrument**
> Tmsv2customersEmbeddedDefaultPaymentInstrument get_customer_payment_instrument(customer_token_id, payment_instrument_token_id, opts)

Retrieve a Customer Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerPaymentInstrumentApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

payment_instrument_token_id = "payment_instrument_token_id_example" # String | The TokenId of a payment instrument.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Retrieve a Customer Payment Instrument
  result = api_instance.get_customer_payment_instrument(customer_token_id, payment_instrument_token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerPaymentInstrumentApi->get_customer_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **payment_instrument_token_id** | **String**| The TokenId of a payment instrument. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultPaymentInstrument**](Tmsv2customersEmbeddedDefaultPaymentInstrument.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_customer_payment_instruments_list**
> PaymentInstrumentList get_customer_payment_instruments_list(customer_token_id, opts)

List Payment Instruments for a Customer

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerPaymentInstrumentApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

opts = { 
  profile_id: "profile_id_example", # String | The id of a profile containing user specific TMS configuration.
  offset: 0, # Integer | Starting record in zero-based dataset that should be returned as the first object in the array. Default is 0.
  limit: 20 # Integer | The maximum number that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100.
}

begin
  #List Payment Instruments for a Customer
  result = api_instance.get_customer_payment_instruments_list(customer_token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerPaymentInstrumentApi->get_customer_payment_instruments_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 
 **offset** | **Integer**| Starting record in zero-based dataset that should be returned as the first object in the array. Default is 0. | [optional] [default to 0]
 **limit** | **Integer**| The maximum number that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100. | [optional] [default to 20]

### Return type

[**PaymentInstrumentList**](PaymentInstrumentList.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **patch_customers_payment_instrument**
> Tmsv2customersEmbeddedDefaultPaymentInstrument patch_customers_payment_instrument(customer_token_id, payment_instrument_token_id, patch_customer_payment_instrument_request, opts)

Update a Customer Payment Instrument

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerPaymentInstrumentApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

payment_instrument_token_id = "payment_instrument_token_id_example" # String | The TokenId of a payment instrument.

patch_customer_payment_instrument_request = CyberSource::PatchCustomerPaymentInstrumentRequest.new # PatchCustomerPaymentInstrumentRequest | 

opts = { 
  profile_id: "profile_id_example", # String | The id of a profile containing user specific TMS configuration.
  if_match: "if_match_example" # String | Contains an ETag value from a GET request to make the request conditional.
}

begin
  #Update a Customer Payment Instrument
  result = api_instance.patch_customers_payment_instrument(customer_token_id, payment_instrument_token_id, patch_customer_payment_instrument_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerPaymentInstrumentApi->patch_customers_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **payment_instrument_token_id** | **String**| The TokenId of a payment instrument. | 
 **patch_customer_payment_instrument_request** | [**PatchCustomerPaymentInstrumentRequest**](PatchCustomerPaymentInstrumentRequest.md)|  | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 
 **if_match** | **String**| Contains an ETag value from a GET request to make the request conditional. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultPaymentInstrument**](Tmsv2customersEmbeddedDefaultPaymentInstrument.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_customer_payment_instrument**
> Tmsv2customersEmbeddedDefaultPaymentInstrument post_customer_payment_instrument(customer_token_id, post_customer_payment_instrument_request, opts)

Create a Customer Payment Instrument

Include an existing TMS Customer & Instrument Identifier token id in the request. * A Customer token can be created by calling: **POST */tms/v2/customers*** * An Instrument Identifier token can be created by calling: **POST */tms/v1/instrumentidentifiers*** 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerPaymentInstrumentApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

post_customer_payment_instrument_request = CyberSource::PostCustomerPaymentInstrumentRequest.new # PostCustomerPaymentInstrumentRequest | 

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Create a Customer Payment Instrument
  result = api_instance.post_customer_payment_instrument(customer_token_id, post_customer_payment_instrument_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerPaymentInstrumentApi->post_customer_payment_instrument: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **post_customer_payment_instrument_request** | [**PostCustomerPaymentInstrumentRequest**](PostCustomerPaymentInstrumentRequest.md)|  | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultPaymentInstrument**](Tmsv2customersEmbeddedDefaultPaymentInstrument.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



