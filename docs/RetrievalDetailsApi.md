# CyberSource::RetrievalDetailsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_retrieval_details**](RetrievalDetailsApi.md#get_retrieval_details) | **GET** /reporting/v3/retrieval-details | Get Retrieval Details


# **get_retrieval_details**
> ReportingV3RetrievalDetailsGet200Response get_retrieval_details(start_time, end_time, opts)

Get Retrieval Details

Retrieval Detail Report Description

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::RetrievalDetailsApi.new

start_time = DateTime.parse('2013-10-20T19:20:30+01:00') # DateTime | Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

end_time = DateTime.parse('2013-10-20T19:20:30+01:00') # DateTime | Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

opts = { 
  organization_id: 'organization_id_example' # String | Valid Organization Id
}

begin
  #Get Retrieval Details
  result = api_instance.get_retrieval_details(start_time, end_time, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling RetrievalDetailsApi->get_retrieval_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_time** | **DateTime**| Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **end_time** | **DateTime**| Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **organization_id** | **String**| Valid Organization Id | [optional] 

### Return type

[**ReportingV3RetrievalDetailsGet200Response**](ReportingV3RetrievalDetailsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json, application/xml



