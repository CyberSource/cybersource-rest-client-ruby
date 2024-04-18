# CyberSource::TransactionBatchesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_transaction_batch_details**](TransactionBatchesApi.md#get_transaction_batch_details) | **GET** /pts/v1/transaction-batch-details/{id} | Get Transaction Details for a given Batch Id
[**get_transaction_batch_id**](TransactionBatchesApi.md#get_transaction_batch_id) | **GET** /pts/v1/transaction-batches/{id} | Get Individual Batch File
[**get_transaction_batches**](TransactionBatchesApi.md#get_transaction_batches) | **GET** /pts/v1/transaction-batches | Get a List of Batch Files


# **get_transaction_batch_details**
> get_transaction_batch_details(id, opts)

Get Transaction Details for a given Batch Id

Provides real-time detailed status information about the transactions that you previously uploaded in the Business Center or processed with the Offline Transaction File Submission service. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransactionBatchesApi.new

id = 'id_example' # String | The batch id assigned for the template.

opts = { 
  upload_date: Date.parse('2013-10-20'), # Date | Date in which the original batch file was uploaded. Date must be in ISO-8601 format. Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14) **Example date format:**  - yyyy-MM-dd 
  status: 'status_example' # String | Allows you to filter by rejected response.  Valid values: - Rejected 
}

begin
  #Get Transaction Details for a given Batch Id
  api_instance.get_transaction_batch_details(id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling TransactionBatchesApi->get_transaction_batch_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The batch id assigned for the template. | 
 **upload_date** | **Date**| Date in which the original batch file was uploaded. Date must be in ISO-8601 format. Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14) **Example date format:**  - yyyy-MM-dd  | [optional] 
 **status** | **String**| Allows you to filter by rejected response.  Valid values: - Rejected  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: text/csv, application/xml, text/vnd.cybersource.map-csv



# **get_transaction_batch_id**
> PtsV1TransactionBatchesIdGet200Response get_transaction_batch_id(id)

Get Individual Batch File

Provide the search range

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransactionBatchesApi.new

id = 'id_example' # String | The batch id assigned for the template.


begin
  #Get Individual Batch File
  result = api_instance.get_transaction_batch_id(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TransactionBatchesApi->get_transaction_batch_id: #{e}"
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



# **get_transaction_batches**
> PtsV1TransactionBatchesGet200Response get_transaction_batches(start_time, end_time)

Get a List of Batch Files

Provide the search range

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransactionBatchesApi.new

start_time = DateTime.parse('2013-10-20T19:20:30+01:00') # DateTime | Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)   **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZZ 

end_time = DateTime.parse('2013-10-20T19:20:30+01:00') # DateTime | Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)   **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZZ 


begin
  #Get a List of Batch Files
  result = api_instance.get_transaction_batches(start_time, end_time)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TransactionBatchesApi->get_transaction_batches: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_time** | **DateTime**| Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)   **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZZ  | 
 **end_time** | **DateTime**| Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)   **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZZ  | 

### Return type

[**PtsV1TransactionBatchesGet200Response**](PtsV1TransactionBatchesGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



