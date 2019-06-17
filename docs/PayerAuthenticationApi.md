# CyberSource::PayerAuthenticationApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**check_payer_auth_enrollment**](PayerAuthenticationApi.md#check_payer_auth_enrollment) | **POST** /risk/v1/authentications | Check payer auth enrollment
[**validate_authentication_results**](PayerAuthenticationApi.md#validate_authentication_results) | **POST** /risk/v1/authentication-results | Validate authentication results


# **check_payer_auth_enrollment**
> RiskV1AuthenticationsPost201Response check_payer_auth_enrollment(check_payer_auth_enrollment_request)

Check payer auth enrollment

This call verifies that the card is enrolled in a card authentication program.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PayerAuthenticationApi.new

check_payer_auth_enrollment_request = CyberSource::CheckPayerAuthEnrollmentRequest.new # CheckPayerAuthEnrollmentRequest | 


begin
  #Check payer auth enrollment
  result = api_instance.check_payer_auth_enrollment(check_payer_auth_enrollment_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PayerAuthenticationApi->check_payer_auth_enrollment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **check_payer_auth_enrollment_request** | [**CheckPayerAuthEnrollmentRequest**](CheckPayerAuthEnrollmentRequest.md)|  | 

### Return type

[**RiskV1AuthenticationsPost201Response**](RiskV1AuthenticationsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **validate_authentication_results**
> RiskV1AuthenticationResultsPost201Response validate_authentication_results(request)

Validate authentication results

This call retrieves and validates the authentication results from issuer and allows the merchant to proceed with processing the payment. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PayerAuthenticationApi.new

request = CyberSource::Request.new # Request | 


begin
  #Validate authentication results
  result = api_instance.validate_authentication_results(request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PayerAuthenticationApi->validate_authentication_results: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request** | [**Request**](Request.md)|  | 

### Return type

[**RiskV1AuthenticationResultsPost201Response**](RiskV1AuthenticationResultsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



