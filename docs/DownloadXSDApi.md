# CyberSource::DownloadXSDApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_xsdv2**](DownloadXSDApi.md#get_xsdv2) | **GET** /xsds/{reportDefinitionNameVersion} | Used to download XSDs for reports


# **get_xsdv2**
> get_xsdv2(report_definition_name_version)

Used to download XSDs for reports

Downloads XSDs for reports on no-auth.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DownloadXSDApi.new

report_definition_name_version = "report_definition_name_version_example" # String | Name and version of XSD file to download. Some XSDs only have one version. In that case version name is not needed. Some example values are DecisionManagerDetailReport, DecisionManagerTypes


begin
  #Used to download XSDs for reports
  api_instance.get_xsdv2(report_definition_name_version)
rescue CyberSource::ApiError => e
  puts "Exception when calling DownloadXSDApi->get_xsdv2: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_definition_name_version** | **String**| Name and version of XSD file to download. Some XSDs only have one version. In that case version name is not needed. Some example values are DecisionManagerDetailReport, DecisionManagerTypes | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: text/xml



