# CyberSource::ReportDownloadsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**download_report**](ReportDownloadsApi.md#download_report) | **GET** /reporting/v3/report-downloads | Download a Report


# **download_report**
> download_report(report_date, report_name, opts)

Download a Report

Download a report using the unique report name and date. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportDownloadsApi.new

report_date = Date.parse('2013-10-20') # Date | Valid date on which to download the report in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**  yyyy-mm-dd For reports that span multiple days, this value would be the end date of the report in the time zone of the report subscription. Example 1: If your report start date is 2020-03-06 and the end date is 2020-03-09, the reportDate passed in the query is 2020-03-09. Example 2: If your report runs from midnight to midnight on 2020-03-09, the reportDate passed in the query is 2020-03-10 

report_name = 'report_name_example' # String | Name of the report to download

opts = { 
  organization_id: 'organization_id_example' # String | Valid Organization Id
}

begin
  #Download a Report
  api_instance.download_report(report_date, report_name, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportDownloadsApi->download_report: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_date** | **Date**| Valid date on which to download the report in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**  yyyy-mm-dd For reports that span multiple days, this value would be the end date of the report in the time zone of the report subscription. Example 1: If your report start date is 2020-03-06 and the end date is 2020-03-09, the reportDate passed in the query is 2020-03-09. Example 2: If your report runs from midnight to midnight on 2020-03-09, the reportDate passed in the query is 2020-03-10  | 
 **report_name** | **String**| Name of the report to download | 
 **organization_id** | **String**| Valid Organization Id | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/xml, text/csv



