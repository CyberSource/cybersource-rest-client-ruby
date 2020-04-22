# CyberSource::InvoicesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_invoice**](InvoicesApi.md#create_invoice) | **POST** /invoicing/v2/invoices | Create a New Invoice
[**get_all_invoices**](InvoicesApi.md#get_all_invoices) | **GET** /invoicing/v2/invoices | Get a List of Invoices
[**get_invoice**](InvoicesApi.md#get_invoice) | **GET** /invoicing/v2/invoices/{id} | Get Invoice Details
[**perform_cancel_action**](InvoicesApi.md#perform_cancel_action) | **POST** /invoicing/v2/invoices/{id}/cancelation | Cancel an Invoice
[**perform_send_action**](InvoicesApi.md#perform_send_action) | **POST** /invoicing/v2/invoices/{id}/delivery | Send an Invoice
[**update_invoice**](InvoicesApi.md#update_invoice) | **PUT** /invoicing/v2/invoices/{id} | Update an Invoice


# **create_invoice**
> InvoicingV2InvoicesPost201Response create_invoice(create_invoice_request)

Create a New Invoice

Create a new invoice.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

create_invoice_request = CyberSource::CreateInvoiceRequest.new # CreateInvoiceRequest | 


begin
  #Create a New Invoice
  result = api_instance.create_invoice(create_invoice_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InvoicesApi->create_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_invoice_request** | [**CreateInvoiceRequest**](CreateInvoiceRequest.md)|  | 

### Return type

[**InvoicingV2InvoicesPost201Response**](InvoicingV2InvoicesPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_all_invoices**
> InvoicingV2InvoicesAllGet200Response get_all_invoices(offset, limit, opts)

Get a List of Invoices

Get a list of invoices.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

offset = 56 # Integer | Page offset number.

limit = 56 # Integer | Maximum number of items you would like returned.

opts = { 
  status: "status_example" # String | The status of the invoice.  Possible values:   - DRAFT   - CREATED   - SENT   - PARTIAL   - PAID   - CANCELED 
}

begin
  #Get a List of Invoices
  result = api_instance.get_all_invoices(offset, limit, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InvoicesApi->get_all_invoices: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **Integer**| Page offset number. | 
 **limit** | **Integer**| Maximum number of items you would like returned. | 
 **status** | **String**| The status of the invoice.  Possible values:   - DRAFT   - CREATED   - SENT   - PARTIAL   - PAID   - CANCELED  | [optional] 

### Return type

[**InvoicingV2InvoicesAllGet200Response**](InvoicingV2InvoicesAllGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_invoice**
> InvoicingV2InvoicesGet200Response get_invoice(id)

Get Invoice Details

Get the details of a specific invoice.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

id = "id_example" # String | The invoice number.


begin
  #Get Invoice Details
  result = api_instance.get_invoice(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InvoicesApi->get_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The invoice number. | 

### Return type

[**InvoicingV2InvoicesGet200Response**](InvoicingV2InvoicesGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **perform_cancel_action**
> InvoicingV2InvoicesPost201Response perform_cancel_action(id)

Cancel an Invoice

Cancel an invoice.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

id = "id_example" # String | The invoice number.


begin
  #Cancel an Invoice
  result = api_instance.perform_cancel_action(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InvoicesApi->perform_cancel_action: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The invoice number. | 

### Return type

[**InvoicingV2InvoicesPost201Response**](InvoicingV2InvoicesPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **perform_send_action**
> InvoicingV2InvoicesPost201Response perform_send_action(id)

Send an Invoice

Send an invoice.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

id = "id_example" # String | The invoice number.


begin
  #Send an Invoice
  result = api_instance.perform_send_action(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InvoicesApi->perform_send_action: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The invoice number. | 

### Return type

[**InvoicingV2InvoicesPost201Response**](InvoicingV2InvoicesPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_invoice**
> InvoicingV2InvoicesPost201Response update_invoice(id, update_invoice_request)

Update an Invoice

Update an invoice.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

id = "id_example" # String | The invoice number.

update_invoice_request = CyberSource::UpdateInvoiceRequest.new # UpdateInvoiceRequest | Updating the invoice does not resend the invoice automatically. You must resend the invoice separately.


begin
  #Update an Invoice
  result = api_instance.update_invoice(id, update_invoice_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling InvoicesApi->update_invoice: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The invoice number. | 
 **update_invoice_request** | [**UpdateInvoiceRequest**](UpdateInvoiceRequest.md)| Updating the invoice does not resend the invoice automatically. You must resend the invoice separately. | 

### Return type

[**InvoicingV2InvoicesPost201Response**](InvoicingV2InvoicesPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



