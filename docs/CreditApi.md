# CyberSource::CreditApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_credit**](CreditApi.md#create_credit) | **POST** /pts/v2/credits/ | Process a Credit


# **create_credit**
> PtsV2CreditsPost201Response create_credit(create_credit_request)

Process a Credit

POST to the credit resource to credit funds to a specified credit card.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CreditApi.new

create_credit_request = CyberSource::CreateCreditRequest.new # CreateCreditRequest | 


begin
  #Process a Credit
  result = api_instance.create_credit(create_credit_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CreditApi->create_credit: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_credit_request** | [**CreateCreditRequest**](CreateCreditRequest.md)|  | 

### Return type

[**PtsV2CreditsPost201Response**](PtsV2CreditsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



