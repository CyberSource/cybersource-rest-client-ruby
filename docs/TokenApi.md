# CyberSource::TokenApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**post_token_payment_credentials**](TokenApi.md#post_token_payment_credentials) | **POST** /tms/v2/tokens/{tokenId}/payment-credentials | Generate Payment Credentials for a TMS Token


# **post_token_payment_credentials**
> String post_token_payment_credentials(token_id, post_payment_credentials_request, opts)

Generate Payment Credentials for a TMS Token

|  |  |  |     | --- | --- | --- |     |**Token**<br>A Token can represent your tokenized Customer, Payment Instrument or Instrument Identifier information.|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Payment Credentials**<br>Contains payment information such as the network token, generated cryptogram for Visa & MasterCard or dynamic CVV for Amex in a JSON Web Encryption (JWE) response.<br>Your system can use this API to retrieve the Payment Credentials for an existing Customer, Payment Instrument or Instrument Identifier. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TokenApi.new

token_id = 'token_id_example' # String | The Id of a token representing a Customer, Payment Instrument or Instrument Identifier.

post_payment_credentials_request = CyberSource::PostPaymentCredentialsRequest.new # PostPaymentCredentialsRequest | 

opts = { 
  profile_id: 'profile_id_example' # String | The Id of a profile containing user specific TMS configuration.
}

begin
  #Generate Payment Credentials for a TMS Token
  result = api_instance.post_token_payment_credentials(token_id, post_payment_credentials_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TokenApi->post_token_payment_credentials: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **token_id** | **String**| The Id of a token representing a Customer, Payment Instrument or Instrument Identifier. | 
 **post_payment_credentials_request** | [**PostPaymentCredentialsRequest**](PostPaymentCredentialsRequest.md)|  | 
 **profile_id** | **String**| The Id of a profile containing user specific TMS configuration. | [optional] 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/jose;charset=utf-8



