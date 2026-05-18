# CyberSource::ChargebackSummariesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_chargeback_summaries**](ChargebackSummariesApi.md#get_chargeback_summaries) | **GET** /reporting/v3/chargeback-summaries | Get Chargeback Summaries


# **get_chargeback_summaries**
> ReportingV3ChargebackSummariesGet200Response get_chargeback_summaries(start_time, end_time, opts)

Get Chargeback Summaries

Chargeback Summary Report Description

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ChargebackSummariesApi.new

start_time = DateTime.parse('2013-10-20T19:20:30+01:00') # DateTime | Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

end_time = DateTime.parse('2013-10-20T19:20:30+01:00') # DateTime | Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

opts = { 
  organization_id: 'organization_id_example' # String | Valid Organization Id
}

begin
  #Get Chargeback Summaries
  result = api_instance.get_chargeback_summaries(start_time, end_time, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ChargebackSummariesApi->get_chargeback_summaries: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_time** | **DateTime**| Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **end_time** | **DateTime**| Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **organization_id** | **String**| Valid Organization Id | [optional] 

### Return type

[**ReportingV3ChargebackSummariesGet200Response**](ReportingV3ChargebackSummariesGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json, application/xml



