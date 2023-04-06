# CyberSource::TaxesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**calculate_tax**](TaxesApi.md#calculate_tax) | **POST** /vas/v2/tax | Calculate Taxes
[**void_tax**](TaxesApi.md#void_tax) | **PATCH** /vas/v2/tax/{id} | Void Taxes


# **calculate_tax**
> VasV2PaymentsPost201Response calculate_tax(tax_request)

Calculate Taxes

The tax calculation service provides real-time sales tax and VAT calculations for orders placed with your business worldwide.  It enhances your ability to conduct business globally and enables you to avoid the risk and complexity of managing online tax calculation.  The service supports product-based tax rules and exemptions for goods and services.  The tax rates are updated twice a month and calculations include sub-level detail (rates per taxing jurisdiction, names and types of jurisdictions). Implementation guidance, list of supported countries, and information on tax reporting are in the [Tax User Guide](https://developer.cybersource.com/docs/cybs/en-us/tax-calculation/developer/all/rest/tax-calculation/tax-overview.html). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TaxesApi.new

tax_request = CyberSource::TaxRequest.new # TaxRequest | 


begin
  #Calculate Taxes
  result = api_instance.calculate_tax(tax_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TaxesApi->calculate_tax: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tax_request** | [**TaxRequest**](TaxRequest.md)|  | 

### Return type

[**VasV2PaymentsPost201Response**](VasV2PaymentsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **void_tax**
> VasV2TaxVoid200Response void_tax(void_tax_request, id)

Void Taxes

Pass the Tax Request ID in the PATCH request to void the committed tax calculation.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TaxesApi.new

void_tax_request = CyberSource::VoidTaxRequest.new # VoidTaxRequest | 

id = "id_example" # String | The tax ID returned from a previous request.


begin
  #Void Taxes
  result = api_instance.void_tax(void_tax_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TaxesApi->void_tax: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **void_tax_request** | [**VoidTaxRequest**](VoidTaxRequest.md)|  | 
 **id** | **String**| The tax ID returned from a previous request. | 

### Return type

[**VasV2TaxVoid200Response**](VasV2TaxVoid200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



