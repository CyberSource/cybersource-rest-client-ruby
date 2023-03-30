# CyberSource::MicroformIntegrationApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**generate_capture_context**](MicroformIntegrationApi.md#generate_capture_context) | **POST** /microform/v2/sessions | Generate Capture Context


# **generate_capture_context**
> String generate_capture_context(generate_capture_context_request)

Generate Capture Context

This API is used to generate the Capture Context data structure for the Microform Integration.  Microform is a browser-based acceptance solution that allows a seller to capture payment information is a secure manner from their website.  For more information about Flex Microform transactions, see the [Flex Developer Guides Page](https://developer.cybersource.com/api/developer-guides/dita-flex/SAFlexibleToken.html). For examples on how to integrate Flex Microform within your webpage please see our [GitHub Flex Samples](https://github.com/CyberSource?q=flex&type=&language=) This API is a server-to-server API to generate the capture context that can be used to initiate instance of microform on a acceptance page.  The capture context is a digitally signed JWT that provides authentication, one-time keys, and the target origin to the Microform Integration application. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MicroformIntegrationApi.new

generate_capture_context_request = CyberSource::GenerateCaptureContextRequest.new # GenerateCaptureContextRequest | 


begin
  #Generate Capture Context
  result = api_instance.generate_capture_context(generate_capture_context_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MicroformIntegrationApi->generate_capture_context: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **generate_capture_context_request** | [**GenerateCaptureContextRequest**](GenerateCaptureContextRequest.md)|  | 

### Return type

**String**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/jwt



