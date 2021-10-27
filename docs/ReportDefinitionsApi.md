# CyberSource::ReportDefinitionsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_resource_info_by_report_definition**](ReportDefinitionsApi.md#get_resource_info_by_report_definition) | **GET** /reporting/v3/report-definitions/{reportDefinitionName} | Get Report Definition
[**get_resource_v2_info**](ReportDefinitionsApi.md#get_resource_v2_info) | **GET** /reporting/v3/report-definitions | Get Reporting Resource Information


# **get_resource_info_by_report_definition**
> ReportingV3ReportDefinitionsNameGet200Response get_resource_info_by_report_definition(report_definition_name, opts)

Get Report Definition

View the attributes of an individual report type. For a list of values for reportDefinitionName, see the [Reporting Developer Guide](https://www.cybersource.com/developers/documentation/reporting_and_reconciliation/) 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportDefinitionsApi.new

report_definition_name = "report_definition_name_example" # String | Name of the Report definition to retrieve

opts = { 
  subscription_type: "subscription_type_example", # String | The subscription type for which report definition is required. By default the type will be CUSTOM. Valid Values: - CLASSIC - CUSTOM - STANDARD 
  report_mime_type: "report_mime_type_example", # String | The format for which the report definition is required. By default the value will be CSV. Valid Values: - application/xml - text/csv 
  organization_id: "organization_id_example" # String | Valid Organization Id
}

begin
  #Get Report Definition
  result = api_instance.get_resource_info_by_report_definition(report_definition_name, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportDefinitionsApi->get_resource_info_by_report_definition: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_definition_name** | **String**| Name of the Report definition to retrieve | 
 **subscription_type** | **String**| The subscription type for which report definition is required. By default the type will be CUSTOM. Valid Values: - CLASSIC - CUSTOM - STANDARD  | [optional] 
 **report_mime_type** | **String**| The format for which the report definition is required. By default the value will be CSV. Valid Values: - application/xml - text/csv  | [optional] 
 **organization_id** | **String**| Valid Organization Id | [optional] 

### Return type

[**ReportingV3ReportDefinitionsNameGet200Response**](ReportingV3ReportDefinitionsNameGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



# **get_resource_v2_info**
> ReportingV3ReportDefinitionsGet200Response get_resource_v2_info(opts)

Get Reporting Resource Information

View a list of supported reports and their attributes before subscribing to them. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportDefinitionsApi.new

opts = { 
  subscription_type: "subscription_type_example", # String | Valid Values: - CLASSIC - CUSTOM - STANDARD 
  organization_id: "organization_id_example" # String | Valid Organization Id
}

begin
  #Get Reporting Resource Information
  result = api_instance.get_resource_v2_info(opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportDefinitionsApi->get_resource_v2_info: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subscription_type** | **String**| Valid Values: - CLASSIC - CUSTOM - STANDARD  | [optional] 
 **organization_id** | **String**| Valid Organization Id | [optional] 

### Return type

[**ReportingV3ReportDefinitionsGet200Response**](ReportingV3ReportDefinitionsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



