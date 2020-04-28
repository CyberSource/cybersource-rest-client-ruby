# CyberSource::PayerAuthenticationApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**check_payer_auth_enrollment**](PayerAuthenticationApi.md#check_payer_auth_enrollment) | **POST** /risk/v1/authentications | Check Payer Auth Enrollment
[**validate_authentication_results**](PayerAuthenticationApi.md#validate_authentication_results) | **POST** /risk/v1/authentication-results | Validate Authentication Results


# **check_payer_auth_enrollment**
> RiskV1AuthenticationsPost201Response check_payer_auth_enrollment(check_payer_auth_enrollment_request)

Check Payer Auth Enrollment

This call verifies that the card is enrolled in a card authentication program.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PayerAuthenticationApi.new

check_payer_auth_enrollment_request = CyberSource::CheckPayerAuthEnrollmentRequest.new # CheckPayerAuthEnrollmentRequest | 


begin
  #Check Payer Auth Enrollment
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
 - **Accept**: application/hal+json;charset=utf-8



# **validate_authentication_results**
> RiskV1AuthenticationResultsPost201Response validate_authentication_results(validate_request)

Validate Authentication Results

This call retrieves and validates the authentication results from issuer and allows the merchant to proceed with processing the payment. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PayerAuthenticationApi.new

validate_request = CyberSource::ValidateRequest.new # ValidateRequest | 


begin
  #Validate Authentication Results
  result = api_instance.validate_authentication_results(validate_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PayerAuthenticationApi->validate_authentication_results: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **validate_request** | [**ValidateRequest**](ValidateRequest.md)|  | 

### Return type

[**RiskV1AuthenticationResultsPost201Response**](RiskV1AuthenticationResultsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



