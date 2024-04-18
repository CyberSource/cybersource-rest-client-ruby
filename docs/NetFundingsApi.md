# CyberSource::NetFundingsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_net_funding_details**](NetFundingsApi.md#get_net_funding_details) | **GET** /reporting/v3/net-fundings | Get Netfunding Information for an Account or a Merchant


# **get_net_funding_details**
> ReportingV3NetFundingsGet200Response get_net_funding_details(start_time, end_time, opts)

Get Netfunding Information for an Account or a Merchant

Get Netfunding information for an account or a merchant.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::NetFundingsApi.new

start_time = DateTime.parse('2013-10-20T19:20:30+01:00') # DateTime | Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

end_time = DateTime.parse('2013-10-20T19:20:30+01:00') # DateTime | Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

opts = { 
  organization_id: 'organization_id_example', # String | Valid Organization Id
  group_name: 'group_name_example' # String | Valid CyberSource Group Name.
}

begin
  #Get Netfunding Information for an Account or a Merchant
  result = api_instance.get_net_funding_details(start_time, end_time, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling NetFundingsApi->get_net_funding_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_time** | **DateTime**| Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **end_time** | **DateTime**| Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **organization_id** | **String**| Valid Organization Id | [optional] 
 **group_name** | **String**| Valid CyberSource Group Name. | [optional] 

### Return type

[**ReportingV3NetFundingsGet200Response**](ReportingV3NetFundingsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json, application/xml



