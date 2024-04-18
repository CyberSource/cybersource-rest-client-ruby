# CyberSource::KeyManagementApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**search_keys**](KeyManagementApi.md#search_keys) | **GET** /kms/v2/keys | Search Keys


# **search_keys**
> InlineResponse2001 search_keys(opts)

Search Keys

Search one or more Keys

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::KeyManagementApi.new

opts = { 
  offset: 56, # Integer | This allows you to specify the page offset from the resulting list resultset you want the records to be returned
  limit: 56, # Integer | This allows you to specify the total number of records to be returned off the resulting list resultset
  sort: 'sort_example', # String | This allows you to specify a comma separated list of fields in the order which the resulting list resultset must be sorted.
  organization_ids: ['organization_ids_example'], # Array<String> | List of Orgaization Ids to search. The maximum size of the organization Ids list is 1. The maximum length of Organization Id is 30.
  key_ids: ['key_ids_example'], # Array<String> | List of Key Ids to search. The maximum size of the Key Ids list is 1
  key_types: ['key_types_example'], # Array<String> | Key Type, Possible values -  certificate, password, pgp and scmp_api. When Key Type is provided atleast one more filter needs to be provided
  expiration_start_date: DateTime.parse('2013-10-20T19:20:30+01:00'), # DateTime | Expiry Filter Start Date. When Expiration Date filter is provided, atleast one more filter needs to be provided
  expiration_end_date: DateTime.parse('2013-10-20T19:20:30+01:00') # DateTime | Expiry Filter End Date. When Expiration Date filter is provided, atleast one more filter needs to be provided
}

begin
  #Search Keys
  result = api_instance.search_keys(opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling KeyManagementApi->search_keys: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **Integer**| This allows you to specify the page offset from the resulting list resultset you want the records to be returned | [optional] 
 **limit** | **Integer**| This allows you to specify the total number of records to be returned off the resulting list resultset | [optional] 
 **sort** | **String**| This allows you to specify a comma separated list of fields in the order which the resulting list resultset must be sorted. | [optional] 
 **organization_ids** | [**Array&lt;String&gt;**](String.md)| List of Orgaization Ids to search. The maximum size of the organization Ids list is 1. The maximum length of Organization Id is 30. | [optional] 
 **key_ids** | [**Array&lt;String&gt;**](String.md)| List of Key Ids to search. The maximum size of the Key Ids list is 1 | [optional] 
 **key_types** | [**Array&lt;String&gt;**](String.md)| Key Type, Possible values -  certificate, password, pgp and scmp_api. When Key Type is provided atleast one more filter needs to be provided | [optional] 
 **expiration_start_date** | **DateTime**| Expiry Filter Start Date. When Expiration Date filter is provided, atleast one more filter needs to be provided | [optional] 
 **expiration_end_date** | **DateTime**| Expiry Filter End Date. When Expiration Date filter is provided, atleast one more filter needs to be provided | [optional] 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



