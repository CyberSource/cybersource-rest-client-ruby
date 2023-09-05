# CyberSource::InvoiceSettingsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_invoice_settings**](InvoiceSettingsApi.md#get_invoice_settings) | **GET** /invoicing/v2/invoiceSettings | Get Invoice Settings
[**update_invoice_settings**](InvoiceSettingsApi.md#update_invoice_settings) | **PUT** /invoicing/v2/invoiceSettings | Update Invoice Settings


# **get_invoice_settings**
> InvoicingV2InvoiceSettingsGet200Response get_invoice_settings

Get Invoice Settings

Get the invoice settings for the invoice payment page.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoiceSettingsApi.new

begin
  #Get Invoice Settings
  result = api_instance.get_invoice_settings
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InvoiceSettingsApi->get_invoice_settings: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InvoicingV2InvoiceSettingsGet200Response**](InvoicingV2InvoiceSettingsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **update_invoice_settings**
> InvoicingV2InvoiceSettingsGet200Response update_invoice_settings(invoice_settings_request)

Update Invoice Settings

Update invoice settings for the invoice payment page.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoiceSettingsApi.new

invoice_settings_request = CyberSource::InvoiceSettingsRequest.new # InvoiceSettingsRequest | 


begin
  #Update Invoice Settings
  result = api_instance.update_invoice_settings(invoice_settings_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InvoiceSettingsApi->update_invoice_settings: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **invoice_settings_request** | [**InvoiceSettingsRequest**](InvoiceSettingsRequest.md)|  | 

### Return type

[**InvoicingV2InvoiceSettingsGet200Response**](InvoicingV2InvoiceSettingsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



