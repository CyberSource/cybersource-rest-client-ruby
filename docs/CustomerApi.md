# CyberSource::CustomerApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_customer**](CustomerApi.md#delete_customer) | **DELETE** /tms/v2/customers/{customerTokenId} | Delete a Customer
[**get_customer**](CustomerApi.md#get_customer) | **GET** /tms/v2/customers/{customerTokenId} | Retrieve a Customer
[**patch_customer**](CustomerApi.md#patch_customer) | **PATCH** /tms/v2/customers/{customerTokenId} | Update a Customer
[**post_customer**](CustomerApi.md#post_customer) | **POST** /tms/v2/customers | Create a Customer


# **delete_customer**
> delete_customer(customer_token_id, opts)

Delete a Customer

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Delete a Customer
  api_instance.delete_customer(customer_token_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerApi->delete_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_customer**
> TmsV2CustomersResponse get_customer(customer_token_id, opts)

Retrieve a Customer

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
}

begin
  #Retrieve a Customer
  result = api_instance.get_customer(customer_token_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerApi->get_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**TmsV2CustomersResponse**](TmsV2CustomersResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **patch_customer**
> TmsV2CustomersResponse patch_customer(customer_token_id, patch_customer_request, opts)

Update a Customer

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerApi.new

customer_token_id = "customer_token_id_example" # String | The TokenId of a customer.

patch_customer_request = CyberSource::PatchCustomerRequest.new # PatchCustomerRequest | 

opts = { 
  profile_id: "profile_id_example", # String | The id of a profile containing user specific TMS configuration.
  if_match: "if_match_example" # String | Contains an ETag value from a GET request to make the request conditional.
}

begin
  #Update a Customer
  result = api_instance.patch_customer(customer_token_id, patch_customer_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CustomerApi->patch_customer: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **customer_token_id** | **String**| The TokenId of a customer. | 
 **patch_customer_request** | [**PatchCustomerRequest**](PatchCustomerRequest.md)|  | 
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 
 **if_match** | **String**| Contains an ETag value from a GET request to make the request conditional. | [optional] 

### Return type

[**TmsV2CustomersResponse**](TmsV2CustomersResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_customer**
> TmsV2CustomersResponse post_customer(post_customer_request, opts)

Create a Customer

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CustomerApi.new

post_customer_request = CyberSource::PostCustomerRequest.new # PostCustomerRequest | 

opts = { 
  profile_id: "profile_id_example" # String | The id of a profile containing user specific TMS configuration.
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
 **profile_id** | **String**| The id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**TmsV2CustomersResponse**](TmsV2CustomersResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



