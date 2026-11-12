# CyberSource::ForeignExchangeRatesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_fx_rates**](ForeignExchangeRatesApi.md#create_fx_rates) | **POST** /pts/v2/payouts/fx-rates | Retrieve Foreign Exchange Rates


# **create_fx_rates**
> CreateFxRatesResponse create_fx_rates(create_fx_rates_request, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)

Retrieve Foreign Exchange Rates

Retrieve current foreign exchange rates for cross-border payouts. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ForeignExchangeRatesApi.new

create_fx_rates_request = CyberSource::CreateFxRatesRequest.new # CreateFxRatesRequest | 

content_type = 'content_type_example' # String | 

x_requestid = 'x_requestid_example' # String | 

v_c_merchant_id = 'v_c_merchant_id_example' # String | 

v_c_permissions = 'v_c_permissions_example' # String | 

v_c_correlation_id = 'v_c_correlation_id_example' # String | 

v_c_organization_id = 'v_c_organization_id_example' # String | 


begin
  #Retrieve Foreign Exchange Rates
  result = api_instance.create_fx_rates(create_fx_rates_request, content_type, x_requestid, v_c_merchant_id, v_c_permissions, v_c_correlation_id, v_c_organization_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ForeignExchangeRatesApi->create_fx_rates: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_fx_rates_request** | [**CreateFxRatesRequest**](CreateFxRatesRequest.md)|  | 
 **content_type** | **String**|  | 
 **x_requestid** | **String**|  | 
 **v_c_merchant_id** | **String**|  | 
 **v_c_permissions** | **String**|  | 
 **v_c_correlation_id** | **String**|  | 
 **v_c_organization_id** | **String**|  | 

### Return type

[**CreateFxRatesResponse**](CreateFxRatesResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



