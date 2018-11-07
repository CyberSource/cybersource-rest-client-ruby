# CyberSource::ReportDefinitionsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_resource_info_by_report_definition**](ReportDefinitionsApi.md#get_resource_info_by_report_definition) | **GET** /reporting/v3/report-definitions/{reportDefinitionName} | Get a single report definition information
[**get_resource_v2_info**](ReportDefinitionsApi.md#get_resource_v2_info) | **GET** /reporting/v3/report-definitions | Get reporting resource information


# **get_resource_info_by_report_definition**
> InlineResponse2005 get_resource_info_by_report_definition(report_definition_name, opts)

Get a single report definition information

The report definition name must be used as path parameter exclusive of each other

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportDefinitionsApi.new

report_definition_name = "report_definition_name_example" # String | Name of the Report definition to retrieve

opts = { 
  organization_id: "organization_id_example" # String | Valid Cybersource Organization Id
}

begin
  #Get a single report definition information
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
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 

### Return type

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



# **get_resource_v2_info**
> InlineResponse2004 get_resource_v2_info(opts)

Get reporting resource information



### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportDefinitionsApi.new

opts = { 
  organization_id: "organization_id_example" # String | Valid Cybersource Organization Id
}

begin
  #Get reporting resource information
  result = api_instance.get_resource_v2_info(opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportDefinitionsApi->get_resource_v2_info: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



