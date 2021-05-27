# CyberSource::OAuthApi

All URIs are relative to *https://api-ma.Cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_access_token**](OAuthApi.md#create_access_token) | **POST** /oauth2/v3/token | Create access token and refresh token


# **create_access_token**
> AccessTokenResponse create_access_token(create_access_token_request, opts)

Create access token and refresh token

This request is used by technology partners to obtain an access token and a refresh token, which are contained in the response.  The partner can then use the access token for authentication when submitting API requests to CyberSource on behalf of the merchant.   The request must include the authorization code that was included in the URL redirect response from CyberSource (see [full documentation](https://developer.cybersource.com/api/developer-guides/OAuth/cybs_extend_intro.html)). Access tokens expire after 15 minutes. The refresh token is used to create a new access token, it expires after one year. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::OAuthApi.new

create_access_token_request = CyberSource::CreateAccessTokenRequest.new # CreateAccessTokenRequest | Request payload

opts = { 
  v_c_client_correlation_id: "v_c_client_correlation_id_example" # String | We recommended that you submit this header with a unique value in every client request to this endpoint.  It is sent back in the response header and logged both in the request log and response log. 
}

begin
  #Create access token and refresh token
  result = api_instance.create_access_token(create_access_token_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling OAuthApi->create_access_token: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_access_token_request** | [**CreateAccessTokenRequest**](CreateAccessTokenRequest.md)| Request payload | 
 **v_c_client_correlation_id** | **String**| We recommended that you submit this header with a unique value in every client request to this endpoint.  It is sent back in the response header and logged both in the request log and response log.  | [optional] 

### Return type

[**AccessTokenResponse**](AccessTokenResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/x-www-form-urlencoded
 - **Accept**: application/json;charset=utf-8



