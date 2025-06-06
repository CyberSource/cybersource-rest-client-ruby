# CyberSource::PaymentLinksApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_payment_link**](PaymentLinksApi.md#create_payment_link) | **POST** /ipl/v2/payment-links | Create a Payment Link
[**get_all_payment_links**](PaymentLinksApi.md#get_all_payment_links) | **GET** /ipl/v2/payment-links | Get a List of Payment Links
[**get_payment_link**](PaymentLinksApi.md#get_payment_link) | **GET** /ipl/v2/payment-links/{id} | Get Payment Link Details
[**update_payment_link**](PaymentLinksApi.md#update_payment_link) | **PATCH** /ipl/v2/payment-links/{id} | Update a Payment Link


# **create_payment_link**
> PblPaymentLinksPost201Response create_payment_link(create_payment_link_request)

Create a Payment Link

Create a new payment link.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentLinksApi.new

create_payment_link_request = CyberSource::CreatePaymentLinkRequest.new # CreatePaymentLinkRequest | 


begin
  #Create a Payment Link
  result = api_instance.create_payment_link(create_payment_link_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentLinksApi->create_payment_link: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_payment_link_request** | [**CreatePaymentLinkRequest**](CreatePaymentLinkRequest.md)|  | 

### Return type

[**PblPaymentLinksPost201Response**](PblPaymentLinksPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_all_payment_links**
> PblPaymentLinksAllGet200Response get_all_payment_links(offset, limit, opts)

Get a List of Payment Links

Provides a (filtered) list of payment links that have been created in your account. You can filter the list based on the following status types:  - ACTIVE  - INACTIVE 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentLinksApi.new

offset = 56 # Integer | Page offset number.

limit = 56 # Integer | Maximum number of items you would like returned.   Maximum limit: 1000 

opts = { 
  status: 'status_example' # String | The status of the purchase or donation link.  Possible values:   - ACTIVE   - INACTIVE 
}

begin
  #Get a List of Payment Links
  result = api_instance.get_all_payment_links(offset, limit, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentLinksApi->get_all_payment_links: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **Integer**| Page offset number. | 
 **limit** | **Integer**| Maximum number of items you would like returned.   Maximum limit: 1000  | 
 **status** | **String**| The status of the purchase or donation link.  Possible values:   - ACTIVE   - INACTIVE  | [optional] 

### Return type

[**PblPaymentLinksAllGet200Response**](PblPaymentLinksAllGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_payment_link**
> PblPaymentLinksGet200Response get_payment_link(id)

Get Payment Link Details

You can retrieve details of a specific payment link. For each payment transaction you can use the Transaction Details API to get more details on the payment transaction.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentLinksApi.new

id = 'id_example' # String | The purchase number.


begin
  #Get Payment Link Details
  result = api_instance.get_payment_link(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentLinksApi->get_payment_link: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The purchase number. | 

### Return type

[**PblPaymentLinksGet200Response**](PblPaymentLinksGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **update_payment_link**
> PblPaymentLinksPost201Response update_payment_link(id, update_payment_link_request)

Update a Payment Link

You can update all information except the payment link number until any payment is received for a payment link.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentLinksApi.new

id = 'id_example' # String | The purchase number.

update_payment_link_request = CyberSource::UpdatePaymentLinkRequest.new # UpdatePaymentLinkRequest | Updating the purchase or donation link does not resend the link automatically. You must resend the purchase or donation link separately.


begin
  #Update a Payment Link
  result = api_instance.update_payment_link(id, update_payment_link_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentLinksApi->update_payment_link: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The purchase number. | 
 **update_payment_link_request** | [**UpdatePaymentLinkRequest**](UpdatePaymentLinkRequest.md)| Updating the purchase or donation link does not resend the link automatically. You must resend the purchase or donation link separately. | 

### Return type

[**PblPaymentLinksPost201Response**](PblPaymentLinksPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



