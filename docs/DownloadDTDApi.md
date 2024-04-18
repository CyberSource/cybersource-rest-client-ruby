# CyberSource::DownloadDTDApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_dtdv2**](DownloadDTDApi.md#get_dtdv2) | **GET** /reporting/v3/dtds/{reportDefinitionNameVersion} | Download DTD for Report


# **get_dtdv2**
> get_dtdv2(report_definition_name_version)

Download DTD for Report

Used to download DTDs for reports on no-auth.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DownloadDTDApi.new

report_definition_name_version = 'report_definition_name_version_example' # String | Name and version of DTD file to download. Some DTDs only have one version. In that case version name is not needed. Some example values are ctdr-1.0, tdr, pbdr-1.1


begin
  #Download DTD for Report
  api_instance.get_dtdv2(report_definition_name_version)
rescue CyberSource::ApiError => e
  puts "Exception when calling DownloadDTDApi->get_dtdv2: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_definition_name_version** | **String**| Name and version of DTD file to download. Some DTDs only have one version. In that case version name is not needed. Some example values are ctdr-1.0, tdr, pbdr-1.1 | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/xml-dtd



