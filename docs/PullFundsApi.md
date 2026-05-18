# CyberSource::PullFundsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_pull_funds_refund**](PullFundsApi.md#create_pull_funds_refund) | **POST** /pts/v1/pull-funds-transfer/{id}/refund | Process a Pull Funds Refund
[**create_pull_funds_reversal**](PullFundsApi.md#create_pull_funds_reversal) | **POST** /pts/v1/pull-funds-transfer/{id}/reversal | Process a Pull Funds Reversal
[**create_pull_funds_transfer**](PullFundsApi.md#create_pull_funds_transfer) | **POST** /pts/v1/pull-funds-transfer | Process a Pull Funds Transfer


# **create_pull_funds_refund**
> PullFundsRefund201Response create_pull_funds_refund(pull_funds_refund_request, id, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)

Process a Pull Funds Refund

Refund an Account Funding Transaction (AFT). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PullFundsApi.new

pull_funds_refund_request = CyberSource::PullFundsRefundRequest.new # PullFundsRefundRequest | 

id = 'id_example' # String | The transaction id of a previous Account Funding Transaction. 

content_type = 'content_type_example' # String | 

x_requestid = 'x_requestid_example' # String | 

v_c_merchant_id = 'v_c_merchant_id_example' # String | 

v_c_permissions = 'v_c_permissions_example' # String | 

v_c_correlation_id = 'v_c_correlation_id_example' # String | 

v_c_organization_id = 'v_c_organization_id_example' # String | 


begin
  #Process a Pull Funds Refund
  result = api_instance.create_pull_funds_refund(pull_funds_refund_request, id, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PullFundsApi->create_pull_funds_refund: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pull_funds_refund_request** | [**PullFundsRefundRequest**](PullFundsRefundRequest.md)|  | 
 **id** | **String**| The transaction id of a previous Account Funding Transaction.  | 
 **content_type** | **String**|  | 
 **x_requestid** | **String**|  | 
 **v_c_merchant_id** | **String**|  | 
 **v_c_permissions** | **String**|  | 
 **v_c_correlation_id** | **String**|  | 
 **v_c_organization_id** | **String**|  | 

### Return type

[**PullFundsRefund201Response**](PullFundsRefund201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **create_pull_funds_reversal**
> PullFundsReversal201Response create_pull_funds_reversal(pull_funds_reversal_request, id, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)

Process a Pull Funds Reversal

Reverse an Account Funding Transaction (AFT). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PullFundsApi.new

pull_funds_reversal_request = CyberSource::PullFundsReversalRequest.new # PullFundsReversalRequest | 

id = 'id_example' # String | The transaction id of a previous Account Funding Transaction. 

content_type = 'content_type_example' # String | 

x_requestid = 'x_requestid_example' # String | 

v_c_merchant_id = 'v_c_merchant_id_example' # String | 

v_c_permissions = 'v_c_permissions_example' # String | 

v_c_correlation_id = 'v_c_correlation_id_example' # String | 

v_c_organization_id = 'v_c_organization_id_example' # String | 


begin
  #Process a Pull Funds Reversal
  result = api_instance.create_pull_funds_reversal(pull_funds_reversal_request, id, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PullFundsApi->create_pull_funds_reversal: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pull_funds_reversal_request** | [**PullFundsReversalRequest**](PullFundsReversalRequest.md)|  | 
 **id** | **String**| The transaction id of a previous Account Funding Transaction.  | 
 **content_type** | **String**|  | 
 **x_requestid** | **String**|  | 
 **v_c_merchant_id** | **String**|  | 
 **v_c_permissions** | **String**|  | 
 **v_c_correlation_id** | **String**|  | 
 **v_c_organization_id** | **String**|  | 

### Return type

[**PullFundsReversal201Response**](PullFundsReversal201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **create_pull_funds_transfer**
> PullFunds201Response create_pull_funds_transfer(pull_funds_request, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)

Process a Pull Funds Transfer

Receive funds using an Account Funding Transaction (AFT). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PullFundsApi.new

pull_funds_request = CyberSource::PullFundsRequest.new # PullFundsRequest | 

content_type = 'content_type_example' # String | 

x_requestid = 'x_requestid_example' # String | 

v_c_merchant_id = 'v_c_merchant_id_example' # String | 

v_c_permissions = 'v_c_permissions_example' # String | 

v_c_correlation_id = 'v_c_correlation_id_example' # String | 

v_c_organization_id = 'v_c_organization_id_example' # String | 


begin
  #Process a Pull Funds Transfer
  result = api_instance.create_pull_funds_transfer(pull_funds_request, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PullFundsApi->create_pull_funds_transfer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pull_funds_request** | [**PullFundsRequest**](PullFundsRequest.md)|  | 
 **content_type** | **String**|  | 
 **x_requestid** | **String**|  | 
 **v_c_merchant_id** | **String**|  | 
 **v_c_permissions** | **String**|  | 
 **v_c_correlation_id** | **String**|  | 
 **v_c_organization_id** | **String**|  | 

### Return type

[**PullFunds201Response**](PullFunds201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



