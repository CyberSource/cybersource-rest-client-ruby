# CyberSource::VisaProtectRiskInsightsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**submit_vpri**](VisaProtectRiskInsightsApi.md#submit_vpri) | **POST** /unifiedrisk | Visa Protect Risk Insights


# **submit_vpri**
> UnifiedRiskPost201Response submit_vpri(vpri_request)

Visa Protect Risk Insights

VPRI delivers real-time, AI-driven risk scores and insights via a data-only API to enrich existing fraud strategies and improve decisioning. It integrates easily into existing workflows and provides immediate value by identifying legitimate behavior across Visa's global network—helping reduce false declines and increase acceptance.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::VisaProtectRiskInsightsApi.new

vpri_request = CyberSource::VpriRequest.new # VpriRequest | VPRI request for Transaction Risk Scoring or Transaction Risk Labeling


begin
  #Visa Protect Risk Insights
  result = api_instance.submit_vpri(vpri_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling VisaProtectRiskInsightsApi->submit_vpri: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **vpri_request** | [**VpriRequest**](VpriRequest.md)| VPRI request for Transaction Risk Scoring or Transaction Risk Labeling | 

### Return type

[**UnifiedRiskPost201Response**](UnifiedRiskPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



