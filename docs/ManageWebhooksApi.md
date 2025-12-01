# CyberSource::ManageWebhooksApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_webhook_subscription**](ManageWebhooksApi.md#delete_webhook_subscription) | **DELETE** /notification-subscriptions/v2/webhooks/{webhookId} | Delete a Webhook Subscription
[**get_webhook_subscription_by_id**](ManageWebhooksApi.md#get_webhook_subscription_by_id) | **GET** /notification-subscriptions/v2/webhooks/{webhookId} | Get Details On a Single Webhook
[**get_webhook_subscriptions_by_org**](ManageWebhooksApi.md#get_webhook_subscriptions_by_org) | **GET** /notification-subscriptions/v2/webhooks | Get Details On All Created Webhooks
[**notification_subscriptions_v1_webhooks_webhook_id_post**](ManageWebhooksApi.md#notification_subscriptions_v1_webhooks_webhook_id_post) | **POST** /notification-subscriptions/v1/webhooks/{webhookId} | Test a Webhook Configuration
[**notification_subscriptions_v2_webhooks_webhook_id_patch**](ManageWebhooksApi.md#notification_subscriptions_v2_webhooks_webhook_id_patch) | **PATCH** /notification-subscriptions/v2/webhooks/{webhookId} | Update a Webhook Subscription
[**notification_subscriptions_v2_webhooks_webhook_id_status_put**](ManageWebhooksApi.md#notification_subscriptions_v2_webhooks_webhook_id_status_put) | **PUT** /notification-subscriptions/v2/webhooks/{webhookId}/status | Update a Webhook Status
[**save_asym_egress_key**](ManageWebhooksApi.md#save_asym_egress_key) | **POST** /kms/egress/v2/keys-asym | Message Level Encryption


# **delete_webhook_subscription**
> delete_webhook_subscription(webhook_id)

Delete a Webhook Subscription

Delete the webhook. Please note that deleting a particular webhook does not delete the history of the webhook notifications.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

webhook_id = 'webhook_id_example' # String | The webhook identifier.


begin
  #Delete a Webhook Subscription
  api_instance.delete_webhook_subscription(webhook_id)
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->delete_webhook_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_id** | **String**| The webhook identifier. | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_webhook_subscription_by_id**
> InlineResponse2015 get_webhook_subscription_by_id(webhook_id)

Get Details On a Single Webhook

Retrieve the details of a specific webhook by supplying the webhook ID in the path.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

webhook_id = 'webhook_id_example' # String | The webhook Identifier


begin
  #Get Details On a Single Webhook
  result = api_instance.get_webhook_subscription_by_id(webhook_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->get_webhook_subscription_by_id: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_id** | **String**| The webhook Identifier | 

### Return type

[**InlineResponse2015**](InlineResponse2015.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_webhook_subscriptions_by_org**
> Array&lt;InlineResponse2006&gt; get_webhook_subscriptions_by_org(organization_id, opts)

Get Details On All Created Webhooks

Retrieve a list of all previously created webhooks.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

organization_id = 'organization_id_example' # String | The Organization Identifier.

opts = { 
  product_id: 'product_id_example', # String | The Product Identifier.
  event_type: 'event_type_example' # String | The Event Type.
}

begin
  #Get Details On All Created Webhooks
  result = api_instance.get_webhook_subscriptions_by_org(organization_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->get_webhook_subscriptions_by_org: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | **String**| The Organization Identifier. | 
 **product_id** | **String**| The Product Identifier. | [optional] 
 **event_type** | **String**| The Event Type. | [optional] 

### Return type

[**Array&lt;InlineResponse2006&gt;**](InlineResponse2006.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **notification_subscriptions_v1_webhooks_webhook_id_post**
> InlineResponse2016 notification_subscriptions_v1_webhooks_webhook_id_post(webhook_id)

Test a Webhook Configuration

Test the webhook configuration by sending a sample webhook. Calling this endpoint sends a sample webhook to the endpoint identified in the user's subscription.   It will contain sample values for the product & eventType based on values present in your subscription along with a sample message in the payload.   Based on the webhook response users can make any necessary modifications or rest assured knowing their setup is configured correctly. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

webhook_id = 'webhook_id_example' # String | The Webhook Identifier.


begin
  #Test a Webhook Configuration
  result = api_instance.notification_subscriptions_v1_webhooks_webhook_id_post(webhook_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->notification_subscriptions_v1_webhooks_webhook_id_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_id** | **String**| The Webhook Identifier. | 

### Return type

[**InlineResponse2016**](InlineResponse2016.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **notification_subscriptions_v2_webhooks_webhook_id_patch**
> InlineResponse2007 notification_subscriptions_v2_webhooks_webhook_id_patch(webhook_id, opts)

Update a Webhook Subscription

Update a Webhook Subscription.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

webhook_id = 'webhook_id_example' # String | The Webhook Identifier.

opts = { 
  update_webhook: CyberSource::UpdateWebhook.new # UpdateWebhook | The webhook payload or changes to apply.
}

begin
  #Update a Webhook Subscription
  result = api_instance.notification_subscriptions_v2_webhooks_webhook_id_patch(webhook_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->notification_subscriptions_v2_webhooks_webhook_id_patch: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_id** | **String**| The Webhook Identifier. | 
 **update_webhook** | [**UpdateWebhook**](UpdateWebhook.md)| The webhook payload or changes to apply. | [optional] 

### Return type

[**InlineResponse2007**](InlineResponse2007.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **notification_subscriptions_v2_webhooks_webhook_id_status_put**
> notification_subscriptions_v2_webhooks_webhook_id_status_put(webhook_id, opts)

Update a Webhook Status

Users can update the status of a webhook subscription by calling this endpoint.   The webhookId parameter in the URL path identifies the specific webhook subscription to be updated. The request body accepts the values ACTIVE or INACTIVE. If the subscription is set to INACTIVE, webhooks will not be delivered until the subscription is activated again. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

webhook_id = 'webhook_id_example' # String | The Webhook Identifier.

opts = { 
  update_status: CyberSource::UpdateStatus.new # UpdateStatus | The status that the subscription should be updated to.
}

begin
  #Update a Webhook Status
  api_instance.notification_subscriptions_v2_webhooks_webhook_id_status_put(webhook_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->notification_subscriptions_v2_webhooks_webhook_id_status_put: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_id** | **String**| The Webhook Identifier. | 
 **update_status** | [**UpdateStatus**](UpdateStatus.md)| The status that the subscription should be updated to. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **save_asym_egress_key**
> InlineResponse2017 save_asym_egress_key(v_c_sender_organization_id, v_c_permissions, save_asym_egress_key, opts)

Message Level Encryption

Store and manage certificates that will be used to preform Message Level Encryption (MLE). Each new webhook will need its own unique asymmetric certificate. You can either use a digital certificate issued/signed by a CA or self-sign your own using the documentation available on the Developer Guide. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

v_c_sender_organization_id = 'v_c_sender_organization_id_example' # String | Sender organization id

v_c_permissions = 'v_c_permissions_example' # String | Encoded user permissions returned by the CGK, for the entity user who initiated the boarding

save_asym_egress_key = CyberSource::SaveAsymEgressKey.new # SaveAsymEgressKey | Provide egress Asymmetric key information to save (create or store)

opts = { 
  v_c_correlation_id: 'v_c_correlation_id_example' # String | A globally unique id associated with your request
}

begin
  #Message Level Encryption
  result = api_instance.save_asym_egress_key(v_c_sender_organization_id, v_c_permissions, save_asym_egress_key, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->save_asym_egress_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v_c_sender_organization_id** | **String**| Sender organization id | 
 **v_c_permissions** | **String**| Encoded user permissions returned by the CGK, for the entity user who initiated the boarding | 
 **save_asym_egress_key** | [**SaveAsymEgressKey**](SaveAsymEgressKey.md)| Provide egress Asymmetric key information to save (create or store) | 
 **v_c_correlation_id** | **String**| A globally unique id associated with your request | [optional] 

### Return type

[**InlineResponse2017**](InlineResponse2017.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



