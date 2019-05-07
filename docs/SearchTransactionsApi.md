# CyberSource::SearchTransactionsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_search**](SearchTransactionsApi.md#create_search) | **POST** /tss/v2/searches | Create a search request
[**get_search**](SearchTransactionsApi.md#get_search) | **GET** /tss/v2/searches/{searchId} | Get Search results


# **create_search**
> TssV2TransactionsPost201Response create_search(create_search_request)

Create a search request

Create a search request. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SearchTransactionsApi.new

create_search_request = CyberSource::CreateSearchRequest.new # CreateSearchRequest | 


begin
  #Create a search request
  result = api_instance.create_search(create_search_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SearchTransactionsApi->create_search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_search_request** | [**CreateSearchRequest**](CreateSearchRequest.md)|  | 

### Return type

[**TssV2TransactionsPost201Response**](TssV2TransactionsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_search**
> TssV2TransactionsPost201Response get_search(search_id)

Get Search results

Include the Search ID in the GET request to retrieve the search results. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SearchTransactionsApi.new

search_id = "search_id_example" # String | Search ID.


begin
  #Get Search results
  result = api_instance.get_search(search_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SearchTransactionsApi->get_search: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_id** | **String**| Search ID. | 

### Return type

[**TssV2TransactionsPost201Response**](TssV2TransactionsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



