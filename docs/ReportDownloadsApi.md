# CyberSource::ReportDownloadsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**download_report**](ReportDownloadsApi.md#download_report) | **GET** /reporting/v3/report-downloads | Download a report


# **download_report**
> download_report(report_date, report_name, opts)

Download a report

Download a report using the unique report name and date. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportDownloadsApi.new

report_date = Date.parse("2013-10-20") # Date | Valid date on which to download the report in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd 

report_name = "report_name_example" # String | Name of the report to download

opts = { 
  organization_id: "organization_id_example", # String | Valid Cybersource Organization Id
  report_time: "report_time_example" # String | Valid time on which to download the report in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Time Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example time format:**   - hh:mm:ss±hh:mm 
}

begin
  #Download a report
  api_instance.download_report(report_date, report_name, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportDownloadsApi->download_report: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_date** | **Date**| Valid date on which to download the report in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd  | 
 **report_name** | **String**| Name of the report to download | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 
 **report_time** | **String**| Valid time on which to download the report in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Time Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example time format:**   - hh:mm:ss±hh:mm  | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/xml, text/csv



