# CyberSource::OrdersApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_order**](OrdersApi.md#create_order) | **POST** /pts/v2/intents | Create an Order
[**update_order**](OrdersApi.md#update_order) | **PATCH** /pts/v2/intents/{id} | Update an Order


# **create_order**
> PtsV2CreateOrderPost201Response create_order(create_order_request)

Create an Order

A create order request enables you to send the itemized details along with the order. This API can be used by merchants initiating their transactions with the create order API.  

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::OrdersApi.new

create_order_request = CyberSource::CreateOrderRequest.new # CreateOrderRequest | 


begin
  #Create an Order
  result = api_instance.create_order(create_order_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling OrdersApi->create_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_order_request** | [**CreateOrderRequest**](CreateOrderRequest.md)|  | 

### Return type

[**PtsV2CreateOrderPost201Response**](PtsV2CreateOrderPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_order**
> PtsV2UpdateOrderPatch201Response update_order(id, update_order_request)

Update an Order

This API can be used in two flavours - for updating the order as well as saving the order. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::OrdersApi.new

id = 'id_example' # String | The ID returned from the original create order response.

update_order_request = CyberSource::UpdateOrderRequest.new # UpdateOrderRequest | 


begin
  #Update an Order
  result = api_instance.update_order(id, update_order_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling OrdersApi->update_order: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID returned from the original create order response. | 
 **update_order_request** | [**UpdateOrderRequest**](UpdateOrderRequest.md)|  | 

### Return type

[**PtsV2UpdateOrderPatch201Response**](PtsV2UpdateOrderPatch201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



