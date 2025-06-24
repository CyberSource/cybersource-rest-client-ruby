# CyberSource::SubscriptionsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activate_subscription**](SubscriptionsApi.md#activate_subscription) | **POST** /rbs/v1/subscriptions/{id}/activate | Activate a Subscription
[**cancel_subscription**](SubscriptionsApi.md#cancel_subscription) | **POST** /rbs/v1/subscriptions/{id}/cancel | Cancel a Subscription
[**create_subscription**](SubscriptionsApi.md#create_subscription) | **POST** /rbs/v1/subscriptions | Create a Subscription
[**get_all_subscriptions**](SubscriptionsApi.md#get_all_subscriptions) | **GET** /rbs/v1/subscriptions | Get a List of Subscriptions
[**get_subscription**](SubscriptionsApi.md#get_subscription) | **GET** /rbs/v1/subscriptions/{id} | Get a Subscription
[**get_subscription_code**](SubscriptionsApi.md#get_subscription_code) | **GET** /rbs/v1/subscriptions/code | Get a Subscription Code
[**suspend_subscription**](SubscriptionsApi.md#suspend_subscription) | **POST** /rbs/v1/subscriptions/{id}/suspend | Suspend a Subscription
[**update_subscription**](SubscriptionsApi.md#update_subscription) | **PATCH** /rbs/v1/subscriptions/{id} | Update a Subscription


# **activate_subscription**
> ActivateSubscriptionResponse activate_subscription(id, opts)

Activate a Subscription

Activate a `SUSPENDED` Subscription 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

id = 'id_example' # String | Subscription Id

opts = { 
  process_skipped_payments: true # BOOLEAN | Indicates if skipped payments should be processed from the period when the subscription was suspended. By default, this is set to true.
}

begin
  #Activate a Subscription
  result = api_instance.activate_subscription(id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->activate_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Subscription Id | 
 **process_skipped_payments** | **BOOLEAN**| Indicates if skipped payments should be processed from the period when the subscription was suspended. By default, this is set to true. | [optional] [default to true]

### Return type

[**ActivateSubscriptionResponse**](ActivateSubscriptionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **cancel_subscription**
> CancelSubscriptionResponse cancel_subscription(id)

Cancel a Subscription

Cancel a Subscription

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

id = 'id_example' # String | Subscription Id


begin
  #Cancel a Subscription
  result = api_instance.cancel_subscription(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->cancel_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Subscription Id | 

### Return type

[**CancelSubscriptionResponse**](CancelSubscriptionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **create_subscription**
> CreateSubscriptionResponse create_subscription(create_subscription_request)

Create a Subscription

Create a Recurring Billing Subscription

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

create_subscription_request = CyberSource::CreateSubscriptionRequest.new # CreateSubscriptionRequest | 


begin
  #Create a Subscription
  result = api_instance.create_subscription(create_subscription_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->create_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_subscription_request** | [**CreateSubscriptionRequest**](CreateSubscriptionRequest.md)|  | 

### Return type

[**CreateSubscriptionResponse**](CreateSubscriptionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_all_subscriptions**
> GetAllSubscriptionsResponse get_all_subscriptions(opts)

Get a List of Subscriptions

Retrieve Subscriptions by Subscription Code & Subscription Status. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

opts = { 
  offset: 56, # Integer | Page offset number.
  limit: 56, # Integer | Number of items to be returned. Default - `20`, Max - `100` 
  code: 'code_example', # String | Filter by Subscription Code
  status: 'status_example' # String | Filter by Subscription Status
}

begin
  #Get a List of Subscriptions
  result = api_instance.get_all_subscriptions(opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->get_all_subscriptions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **Integer**| Page offset number. | [optional] 
 **limit** | **Integer**| Number of items to be returned. Default - &#x60;20&#x60;, Max - &#x60;100&#x60;  | [optional] 
 **code** | **String**| Filter by Subscription Code | [optional] 
 **status** | **String**| Filter by Subscription Status | [optional] 

### Return type

[**GetAllSubscriptionsResponse**](GetAllSubscriptionsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_subscription**
> GetSubscriptionResponse get_subscription(id)

Get a Subscription

Get a Subscription by Subscription Id

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

id = 'id_example' # String | Subscription Id


begin
  #Get a Subscription
  result = api_instance.get_subscription(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->get_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Subscription Id | 

### Return type

[**GetSubscriptionResponse**](GetSubscriptionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_subscription_code**
> GetSubscriptionCodeResponse get_subscription_code

Get a Subscription Code

Get a Unique Subscription Code

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

begin
  #Get a Subscription Code
  result = api_instance.get_subscription_code
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->get_subscription_code: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetSubscriptionCodeResponse**](GetSubscriptionCodeResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **suspend_subscription**
> SuspendSubscriptionResponse suspend_subscription(id)

Suspend a Subscription

Suspend a Subscription

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

id = 'id_example' # String | Subscription Id


begin
  #Suspend a Subscription
  result = api_instance.suspend_subscription(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->suspend_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Subscription Id | 

### Return type

[**SuspendSubscriptionResponse**](SuspendSubscriptionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **update_subscription**
> UpdateSubscriptionResponse update_subscription(id, update_subscription)

Update a Subscription

Update a Subscription by Subscription Id

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

id = 'id_example' # String | Subscription Id

update_subscription = CyberSource::UpdateSubscription.new # UpdateSubscription | Update Subscription


begin
  #Update a Subscription
  result = api_instance.update_subscription(id, update_subscription)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->update_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Subscription Id | 
 **update_subscription** | [**UpdateSubscription**](UpdateSubscription.md)| Update Subscription | 

### Return type

[**UpdateSubscriptionResponse**](UpdateSubscriptionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



