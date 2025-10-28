# CyberSource::BankAccountValidationApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**bank_account_validation_request**](BankAccountValidationApi.md#bank_account_validation_request) | **POST** /bavs/v1/account-validations | Visa Bank Account Validation Service


# **bank_account_validation_request**
> InlineResponse20013 bank_account_validation_request(account_validations_request)

Visa Bank Account Validation Service

The Visa Bank Account Validation Service is a new standalone product designed to validate customer's routing and bank account number combination for ACH transactions. Merchant's can use this standalone product to validate their customer's account prior to processing an ACH transaction against the customer's account to comply with Nacha's account validation mandate for Web-debit transactions. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::BankAccountValidationApi.new

account_validations_request = CyberSource::AccountValidationsRequest.new # AccountValidationsRequest | 


begin
  #Visa Bank Account Validation Service
  result = api_instance.bank_account_validation_request(account_validations_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling BankAccountValidationApi->bank_account_validation_request: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **account_validations_request** | [**AccountValidationsRequest**](AccountValidationsRequest.md)|  | 

### Return type

[**InlineResponse20013**](InlineResponse20013.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



