# CyberSource::DecisionManagerApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**add_negative**](DecisionManagerApi.md#add_negative) | **POST** /risk/v1/lists/{type}/entries | List Management
[**create_bundled_decision_manager_case**](DecisionManagerApi.md#create_bundled_decision_manager_case) | **POST** /risk/v1/decisions | Create Decision Manager Case
[**fraud_update**](DecisionManagerApi.md#fraud_update) | **POST** /risk/v1/decisions/{id}/marking | Fraud Marking


# **add_negative**
> RiskV1UpdatePost201Response add_negative(type, add_negative_list_request)

List Management

This call adds/deletes/converts the request information in the negative list.  Provide the list to be updated as the path parameter. This value can be 'postiive', 'negative' or 'review'. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DecisionManagerApi.new

type = "type_example" # String | The list to be updated. It can be 'positive', 'negative' or 'review'.

add_negative_list_request = CyberSource::AddNegativeListRequest.new # AddNegativeListRequest | 


begin
  #List Management
  result = api_instance.add_negative(type, add_negative_list_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling DecisionManagerApi->add_negative: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | **String**| The list to be updated. It can be &#39;positive&#39;, &#39;negative&#39; or &#39;review&#39;. | 
 **add_negative_list_request** | [**AddNegativeListRequest**](AddNegativeListRequest.md)|  | 

### Return type

[**RiskV1UpdatePost201Response**](RiskV1UpdatePost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **create_bundled_decision_manager_case**
> RiskV1DecisionsPost201Response create_bundled_decision_manager_case(create_bundled_decision_manager_case_request)

Create Decision Manager Case

This is the combined request to the Decision Manager Service for a transaction sent to Cybersource. Decision Manager will return a decision based on the request values.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DecisionManagerApi.new

create_bundled_decision_manager_case_request = CyberSource::CreateBundledDecisionManagerCaseRequest.new # CreateBundledDecisionManagerCaseRequest | 


begin
  #Create Decision Manager Case
  result = api_instance.create_bundled_decision_manager_case(create_bundled_decision_manager_case_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling DecisionManagerApi->create_bundled_decision_manager_case: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_bundled_decision_manager_case_request** | [**CreateBundledDecisionManagerCaseRequest**](CreateBundledDecisionManagerCaseRequest.md)|  | 

### Return type

[**RiskV1DecisionsPost201Response**](RiskV1DecisionsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **fraud_update**
> RiskV1UpdatePost201Response fraud_update(id, fraud_marking_action_request)

Fraud Marking

This can be used to - 1. Add known fraudulent data to the fraud history 2. Remove data added to history with Transaction Marking Tool or by uploading chargeback files 3. Remove chargeback data from history that was automatically added. For detailed information, contact your Cybersource representative  Place the request ID of the transaction you want to mark as suspect (or remove from history) as the path parameter in this request. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DecisionManagerApi.new

id = "id_example" # String | Request ID of the transaction that you want to mark as suspect or remove from history.

fraud_marking_action_request = CyberSource::FraudMarkingActionRequest.new # FraudMarkingActionRequest | 


begin
  #Fraud Marking
  result = api_instance.fraud_update(id, fraud_marking_action_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling DecisionManagerApi->fraud_update: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Request ID of the transaction that you want to mark as suspect or remove from history. | 
 **fraud_marking_action_request** | [**FraudMarkingActionRequest**](FraudMarkingActionRequest.md)|  | 

### Return type

[**RiskV1UpdatePost201Response**](RiskV1UpdatePost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



