# CyberSource::DeviceSearchApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**post_search_query**](DeviceSearchApi.md#post_search_query) | **POST** /dms/v2/devices/search | Retrieve List of Devices for a given search query V2
[**post_search_query_v3**](DeviceSearchApi.md#post_search_query_v3) | **POST** /dms/v3/devices/search | Retrieve List of Devices for a given search query


# **post_search_query**
> InlineResponse2006 post_search_query(post_device_search_request)

Retrieve List of Devices for a given search query V2

Retrieves list of terminals in paginated format.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DeviceSearchApi.new

post_device_search_request = CyberSource::PostDeviceSearchRequest.new # PostDeviceSearchRequest | 


begin
  #Retrieve List of Devices for a given search query V2
  result = api_instance.post_search_query(post_device_search_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling DeviceSearchApi->post_search_query: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **post_device_search_request** | [**PostDeviceSearchRequest**](PostDeviceSearchRequest.md)|  | 

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=UTF-8
 - **Accept**: application/json;charset=UTF-8



# **post_search_query_v3**
> InlineResponse2008 post_search_query_v3(post_device_search_request_v3)

Retrieve List of Devices for a given search query

Search for devices matching a given search query.  The search query supports serialNumber, readerId, terminalId, status, statusChangeReason or organizationId  Matching results are paginated. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DeviceSearchApi.new

post_device_search_request_v3 = CyberSource::PostDeviceSearchRequestV3.new # PostDeviceSearchRequestV3 | 


begin
  #Retrieve List of Devices for a given search query
  result = api_instance.post_search_query_v3(post_device_search_request_v3)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling DeviceSearchApi->post_search_query_v3: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **post_device_search_request_v3** | [**PostDeviceSearchRequestV3**](PostDeviceSearchRequestV3.md)|  | 

### Return type

[**InlineResponse2008**](InlineResponse2008.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=UTF-8
 - **Accept**: application/json;charset=UTF-8



