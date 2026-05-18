# CyberSource::SubscriptionsFollowOnsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_follow_on_subscription**](SubscriptionsFollowOnsApi.md#create_follow_on_subscription) | **POST** /rbs/v1/subscriptions/follow-ons/{requestId} | Create a Follow-On Subscription
[**get_follow_on_subscription**](SubscriptionsFollowOnsApi.md#get_follow_on_subscription) | **GET** /rbs/v1/subscriptions/follow-ons/{requestId} | Get a Follow-On Subscription


# **create_follow_on_subscription**
> CreateSubscriptionResponse create_follow_on_subscription(request_id, create_subscription_request)

Create a Follow-On Subscription

Create a new Subscription based on the Request Id of an existing successful Transaction.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsFollowOnsApi.new

request_id = 'request_id_example' # String | Request Id of an existing successful Transaction

create_subscription_request = CyberSource::CreateSubscriptionRequest1.new # CreateSubscriptionRequest1 | 


begin
  #Create a Follow-On Subscription
  result = api_instance.create_follow_on_subscription(request_id, create_subscription_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsFollowOnsApi->create_follow_on_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request_id** | **String**| Request Id of an existing successful Transaction | 
 **create_subscription_request** | [**CreateSubscriptionRequest1**](CreateSubscriptionRequest1.md)|  | 

### Return type

[**CreateSubscriptionResponse**](CreateSubscriptionResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_follow_on_subscription**
> GetSubscriptionResponse1 get_follow_on_subscription(request_id)

Get a Follow-On Subscription

Get details of the Subscription being created based on the Request Id of an existing successful Transaction. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsFollowOnsApi.new

request_id = 'request_id_example' # String | Request Id of an existing successful Transaction


begin
  #Get a Follow-On Subscription
  result = api_instance.get_follow_on_subscription(request_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsFollowOnsApi->get_follow_on_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **request_id** | **String**| Request Id of an existing successful Transaction | 

### Return type

[**GetSubscriptionResponse1**](GetSubscriptionResponse1.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



