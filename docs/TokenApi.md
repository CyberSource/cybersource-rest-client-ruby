# CyberSource::TokenApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_card_art_asset**](TokenApi.md#get_card_art_asset) | **GET** /tms/v2/tokens/{instrumentIdentifierId}/{tokenProvider}/assets/{assetType} | Retrieve Card Art
[**post_token_payment_credentials**](TokenApi.md#post_token_payment_credentials) | **POST** /tms/v2/tokens/{tokenId}/payment-credentials | Generate Payment Credentials for a TMS Token


# **get_card_art_asset**
> InlineResponse200 get_card_art_asset(instrument_identifier_id, token_provider, asset_type)

Retrieve Card Art

Retrieves Card Art for a specific Instrument Identifier. The Card Art is a visual representation of the cardholder's payment card. Card Art is only available if a Network Token is successfully provisioned. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TokenApi.new

instrument_identifier_id = 'instrument_identifier_id_example' # String | The Id of an Instrument Identifier.

token_provider = 'token_provider_example' # String | The token provider.

asset_type = 'asset_type_example' # String | The type of asset.


begin
  #Retrieve Card Art
  result = api_instance.get_card_art_asset(instrument_identifier_id, token_provider, asset_type)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TokenApi->get_card_art_asset: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instrument_identifier_id** | **String**| The Id of an Instrument Identifier. | 
 **token_provider** | **String**| The token provider. | 
 **asset_type** | **String**| The type of asset. | 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_token_payment_credentials**
> String post_token_payment_credentials(token_id, post_payment_credentials_request, opts)

Generate Payment Credentials for a TMS Token

|  |  |  |     | --- | --- | --- |     |**Token**<br>A Token can represent your tokenized Customer, Payment Instrument, Instrument Identifier or Tokenized Card information.|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Payment Credentials**<br>Contains payment information such as the network token, generated cryptogram for Visa & MasterCard or dynamic CVV for Amex in a JSON Web Encryption (JWE) response.<br>Your system can use this API to retrieve the Payment Credentials for an existing Customer, Payment Instrument, Instrument Identifier or Tokenized Card.<br>Optionally, **authenticated identities** information from Passkey authentication can be provided to potentially achieve liability shift, which may result in the return of an e-commerce indicator of 5 if successful. 

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



