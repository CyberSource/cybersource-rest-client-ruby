# CyberSource::DeviceSearchApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**post_search_query_v3**](DeviceSearchApi.md#post_search_query_v3) | **POST** /dms/v3/devices/search | Retrieve List of Devices for a given search query V3


# **post_search_query_v3**
> InlineResponse2006 post_search_query_v3(post_device_search_request_v3)

Retrieve List of Devices for a given search query V3

Search for devices matching a given search query.  The search query supports serialNumber, readerId, terminalId, status, statusChangeReason or organizationId  Matching results are paginated. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DeviceSearchApi.new

post_device_search_request_v3 = CyberSource::PostDeviceSearchRequestV3.new # PostDeviceSearchRequestV3 | 


begin
  #Retrieve List of Devices for a given search query V3
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

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=UTF-8
 - **Accept**: application/json;charset=UTF-8



