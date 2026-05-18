# CyberSource::PushFundsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_push_funds_transfer**](PushFundsApi.md#create_push_funds_transfer) | **POST** /pts/v1/push-funds-transfer | Process a Push Funds Transfer


# **create_push_funds_transfer**
> PushFunds201Response create_push_funds_transfer(push_funds_request, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)

Process a Push Funds Transfer

Receive funds using an Original Credit Transaction (OCT). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PushFundsApi.new

push_funds_request = CyberSource::PushFundsRequest.new # PushFundsRequest | 

content_type = 'content_type_example' # String | 

x_requestid = 'x_requestid_example' # String | 

v_c_merchant_id = 'v_c_merchant_id_example' # String | 

v_c_permissions = 'v_c_permissions_example' # String | 

v_c_correlation_id = 'v_c_correlation_id_example' # String | 

v_c_organization_id = 'v_c_organization_id_example' # String | 


begin
  #Process a Push Funds Transfer
  result = api_instance.create_push_funds_transfer(push_funds_request, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PushFundsApi->create_push_funds_transfer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **push_funds_request** | [**PushFundsRequest**](PushFundsRequest.md)|  | 
 **content_type** | **String**|  | 
 **x_requestid** | **String**|  | 
 **v_c_merchant_id** | **String**|  | 
 **v_c_permissions** | **String**|  | 
 **v_c_correlation_id** | **String**|  | 
 **v_c_organization_id** | **String**|  | 

### Return type

[**PushFunds201Response**](PushFunds201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



