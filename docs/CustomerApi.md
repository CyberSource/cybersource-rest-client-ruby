# CyberSource::CustomerApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_customer**](CustomerApi.md#delete_customer) | **DELETE** /tms/v2/customers/{customerId} | Delete a Customer
[**get_customer**](CustomerApi.md#get_customer) | **GET** /tms/v2/customers/{customerId} | Retrieve a Customer
[**patch_customer**](CustomerApi.md#patch_customer) | **PATCH** /tms/v2/customers/{customerId} | Update a Customer
[**post_customer**](CustomerApi.md#post_customer) | **POST** /tms/v2/customers | Create a Customer


# **delete_customer**
> delete_customer(customer_id, opts)

Delete a Customer

|  |  |  | | --- | --- | --- | |**Customers**<br>A Customer represents your tokenized customer information.<br>You should associate the Customer Id with the customer account on your systems.<br>A Customer can have one or more [Payment Instruments](#token-management_customer-payment-instrument_create-a-customer-payment-instrumentl) or [Shipping Addresses](#token-management_customer-shipping-address_create-a-customer-shipping-address) with one allocated as the Customers default.|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Deleting a Customer**<br>Your system can use this API to delete a complete Customer.<br>When a Customer is deleted all associated Payment Instruments & Shipping Addresses are deleted.<br>Any Instrument Identifiers representing the card number will also be deleted if they are not associated with any other Payment Instruments.<br>Note: Individual [Payment Instruments](#token-management_customer-payment-instrument_delete-a-customer-payment-instrument) or [Shipping Addresses](#token-management_customer-shipping-address_delete-a-customer-shipping-address) can be deleted via their own dedicated API resources. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerApi.new

customer_id = 'customer_id_example' # String | The Id of a Customer.

opts = { 
  profile_id: 'profile_id_example' # String | The Id of a profile containing user specific TMS configuration.
}

begin
  #Delete a Customer
  api_instance.delete_customer(customer_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerApi->delete_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_id** | **String**| The Id of a Customer. | 
 **profile_id** | **String**| The Id of a profile containing user specific TMS configuration. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_customer**
> PostCustomerRequest get_customer(customer_id, opts)

Retrieve a Customer

|  |  |  | | --- | --- | --- | |**Customers**<br>A Customer represents your tokenized customer information.<br>You should associate the Customer Id with the customer account on your systems.<br>A Customer can have one or more [Payment Instruments](#token-management_customer-payment-instrument_create-a-customer-payment-instrumentl) or [Shipping Addresses](#token-management_customer-shipping-address_create-a-customer-shipping-address) with one allocated as the Customers default.<br><br>**Retrieving a Customer**<br>When your customer signs into their account, your system can use this API to retrieve the Customers default Payment Instrument and Shipping Address.<br>**Note: the actual card data will be masked.**<br>If your customer wants to see other available Payment Instruments, your system can [retrieve all Payment Instruments](#token-management_customer-payment-instrument_list-payment-instruments-for-a-customer) associated with the Customer.<br>The same applies to [Shipping Addresses](#token-management_customer-shipping-address_list-shipping-addresses-for-a-customer).|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Payment Network Tokens**<br>Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires.<br>A Payment Network Token will be automatically created and used in future payments if you are enabled for the service.<br>A Payment Network Token can also be [provisioned for an existing Instrument Identifier](#token-management_instrument-identifier_enroll-an-instrument-identifier-for-payment-network-token).<br>For more information about Payment Network Tokens see the Developer Guide.<br><br>**Payments with Customers**<br>To perform a payment with the Customers default details specify the [Customer Id in the payments request](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-using-tokens_authorization-with-customer-token-id_liveconsole-tab-request-body).<br>To perform a payment with a particular Payment Instrument or Shipping Address <br>specify the [Payment Instrument or Shipping Address Ids in the payments request](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-using-tokens_authorization-with-customer-payment-instrument-and-shipping-address-token-id_liveconsole-tab-request-body). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerApi.new

customer_id = 'customer_id_example' # String | The Id of a Customer.

opts = { 
  profile_id: 'profile_id_example' # String | The Id of a profile containing user specific TMS configuration.
}

begin
  #Retrieve a Customer
  result = api_instance.get_customer(customer_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerApi->get_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_id** | **String**| The Id of a Customer. | 
 **profile_id** | **String**| The Id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**PostCustomerRequest**](PostCustomerRequest.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **patch_customer**
> PatchCustomerRequest patch_customer(customer_id, patch_customer_request, opts)

Update a Customer

|  |  |  | | --- | --- | --- | |**Customers**<br>A Customer represents your tokenized customer information.<br>You should associate the Customer Id with the customer account on your systems.<br>A Customer can have one or more [Payment Instruments](#token-management_customer-payment-instrument_create-a-customer-payment-instrumentl) or [Shipping Addresses](#token-management_customer-shipping-address_create-a-customer-shipping-address) with one allocated as the Customers default.|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Updating a Customer**<br>Your system can use this API to update a Customers details including selecting a  [default Payment Instrument](#token-management_customer_update-a-customer_samplerequests-dropdown_update-customers-default-payment-instrument_liveconsole-tab-request-body) or [default Shipping Address](#token-management_customer_update-a-customer_samplerequests-dropdown_update-customers-default-shipping-address_liveconsole-tab-request-body) for use in payments.<br>Note: Updating a Customers [Payment Instrument](#token-management_customer-payment-instrument_update-a-customer-payment-instrument) or [Shipping Address](#token-management_customer-shipping-address_update-a-customer-shipping-address) details is performed using their own dedicated API resources. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerApi.new

customer_id = 'customer_id_example' # String | The Id of a Customer.

patch_customer_request = CyberSource::PatchCustomerRequest.new # PatchCustomerRequest | 

opts = { 
  profile_id: 'profile_id_example', # String | The Id of a profile containing user specific TMS configuration.
  if_match: 'if_match_example' # String | Contains an ETag value from a GET request to make the request conditional.
}

begin
  #Update a Customer
  result = api_instance.patch_customer(customer_id, patch_customer_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerApi->patch_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_id** | **String**| The Id of a Customer. | 
 **patch_customer_request** | [**PatchCustomerRequest**](PatchCustomerRequest.md)|  | 
 **profile_id** | **String**| The Id of a profile containing user specific TMS configuration. | [optional] 
 **if_match** | **String**| Contains an ETag value from a GET request to make the request conditional. | [optional] 

### Return type

[**PatchCustomerRequest**](PatchCustomerRequest.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_customer**
> PostCustomerRequest post_customer(post_customer_request, opts)

Create a Customer

|  |  |  | | --- | --- | --- | |**Customers**<br>A Customer represents your tokenized customer information.<br>You should associate the Customer Id with the customer account on your systems.<br>A Customer can have one or more [Payment Instruments](#token-management_customer-payment-instrument_create-a-customer-payment-instrumentl) or [Shipping Addresses](#token-management_customer-shipping-address_create-a-customer-shipping-address) with one allocated as the Customers default.<br><br>**Creating a Customer**<br>It is recommended you [create a Customer via a Payment Authorization](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-with-token-create_authorization-with-customer-token-creation_liveconsole-tab-request-body), this can be for a zero amount.<br>The Customer will be created with a Payment Instrument and Shipping Address.<br>You can also [add additional Payment Instruments to a Customer via a Payment Authorization](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-with-token-create_authorization-create-default-payment-instrument-shipping-address-for-existing-customer_liveconsole-tab-request-body).<br>In Europe: You should perform Payer Authentication alongside the Authorization.|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Payment Network Tokens**<br>Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires.<br>A Payment Network Token will be automatically created and used in future payments if you are enabled for the service.<br>A Payment Network Token can also be [provisioned for an existing Instrument Identifier](#token-management_instrument-identifier_enroll-an-instrument-identifier-for-payment-network-token).<br>For more information about Payment Network Tokens see the Developer Guide.<br><br>**Payments with Customers**<br>To perform a payment with the Customers default details specify the [Customer Id in the payments request](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-using-tokens_authorization-with-customer-token-id_liveconsole-tab-request-body).<br>To perform a payment with a particular Payment Instrument or Shipping Address <br>specify the [Payment Instrument or Shipping Address Ids in the payments request](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-using-tokens_authorization-with-customer-payment-instrument-and-shipping-address-token-id_liveconsole-tab-request-body). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerApi.new

post_customer_request = CyberSource::PostCustomerRequest.new # PostCustomerRequest | 

opts = { 
  profile_id: 'profile_id_example' # String | The Id of a profile containing user specific TMS configuration.
}

begin
  #Create a Customer
  result = api_instance.post_customer(post_customer_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerApi->post_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **post_customer_request** | [**PostCustomerRequest**](PostCustomerRequest.md)|  | 
 **profile_id** | **String**| The Id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**PostCustomerRequest**](PostCustomerRequest.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



