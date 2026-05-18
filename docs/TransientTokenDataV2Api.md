# CyberSource::TransientTokenDataV2Api

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_payment_credentials_for_transient_token**](TransientTokenDataV2Api.md#get_payment_credentials_for_transient_token) | **GET** /flex/v2/payment-credentials/{paymentCredentialsReference} | Get Payment Credentials
[**get_transaction_for_transient_token**](TransientTokenDataV2Api.md#get_transaction_for_transient_token) | **GET** /up/v1/payment-details/{transientToken} | Get Transient Token Data
[**get_transaction_for_transient_token_jti**](TransientTokenDataV2Api.md#get_transaction_for_transient_token_jti) | **GET** /flex/v2/payment-details/{jti} | Get Transient Token Data v2


# **get_payment_credentials_for_transient_token**
> String get_payment_credentials_for_transient_token(payment_credentials_reference)

Get Payment Credentials

Retrieve the Payment data captured by Unified Checkout. This API is used to retrieve the detailed data represented by the Transient Token. This API will return PCI payment data captured by the Unified Checkout platform.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransientTokenDataV2Api.new

payment_credentials_reference = 'payment_credentials_reference_example' # String | The paymentCredentialsReference field contained within the Transient token returned from a successful Unified Checkout transaction. 


begin
  #Get Payment Credentials
  result = api_instance.get_payment_credentials_for_transient_token(payment_credentials_reference)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TransientTokenDataV2Api->get_payment_credentials_for_transient_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **payment_credentials_reference** | **String**| The paymentCredentialsReference field contained within the Transient token returned from a successful Unified Checkout transaction.  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/jwt



# **get_transaction_for_transient_token**
> get_transaction_for_transient_token(transient_token)

Get Transient Token Data

Retrieve the data captured by Unified Checkout. This API is used to retrieve the detailed data represented by the Transient Token. This API will not return PCI payment data (PAN). Include the Request ID in the GET request to retrieve the transaction details.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransientTokenDataV2Api.new

transient_token = 'transient_token_example' # String | Transient Token returned by the Unified Checkout application. 


begin
  #Get Transient Token Data
  api_instance.get_transaction_for_transient_token(transient_token)
rescue CyberSource::ApiError => e
  puts "Exception when calling TransientTokenDataV2Api->get_transaction_for_transient_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **transient_token** | **String**| Transient Token returned by the Unified Checkout application.  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json



# **get_transaction_for_transient_token_jti**
> get_transaction_for_transient_token_jti(jti)

Get Transient Token Data v2

Retrieve data captured through Unified Checkout. This API retrieves the detailed information associated with a Transient Token by looking it up in TMS and using its ID (the jti claim from the /flex/v2/tokens JWT response). The response returns a decrypted version of the Transient Token; however, PCI-sensitive payment data (PAN) is never returned and is always masked.<br><br> Example jti value: 1D42LRF04LYTMO3I1G8JX6GO6S1PUFM2R4CQLU51267E0EOQ7X2169A99674E16E

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransientTokenDataV2Api.new

jti = 'jti_example' # String | The jti within the Transient Token jwt returned by the Unified Checkout application 


begin
  #Get Transient Token Data v2
  api_instance.get_transaction_for_transient_token_jti(jti)
rescue CyberSource::ApiError => e
  puts "Exception when calling TransientTokenDataV2Api->get_transaction_for_transient_token_jti: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **jti** | **String**| The jti within the Transient Token jwt returned by the Unified Checkout application  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json



