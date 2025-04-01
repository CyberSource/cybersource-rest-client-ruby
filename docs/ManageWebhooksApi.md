# CyberSource::ManageWebhooksApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**notification_subscriptions_v1_webhooks_webhook_id_post**](ManageWebhooksApi.md#notification_subscriptions_v1_webhooks_webhook_id_post) | **POST** /notification-subscriptions/v1/webhooks/{webhookId} | Test a Webhook Configuration
[**save_asym_egress_key**](ManageWebhooksApi.md#save_asym_egress_key) | **POST** /kms/egress/v2/keys-asym | Message Level Encryption


# **notification_subscriptions_v1_webhooks_webhook_id_post**
> InlineResponse2014 notification_subscriptions_v1_webhooks_webhook_id_post(webhook_id)

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

[**InlineResponse2014**](InlineResponse2014.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **save_asym_egress_key**
> InlineResponse2015 save_asym_egress_key(v_c_sender_organization_id, v_c_permissions, save_asym_egress_key, opts)

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

[**InlineResponse2015**](InlineResponse2015.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



