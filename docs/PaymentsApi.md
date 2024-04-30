# CyberSource::PaymentsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_order_request**](PaymentsApi.md#create_order_request) | **POST** /pts/v2/payment-references/{id}/intents | Create a Payment Order Request
[**create_payment**](PaymentsApi.md#create_payment) | **POST** /pts/v2/payments | Process a Payment
[**create_session_request**](PaymentsApi.md#create_session_request) | **POST** /pts/v2/payment-references | Create Alternative Payments Sessions Request
[**increment_auth**](PaymentsApi.md#increment_auth) | **PATCH** /pts/v2/payments/{id} | Increment an Authorization
[**refresh_payment_status**](PaymentsApi.md#refresh_payment_status) | **POST** /pts/v2/refresh-payment-status/{id} | Check a Payment Status
[**update_session_req**](PaymentsApi.md#update_session_req) | **PATCH** /pts/v2/payment-references/{id} | Update Alternative Payments Sessions Request


# **create_order_request**
> PtsV2PaymentsOrderPost201Response create_order_request(order_payment_request, id)

Create a Payment Order Request

Create a Payment Order Request

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentsApi.new

order_payment_request = CyberSource::OrderPaymentRequest.new # OrderPaymentRequest | 

id = 'id_example' # String | Request identifier number for the order request. 


begin
  #Create a Payment Order Request
  result = api_instance.create_order_request(order_payment_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentsApi->create_order_request: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **order_payment_request** | [**OrderPaymentRequest**](OrderPaymentRequest.md)|  | 
 **id** | **String**| Request identifier number for the order request.  | 

### Return type

[**PtsV2PaymentsOrderPost201Response**](PtsV2PaymentsOrderPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **create_payment**
> PtsV2PaymentsPost201Response create_payment(create_payment_request)

Process a Payment

A payment authorizes the amount for the transaction. There are a number of supported payment features, such as E-commerce and Card Present - Credit Card/Debit Card, Echeck, e-Wallets, Level II/III Data, etc..  A payment response includes the status of the request. It also includes processor-specific information when the request is successful and errors if unsuccessful. See the [Payments Developer Guides Page](https://developer.cybersource.com/docs/cybs/en-us/payments/developer/ctv/rest/payments/payments-intro.html).  Authorization can be requested with Capture, Decision Manager, Payer Authentication(3ds), and Token Creation. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentsApi.new

create_payment_request = CyberSource::CreatePaymentRequest.new # CreatePaymentRequest | 


begin
  #Process a Payment
  result = api_instance.create_payment(create_payment_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentsApi->create_payment: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_payment_request** | [**CreatePaymentRequest**](CreatePaymentRequest.md)|  | 

### Return type

[**PtsV2PaymentsPost201Response**](PtsV2PaymentsPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **create_session_request**
> PtsV2PaymentsPost201Response2 create_session_request(create_session_req)

Create Alternative Payments Sessions Request

Create Alternative Payments Sessions Request

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentsApi.new

create_session_req = CyberSource::CreateSessionReq.new # CreateSessionReq | 


begin
  #Create Alternative Payments Sessions Request
  result = api_instance.create_session_request(create_session_req)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentsApi->create_session_request: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_session_req** | [**CreateSessionReq**](CreateSessionReq.md)|  | 

### Return type

[**PtsV2PaymentsPost201Response2**](PtsV2PaymentsPost201Response2.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **increment_auth**
> PtsV2IncrementalAuthorizationPatch201Response increment_auth(id, increment_auth_request)

Increment an Authorization

Use this service to authorize additional charges in a lodging or autorental transaction. Include the ID returned from the original authorization in the PATCH request to add additional charges to that authorization. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentsApi.new

id = 'id_example' # String | The ID returned from the original authorization request.

increment_auth_request = CyberSource::IncrementAuthRequest.new # IncrementAuthRequest | 


begin
  #Increment an Authorization
  result = api_instance.increment_auth(id, increment_auth_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentsApi->increment_auth: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The ID returned from the original authorization request. | 
 **increment_auth_request** | [**IncrementAuthRequest**](IncrementAuthRequest.md)|  | 

### Return type

[**PtsV2IncrementalAuthorizationPatch201Response**](PtsV2IncrementalAuthorizationPatch201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **refresh_payment_status**
> PtsV2PaymentsPost201Response1 refresh_payment_status(id, refresh_payment_status_request)

Check a Payment Status

Checks and updates the payment status 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentsApi.new

id = 'id_example' # String | The payment id whose status needs to be checked and updated.

refresh_payment_status_request = CyberSource::RefreshPaymentStatusRequest.new # RefreshPaymentStatusRequest | 


begin
  #Check a Payment Status
  result = api_instance.refresh_payment_status(id, refresh_payment_status_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentsApi->refresh_payment_status: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The payment id whose status needs to be checked and updated. | 
 **refresh_payment_status_request** | [**RefreshPaymentStatusRequest**](RefreshPaymentStatusRequest.md)|  | 

### Return type

[**PtsV2PaymentsPost201Response1**](PtsV2PaymentsPost201Response1.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_session_req**
> PtsV2PaymentsPost201Response2 update_session_req(create_session_request, id)

Update Alternative Payments Sessions Request

Update Alternative Payments Sessions Request

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentsApi.new

create_session_request = CyberSource::CreateSessionRequest.new # CreateSessionRequest | 

id = 'id_example' # String | The payment ID. This ID is returned from a previous payment request.


begin
  #Update Alternative Payments Sessions Request
  result = api_instance.update_session_req(create_session_request, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentsApi->update_session_req: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_session_request** | [**CreateSessionRequest**](CreateSessionRequest.md)|  | 
 **id** | **String**| The payment ID. This ID is returned from a previous payment request. | 

### Return type

[**PtsV2PaymentsPost201Response2**](PtsV2PaymentsPost201Response2.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



