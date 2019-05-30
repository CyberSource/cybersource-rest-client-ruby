# CyberSource::TransactionBatchesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pts_v1_transaction_batches_get**](TransactionBatchesApi.md#pts_v1_transaction_batches_get) | **GET** /pts/v1/transaction-batches | Gets a list of batch files
[**pts_v1_transaction_batches_id_get**](TransactionBatchesApi.md#pts_v1_transaction_batches_id_get) | **GET** /pts/v1/transaction-batches/{id} | Get individual batch file


# **pts_v1_transaction_batches_get**
> PtsV1TransactionBatchesGet200Response pts_v1_transaction_batches_get(start_time, end_time)

Gets a list of batch files

Provide the search range

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransactionBatchesApi.new

start_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZZ 

end_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZZ 


begin
  #Gets a list of batch files
  result = api_instance.pts_v1_transaction_batches_get(start_time, end_time)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TransactionBatchesApi->pts_v1_transaction_batches_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_time** | **DateTime**| Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZZ  | 
 **end_time** | **DateTime**| Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZZ  | 

### Return type

[**PtsV1TransactionBatchesGet200Response**](PtsV1TransactionBatchesGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



# **pts_v1_transaction_batches_id_get**
> PtsV1TransactionBatchesIdGet200Response pts_v1_transaction_batches_id_get(id)

Get individual batch file

Provide the search range

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransactionBatchesApi.new

id = "id_example" # String | The batch id assigned for the template.


begin
  #Get individual batch file
  result = api_instance.pts_v1_transaction_batches_id_get(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TransactionBatchesApi->pts_v1_transaction_batches_id_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The batch id assigned for the template. | 

### Return type

[**PtsV1TransactionBatchesIdGet200Response**](PtsV1TransactionBatchesIdGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



