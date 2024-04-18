# CyberSource::ManageWebhooksApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_webhook_subscription**](ManageWebhooksApi.md#delete_webhook_subscription) | **DELETE** /notification-subscriptions/v1/webhooks/{webhookId} | Delete a Webhook Subscription
[**get_webhook_subscription_by_id**](ManageWebhooksApi.md#get_webhook_subscription_by_id) | **GET** /notification-subscriptions/v1/webhooks/{webhookId} | Get Details On a Single Webhook
[**get_webhook_subscriptions_by_org**](ManageWebhooksApi.md#get_webhook_subscriptions_by_org) | **GET** /notification-subscriptions/v1/webhooks | Get Details On All Created Webhooks
[**replay_previous_webhooks**](ManageWebhooksApi.md#replay_previous_webhooks) | **POST** /nrtf/v1/webhooks/{webhookId}/replays | Replay Previous Webhooks
[**save_asym_egress_key**](ManageWebhooksApi.md#save_asym_egress_key) | **POST** /kms/egress/v2/keys-asym | Message Level Encryption
[**update_webhook_subscription**](ManageWebhooksApi.md#update_webhook_subscription) | **PATCH** /notification-subscriptions/v1/webhooks/{webhookId} | Update a Webhook Subscription


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
 - **Accept**: application/json;charset=utf-8



# **get_webhook_subscription_by_id**
> InlineResponse2005 get_webhook_subscription_by_id(webhook_id)

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

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_webhook_subscriptions_by_org**
> Array&lt;InlineResponse2004&gt; get_webhook_subscriptions_by_org(organization_id, product_id, event_type)

Get Details On All Created Webhooks

Retrieve a list of all previously created webhooks.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

organization_id = 'organization_id_example' # String | The Organization Identifier.

product_id = 'product_id_example' # String | The Product Identifier.

event_type = 'event_type_example' # String | The Event Type.


begin
  #Get Details On All Created Webhooks
  result = api_instance.get_webhook_subscriptions_by_org(organization_id, product_id, event_type)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->get_webhook_subscriptions_by_org: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | **String**| The Organization Identifier. | 
 **product_id** | **String**| The Product Identifier. | 
 **event_type** | **String**| The Event Type. | 

### Return type

[**Array&lt;InlineResponse2004&gt;**](InlineResponse2004.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **replay_previous_webhooks**
> replay_previous_webhooks(webhook_id, opts)

Replay Previous Webhooks

Initiate a webhook replay request to replay transactions that happened in the past.  Cannot execute more than 1 replay request at a time. While one request is processing, you will not be allowed to execute another replay.  The difference between Start and End time cannot exceed a 24 hour window, and 1 month is the farthest date back that is eligible for replay. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

webhook_id = 'webhook_id_example' # String | The webhook uuid identifier.

opts = { 
  replay_webhooks_request: CyberSource::ReplayWebhooksRequest.new # ReplayWebhooksRequest | The request query
}

begin
  #Replay Previous Webhooks
  api_instance.replay_previous_webhooks(webhook_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->replay_previous_webhooks: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_id** | **String**| The webhook uuid identifier. | 
 **replay_webhooks_request** | [**ReplayWebhooksRequest**](ReplayWebhooksRequest.md)| The request query | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **save_asym_egress_key**
> InlineResponse2014 save_asym_egress_key(v_c_sender_organization_id, v_c_permissions, save_asym_egress_key, opts)

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

[**InlineResponse2014**](InlineResponse2014.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **update_webhook_subscription**
> update_webhook_subscription(webhook_id, opts)

Update a Webhook Subscription

Update the webhook subscription using PATCH.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ManageWebhooksApi.new

webhook_id = 'webhook_id_example' # String | The Webhook Identifier.

opts = { 
  update_webhook_request: CyberSource::UpdateWebhookRequest.new # UpdateWebhookRequest | The webhook payload or changes to apply.
}

begin
  #Update a Webhook Subscription
  api_instance.update_webhook_subscription(webhook_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling ManageWebhooksApi->update_webhook_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_id** | **String**| The Webhook Identifier. | 
 **update_webhook_request** | [**UpdateWebhookRequest**](UpdateWebhookRequest.md)| The webhook payload or changes to apply. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



