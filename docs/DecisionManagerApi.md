# CyberSource::DecisionManagerApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_decision_manager_case**](DecisionManagerApi.md#create_decision_manager_case) | **POST** /risk/v1/decisions | Create Decision Manager case


# **create_decision_manager_case**
> RiskV1DecisionsPost201Response create_decision_manager_case(create_decision_manager_case_request)

Create Decision Manager case

This is the combined request to the Decision Manager Service for a transaction sent to Cybersource. Decision Manager will return a decision based on the request values. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DecisionManagerApi.new

create_decision_manager_case_request = CyberSource::CreateDecisionManagerCaseRequest.new # CreateDecisionManagerCaseRequest | 


begin
  #Create Decision Manager case
  result = api_instance.create_decision_manager_case(create_decision_manager_case_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling DecisionManagerApi->create_decision_manager_case: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_decision_manager_case_request** | [**CreateDecisionManagerCaseRequest**](CreateDecisionManagerCaseRequest.md)|  | 

### Return type

[**RiskV1DecisionsPost201Response**](RiskV1DecisionsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



