# CyberSource::ReportsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_report**](ReportsApi.md#create_report) | **POST** /reporting/v3/reports | Create Adhoc Report
[**get_report_by_report_id**](ReportsApi.md#get_report_by_report_id) | **GET** /reporting/v3/reports/{reportId} | Get Report based on reportId
[**search_reports**](ReportsApi.md#search_reports) | **GET** /reporting/v3/reports | Retrieve available reports


# **create_report**
> create_report(create_adhoc_report_request, opts)

Create Adhoc Report

Create a one-time report. You must specify the type of report in reportDefinitionName. For a list of values for reportDefinitionName, see the [Reporting Developer Guide](https://www.cybersource.com/developers/documentation/reporting_and_reconciliation) 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportsApi.new

create_adhoc_report_request = CyberSource::CreateAdhocReportRequest.new # CreateAdhocReportRequest | Report subscription request payload

opts = { 
  organization_id: "organization_id_example" # String | Valid Cybersource Organization Id
}

begin
  #Create Adhoc Report
  api_instance.create_report(create_adhoc_report_request, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportsApi->create_report: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_adhoc_report_request** | [**CreateAdhocReportRequest**](CreateAdhocReportRequest.md)| Report subscription request payload | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/hal+json



# **get_report_by_report_id**
> ReportingV3ReportsIdGet200Response get_report_by_report_id(report_id, opts)

Get Report based on reportId

Download a report using the reportId value. If you don’t already know this value, you can obtain it using the Retrieve available reports call. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportsApi.new

report_id = "report_id_example" # String | Valid Report Id

opts = { 
  organization_id: "organization_id_example" # String | Valid Cybersource Organization Id
}

begin
  #Get Report based on reportId
  result = api_instance.get_report_by_report_id(report_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportsApi->get_report_by_report_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_id** | **String**| Valid Report Id | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 

### Return type

[**ReportingV3ReportsIdGet200Response**](ReportingV3ReportsIdGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json, application/xml



# **search_reports**
> ReportingV3ReportsGet200Response search_reports(start_time, end_time, time_query_type, opts)

Retrieve available reports

Retrieve a list of the available reports to which you are subscribed. This will also give you the reportId value, which you can also use to download a report. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportsApi.new

start_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

end_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

time_query_type = "time_query_type_example" # String | Specify time you would like to search  Valid values: - reportTimeFrame - executedTime 

opts = { 
  organization_id: "organization_id_example", # String | Valid Cybersource Organization Id
  report_mime_type: "report_mime_type_example", # String | Valid Report Format  Valid values: - application/xml - text/csv 
  report_frequency: "report_frequency_example", # String | Valid Report Frequency  Valid values: - DAILY - WEEKLY - MONTHLY - USER_DEFINED - ADHOC 
  report_name: "report_name_example", # String | Valid Report Name
  report_definition_id: 56, # Integer | Valid Report Definition Id
  report_status: "report_status_example" # String | Valid Report Status  Valid values: - COMPLETED - PENDING - QUEUED - RUNNING - ERROR - NO_DATA 
}

begin
  #Retrieve available reports
  result = api_instance.search_reports(start_time, end_time, time_query_type, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportsApi->search_reports: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_time** | **DateTime**| Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **end_time** | **DateTime**| Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **time_query_type** | **String**| Specify time you would like to search  Valid values: - reportTimeFrame - executedTime  | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 
 **report_mime_type** | **String**| Valid Report Format  Valid values: - application/xml - text/csv  | [optional] 
 **report_frequency** | **String**| Valid Report Frequency  Valid values: - DAILY - WEEKLY - MONTHLY - USER_DEFINED - ADHOC  | [optional] 
 **report_name** | **String**| Valid Report Name | [optional] 
 **report_definition_id** | **Integer**| Valid Report Definition Id | [optional] 
 **report_status** | **String**| Valid Report Status  Valid values: - COMPLETED - PENDING - QUEUED - RUNNING - ERROR - NO_DATA  | [optional] 

### Return type

[**ReportingV3ReportsGet200Response**](ReportingV3ReportsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



