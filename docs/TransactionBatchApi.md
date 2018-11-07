# CyberSource::TransactionBatchApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**pts_v1_transaction_batches_id_get**](TransactionBatchApi.md#pts_v1_transaction_batches_id_get) | **GET** /pts/v1/transaction-batches/{id} | Get an individual batch file Details processed through the Offline Transaction Submission Services


# **pts_v1_transaction_batches_id_get**
> pts_v1_transaction_batches_id_get(id)

Get an individual batch file Details processed through the Offline Transaction Submission Services

Provide the search range

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransactionBatchApi.new

id = "id_example" # String | The batch id assigned for the template.


begin
  #Get an individual batch file Details processed through the Offline Transaction Submission Services
  api_instance.pts_v1_transaction_batches_id_get(id)
rescue CyberSource::ApiError => e
  puts "Exception when calling TransactionBatchApi->pts_v1_transaction_batches_id_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The batch id assigned for the template. | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



