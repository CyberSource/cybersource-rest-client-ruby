# CyberSource::PaymentInstrumentApi

All URIs are relative to *https://api.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**paymentinstruments_post**](PaymentInstrumentApi.md#paymentinstruments_post) | **POST** /paymentinstruments | Create a Payment Instrument
[**paymentinstruments_token_id_delete**](PaymentInstrumentApi.md#paymentinstruments_token_id_delete) | **DELETE** /paymentinstruments/{tokenId} | Delete a Payment Instrument
[**paymentinstruments_token_id_get**](PaymentInstrumentApi.md#paymentinstruments_token_id_get) | **GET** /paymentinstruments/{tokenId} | Retrieve a Payment Instrument
[**paymentinstruments_token_id_patch**](PaymentInstrumentApi.md#paymentinstruments_token_id_patch) | **PATCH** /paymentinstruments/{tokenId} | Update a Payment Instrument


# **paymentinstruments_post**
> InlineResponse2016 paymentinstruments_post(profile_id, body)

Create a Payment Instrument

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

body = CyberSource::Body2.new # Body2 | Please specify the customers payment details for card or bank account.


begin
  #Create a Payment Instrument
  result = api_instance.paymentinstruments_post(profile_id, body)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->paymentinstruments_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **body** | [**Body2**](Body2.md)| Please specify the customers payment details for card or bank account. | 

### Return type

[**InlineResponse2016**](InlineResponse2016.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **paymentinstruments_token_id_delete**
> paymentinstruments_token_id_delete(profile_id, token_id)

Delete a Payment Instrument

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.


begin
  #Delete a Payment Instrument
  api_instance.paymentinstruments_token_id_delete(profile_id, token_id)
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->paymentinstruments_token_id_delete: #{e}"
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

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **paymentinstruments_token_id_get**
> InlineResponse2016 paymentinstruments_token_id_get(profile_id, token_id)

Retrieve a Payment Instrument

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.


begin
  #Retrieve a Payment Instrument
  result = api_instance.paymentinstruments_token_id_get(profile_id, token_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->paymentinstruments_token_id_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 

### Return type

[**InlineResponse2016**](InlineResponse2016.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **paymentinstruments_token_id_patch**
> InlineResponse2016 paymentinstruments_token_id_patch(profile_id, token_id, body)

Update a Payment Instrument

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::PaymentInstrumentApi.new

profile_id = "profile_id_example" # String | The id of a profile containing user specific TMS configuration.

token_id = "token_id_example" # String | The TokenId of a Payment Instrument.

body = CyberSource::Body3.new # Body3 | Please specify the customers payment details.


begin
  #Update a Payment Instrument
  result = api_instance.paymentinstruments_token_id_patch(profile_id, token_id, body)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentInstrumentApi->paymentinstruments_token_id_patch: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | 
 **token_id** | **String**| The TokenId of a Payment Instrument. | 
 **body** | [**Body3**](Body3.md)| Please specify the customers payment details. | 

### Return type

[**InlineResponse2016**](InlineResponse2016.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



