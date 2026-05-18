# CyberSource::SubscriptionsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activate_subscription**](SubscriptionsApi.md#activate_subscription) | **POST** /rbs/v1/subscriptions/{id}/activate | Reactivating a Suspended Subscription
[**cancel_subscription**](SubscriptionsApi.md#cancel_subscription) | **POST** /rbs/v1/subscriptions/{id}/cancel | Cancel a Subscription
[**create_subscription**](SubscriptionsApi.md#create_subscription) | **POST** /rbs/v1/subscriptions | Create a Subscription
[**get_all_subscriptions**](SubscriptionsApi.md#get_all_subscriptions) | **GET** /rbs/v1/subscriptions | Get a List of Subscriptions
[**get_subscription**](SubscriptionsApi.md#get_subscription) | **GET** /rbs/v1/subscriptions/{id} | Get a Subscription
[**get_subscription_code**](SubscriptionsApi.md#get_subscription_code) | **GET** /rbs/v1/subscriptions/code | Get a Subscription Code
[**subscriptions_id_payments_get**](SubscriptionsApi.md#subscriptions_id_payments_get) | **GET** /rbs/v1/subscriptions/{id}/payments | Get Payments for a Subscription
[**subscriptions_id_payments_put**](SubscriptionsApi.md#subscriptions_id_payments_put) | **PUT** /rbs/v1/subscriptions/{id}/payments | Update Payments for a subscription
[**suspend_subscription**](SubscriptionsApi.md#suspend_subscription) | **POST** /rbs/v1/subscriptions/{id}/suspend | Suspend a Subscription
[**update_subscription**](SubscriptionsApi.md#update_subscription) | **PATCH** /rbs/v1/subscriptions/{id} | Update a Subscription


# **activate_subscription**
> ActivateSubscriptionResponse activate_subscription(id, opts)

Reactivating a Suspended Subscription

# Reactivating a Suspended Subscription  You can reactivate a suspended subscription for the next billing cycle. You cannot reactivate a canceled or completed subscription.  You can specify whether you want to process missed payments for the period during which the subscription was suspended using the `processMissedPayments` query parameter by setting it to true or false.  If no value is specified, the system will default to `true`.  **Important:** The \"processMissedPayments\" query parameter is only effective when the Ask each time before reactivating option is selected in the reactivation settings. If any other option is chosen, the value provided in the request will be ignored by the system. For more information, see the [Recurring Billing User Guide](https://developer.cybersource.com/docs/cybs/en-us/recurring-billing/user/all/rest/recurring-billing-user/recurring-billing-user-about-guide.html).  You can check how many payments were missed and the total amount by retrieving the subscription details, where you will find the `reactivationInformation` object. See: [Retrieving a Subscription](https://developer.cybersource.com/docs/cybs/en-us/recurring-billing/developer/all/rest/recurring-billing-dev/recur-bill-subscriptions/recur-bill-getting-a-subscription.html). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

id = 'id_example' # String | Subscription Id

opts = { 
  process_missed_payments: true # BOOLEAN | Indicates if missed payments should be processed from the period when the subscription was suspended. By default, this is set to true. When any option other than \"Ask each time before reactivating\" is selected in the reactivation settings, the value that you enter will be ignored. 
}

begin
  #Reactivating a Suspended Subscription
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
 **process_missed_payments** | **BOOLEAN**| Indicates if missed payments should be processed from the period when the subscription was suspended. By default, this is set to true. When any option other than \&quot;Ask each time before reactivating\&quot; is selected in the reactivation settings, the value that you enter will be ignored.  | [optional] [default to true]

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
  status: 'status_example', # String | Filter by Subscription Status
  customer_id: 'customer_id_example', # String | Filter by Customer Id
  client_reference_information_code: 'client_reference_information_code_example' # String | Filter by Client Reference Information Code / Merchant Reference Number
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
 **customer_id** | **String**| Filter by Customer Id | [optional] 
 **client_reference_information_code** | **String**| Filter by Client Reference Information Code / Merchant Reference Number | [optional] 

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



# **subscriptions_id_payments_get**
> GetSubscriptionsPaymentsResponse subscriptions_id_payments_get(id, opts)

Get Payments for a Subscription

Retrieve a list of payments for a specific subscription by its ID. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

id = 'id_example' # String | Subscription Id

opts = { 
  offset: 56, # Integer | Page offset number.
  limit: 56, # Integer | Number of items to be returned. Default - `20`, Max - `100` 
  scheduled_payments_count: 56 # Integer | Number of existing scheduled payments to be returned. Default - `5`, Max - `9999` 
}

begin
  #Get Payments for a Subscription
  result = api_instance.subscriptions_id_payments_get(id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->subscriptions_id_payments_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Subscription Id | 
 **offset** | **Integer**| Page offset number. | [optional] 
 **limit** | **Integer**| Number of items to be returned. Default - &#x60;20&#x60;, Max - &#x60;100&#x60;  | [optional] 
 **scheduled_payments_count** | **Integer**| Number of existing scheduled payments to be returned. Default - &#x60;5&#x60;, Max - &#x60;9999&#x60;  | [optional] 

### Return type

[**GetSubscriptionsPaymentsResponse**](GetSubscriptionsPaymentsResponse.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **subscriptions_id_payments_put**
> GetSubscriptionsPaymentsResponse1 subscriptions_id_payments_put(id, update_payments)

Update Payments for a subscription

Modifies the state of a subscription's payments. Currently, the only possible modifications are \"skipping\" and \"restoring\" payments.  Marking a payment as \"skipped\" means it will not be processed when its scheduled time arrives. \"Restoring\" a payment removes it from the list of payments to be skipped. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SubscriptionsApi.new

id = 'id_example' # String | Subscription Id

update_payments = CyberSource::UpdatePayments.new # UpdatePayments | Modify payments of a subscription


begin
  #Update Payments for a subscription
  result = api_instance.subscriptions_id_payments_put(id, update_payments)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SubscriptionsApi->subscriptions_id_payments_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Subscription Id | 
 **update_payments** | [**UpdatePayments**](UpdatePayments.md)| Modify payments of a subscription | 

### Return type

[**GetSubscriptionsPaymentsResponse1**](GetSubscriptionsPaymentsResponse1.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



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



