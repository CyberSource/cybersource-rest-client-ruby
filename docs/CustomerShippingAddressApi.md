# CyberSource::CustomerShippingAddressApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_customer_shipping_address**](CustomerShippingAddressApi.md#delete_customer_shipping_address) | **DELETE** /tms/v2/customers/{customerTokenId}/shipping-addresses/{shippingAddressTokenId} | Delete a Customer Shipping Address
[**get_customer_shipping_address**](CustomerShippingAddressApi.md#get_customer_shipping_address) | **GET** /tms/v2/customers/{customerTokenId}/shipping-addresses/{shippingAddressTokenId} | Retrieve a Customer Shipping Address
[**get_customer_shipping_addresses_list**](CustomerShippingAddressApi.md#get_customer_shipping_addresses_list) | **GET** /tms/v2/customers/{customerTokenId}/shipping-addresses | List Shipping Addresses for a Customer
[**patch_customers_shipping_address**](CustomerShippingAddressApi.md#patch_customers_shipping_address) | **PATCH** /tms/v2/customers/{customerTokenId}/shipping-addresses/{shippingAddressTokenId} | Update a Customer Shipping Address
[**post_customer_shipping_address**](CustomerShippingAddressApi.md#post_customer_shipping_address) | **POST** /tms/v2/customers/{customerTokenId}/shipping-addresses | Create a Customer Shipping Address


# **delete_customer_shipping_address**
> delete_customer_shipping_address(customer_token_id, shipping_address_token_id, opts)

Delete a Customer Shipping Address

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerShippingAddressApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

shipping_address_token_id = "shipping_address_token_id_example" # String | The TokenId of an shipping address.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Delete a Customer Shipping Address
  api_instance.delete_customer_shipping_address(customer_token_id, shipping_address_token_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerShippingAddressApi->delete_customer_shipping_address: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **shipping_address_token_id** | **String**| The TokenId of an shipping address. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_customer_shipping_address**
> Tmsv2customersEmbeddedDefaultShippingAddress get_customer_shipping_address(customer_token_id, shipping_address_token_id, opts)

Retrieve a Customer Shipping Address

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerShippingAddressApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

shipping_address_token_id = "shipping_address_token_id_example" # String | The TokenId of an shipping address.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Retrieve a Customer Shipping Address
  result = api_instance.get_customer_shipping_address(customer_token_id, shipping_address_token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerShippingAddressApi->get_customer_shipping_address: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **shipping_address_token_id** | **String**| The TokenId of an shipping address. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultShippingAddress**](Tmsv2customersEmbeddedDefaultShippingAddress.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_customer_shipping_addresses_list**
> ShippingAddressListForCustomer get_customer_shipping_addresses_list(customer_token_id, opts)

List Shipping Addresses for a Customer

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerShippingAddressApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

opts = { 
  profile_id: "profile_id_example", # String | The id of a profile containing user specific TMS configuration.
  offset: 0, # Integer | Starting record in zero-based dataset that should be returned as the first object in the array. Default is 0.
  limit: 20 # Integer | The maximum number that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100.
}

begin
  #List Shipping Addresses for a Customer
  result = api_instance.get_customer_shipping_addresses_list(customer_token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerShippingAddressApi->get_customer_shipping_addresses_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 
 **offset** | **Integer**| Starting record in zero-based dataset that should be returned as the first object in the array. Default is 0. | [optional] [default to 0]
 **limit** | **Integer**| The maximum number that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100. | [optional] [default to 20]

### Return type

[**ShippingAddressListForCustomer**](ShippingAddressListForCustomer.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **patch_customers_shipping_address**
> Tmsv2customersEmbeddedDefaultShippingAddress patch_customers_shipping_address(customer_token_id, shipping_address_token_id, patch_customer_shipping_address_request, opts)

Update a Customer Shipping Address

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerShippingAddressApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

shipping_address_token_id = "shipping_address_token_id_example" # String | The TokenId of an shipping address.

patch_customer_shipping_address_request = CyberSource::PatchCustomerShippingAddressRequest.new # PatchCustomerShippingAddressRequest | 

opts = { 
  profile_id: "profile_id_example", # String | The id of a profile containing user specific TMS configuration.
  if_match: "if_match_example" # String | Contains an ETag value from a GET request to make the request conditional.
}

begin
  #Update a Customer Shipping Address
  result = api_instance.patch_customers_shipping_address(customer_token_id, shipping_address_token_id, patch_customer_shipping_address_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerShippingAddressApi->patch_customers_shipping_address: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **shipping_address_token_id** | **String**| The TokenId of an shipping address. | 
 **patch_customer_shipping_address_request** | [**PatchCustomerShippingAddressRequest**](PatchCustomerShippingAddressRequest.md)|  | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 
 **if_match** | **String**| Contains an ETag value from a GET request to make the request conditional. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultShippingAddress**](Tmsv2customersEmbeddedDefaultShippingAddress.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_customer_shipping_address**
> Tmsv2customersEmbeddedDefaultShippingAddress post_customer_shipping_address(customer_token_id, post_customer_shipping_address_request, opts)

Create a Customer Shipping Address

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerShippingAddressApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

post_customer_shipping_address_request = CyberSource::PostCustomerShippingAddressRequest.new # PostCustomerShippingAddressRequest | 

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Create a Customer Shipping Address
  result = api_instance.post_customer_shipping_address(customer_token_id, post_customer_shipping_address_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerShippingAddressApi->post_customer_shipping_address: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **post_customer_shipping_address_request** | [**PostCustomerShippingAddressRequest**](PostCustomerShippingAddressRequest.md)|  | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**Tmsv2customersEmbeddedDefaultShippingAddress**](Tmsv2customersEmbeddedDefaultShippingAddress.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



