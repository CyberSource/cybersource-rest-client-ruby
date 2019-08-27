# CyberSource::ConversionDetailsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_conversion_detail**](ConversionDetailsApi.md#get_conversion_detail) | **GET** /reporting/v3/conversion-details | Get conversion detail transactions


# **get_conversion_detail**
> ReportingV3ConversionDetailsGet200Response get_conversion_detail(start_time, end_time, opts)

Get conversion detail transactions

Get conversion detail of transactions for a merchant.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ConversionDetailsApi.new

start_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

end_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

opts = { 
  organization_id: "organization_id_example" # String | Valid Cybersource Organization Id
}

begin
  #Get conversion detail transactions
  result = api_instance.get_conversion_detail(start_time, end_time, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ConversionDetailsApi->get_conversion_detail: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_time** | **DateTime**| Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **end_time** | **DateTime**| Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 

### Return type

[**ReportingV3ConversionDetailsGet200Response**](ReportingV3ConversionDetailsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json, application/xml



