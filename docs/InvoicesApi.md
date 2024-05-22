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

The invoicing product enables you to bill any customer with an email address and accept digital payments securely from any connected device. You can either use the system generated email or use the invoice payment link in your own communication. You can add discounts and taxes for the entire invoice or for each line item. To customize the invoice to match your brand see [Invoice Settings](https://developer.cybersource.com/api-reference-assets/index.html#invoicing_invoice-settings_update-invoice-settings). The invoice payment page uses Unified Checkout to process the payments.

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
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_all_invoices**
> InvoicingV2InvoicesAllGet200Response get_all_invoices(offset, limit, opts)

Get a List of Invoices

Provides a (filtered) list of invoices that have been created in your account. You can filter the list based on Invoice Status by setting the status query parameter to one of DRAFT, CREATED, SENT, PARTIAL, PAID or CANCELED.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

offset = 56 # Integer | Page offset number.

limit = 56 # Integer | Maximum number of items you would like returned.

opts = { 
  status: 'status_example' # String | The status of the invoice.  Possible values:   - DRAFT   - CREATED   - SENT   - PARTIAL   - PAID   - CANCELED   - PENDING 
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
 **status** | **String**| The status of the invoice.  Possible values:   - DRAFT   - CREATED   - SENT   - PARTIAL   - PAID   - CANCELED   - PENDING  | [optional] 

### Return type

[**InvoicingV2InvoicesAllGet200Response**](InvoicingV2InvoicesAllGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_invoice**
> InvoicingV2InvoicesGet200Response get_invoice(id)

Get Invoice Details

You can retrieve details of a specific invoice. This can be used to check the Invoice status and get a list of invoice payments in the invoice history section of the response. For each payment transaction you can use the Transaction Details API to get more details on the payment transaction.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

id = 'id_example' # String | The invoice number.


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
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **perform_cancel_action**
> InvoicingV2InvoicesPost201Response perform_cancel_action(id)

Cancel an Invoice

You can cancel an invoice if no payment is made to it. You cannot cancel partially or fully paid invoices.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

id = 'id_example' # String | The invoice number.


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
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **perform_send_action**
> InvoicingV2InvoicesPost201Response perform_send_action(id)

Send an Invoice

You can send an invoice in draft or created state or resend a sent or partially paid invoice. Fully paid or canceled invoices cannot be resent.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

id = 'id_example' # String | The invoice number.


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
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **update_invoice**
> InvoicingV2InvoicesPost201Response update_invoice(id, update_invoice_request)

Update an Invoice

You can update all information except the invoice number till any payment is received for an invoice. Invoices that are partially or fully paid or cancelled cannot be updated.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::InvoicesApi.new

id = 'id_example' # String | The invoice number.

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
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



