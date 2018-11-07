# CyberSource::TransactionDetailsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_transaction**](TransactionDetailsApi.md#get_transaction) | **GET** /tss/v2/transactions/{id} | Retrieve a Transaction


# **get_transaction**
> InlineResponse20012 get_transaction(id)

Retrieve a Transaction

Include the Request ID in the GET request to retrieve the transaction details.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransactionDetailsApi.new

id = "id_example" # String | Request ID. 


begin
  #Retrieve a Transaction
  result = api_instance.get_transaction(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TransactionDetailsApi->get_transaction: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Request ID.  | 

### Return type

[**InlineResponse20012**](InlineResponse20012.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



