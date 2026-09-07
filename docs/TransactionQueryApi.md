# CyberSource::TransactionQueryApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_query_api**](TransactionQueryApi.md#create_query_api) | **POST** /pts/v2/payouts/transaction-query/{id} | Query Transaction Details


# **create_query_api**
> InlineResponse2014 create_query_api(id, body, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id, opts)

Query Transaction Details

Query the status and details of payouts transactions including Pull Funds, Push Funds, and Pull Funds Reversals 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransactionQueryApi.new

id = 'id_example' # String | This is the CyberSource Request ID generated for successfully processed AFT/OCT that needs to be queried. 

body = CyberSource::Body1.new # Body1 | 

content_type = 'content_type_example' # String | 

x_requestid = 'x_requestid_example' # String | 

v_c_merchant_id = 'v_c_merchant_id_example' # String | 

v_c_permissions = 'v_c_permissions_example' # String | 

v_c_correlation_id = 'v_c_correlation_id_example' # String | 

v_c_organization_id = 'v_c_organization_id_example' # String | 

opts = { 
  limit: 56, # Integer | The maximum number of options to be retrieved from the processor and displayed to the consumer. 
  offset: 56 # Integer | Offset from the first item in the list of options received from the processor. If you want to display the options in multiple lists, this number represents the first option displayed in each list. 
}

begin
  #Query Transaction Details
  result = api_instance.create_query_api(id, body, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TransactionQueryApi->create_query_api: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| This is the CyberSource Request ID generated for successfully processed AFT/OCT that needs to be queried.  | 
 **body** | [**Body1**](Body1.md)|  | 
 **content_type** | **String**|  | 
 **x_requestid** | **String**|  | 
 **v_c_merchant_id** | **String**|  | 
 **v_c_permissions** | **String**|  | 
 **v_c_correlation_id** | **String**|  | 
 **v_c_organization_id** | **String**|  | 
 **limit** | **Integer**| The maximum number of options to be retrieved from the processor and displayed to the consumer.  | [optional] 
 **offset** | **Integer**| Offset from the first item in the list of options received from the processor. If you want to display the options in multiple lists, this number represents the first option displayed in each list.  | [optional] 

### Return type

[**InlineResponse2014**](InlineResponse2014.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



