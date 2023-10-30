# CyberSource::CreateNewWebhooksApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**notification_subscriptions_v1_products_organization_id_get**](CreateNewWebhooksApi.md#notification_subscriptions_v1_products_organization_id_get) | **GET** /notification-subscriptions/v1/products/{organizationId} | Find Products You Can Subscribe To
[**notification_subscriptions_v1_webhooks_post**](CreateNewWebhooksApi.md#notification_subscriptions_v1_webhooks_post) | **POST** /notification-subscriptions/v1/webhooks | Create a Webhook
[**save_sym_egress_key**](CreateNewWebhooksApi.md#save_sym_egress_key) | **POST** /kms/egress/v2/keys-sym | Create Webhook Security Keys


# **notification_subscriptions_v1_products_organization_id_get**
> Array&lt;InlineResponse2003&gt; notification_subscriptions_v1_products_organization_id_get(organization_id)

Find Products You Can Subscribe To

Retrieve a list of products and event types that your account is eligible for. These products and events are the ones that you may subscribe to in the next step of creating webhooks.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CreateNewWebhooksApi.new

organization_id = "organization_id_example" # String | The Organization Identifier.


begin
  #Find Products You Can Subscribe To
  result = api_instance.notification_subscriptions_v1_products_organization_id_get(organization_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CreateNewWebhooksApi->notification_subscriptions_v1_products_organization_id_get: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | **String**| The Organization Identifier. | 

### Return type

[**Array&lt;InlineResponse2003&gt;**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **notification_subscriptions_v1_webhooks_post**
> InlineResponse2013 notification_subscriptions_v1_webhooks_post(opts)

Create a Webhook

Create a new webhook subscription. Before creating a webhook, ensure that a security key has been created at the top of this developer center section. You will not need to pass us back the key during the creation of the webhook, but you will receive an error if you did not already create a key or store one on file. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CreateNewWebhooksApi.new

opts = { 
  create_webhook: CyberSource::CreateWebhook.new # CreateWebhook | The webhook payload
}

begin
  #Create a Webhook
  result = api_instance.notification_subscriptions_v1_webhooks_post(opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CreateNewWebhooksApi->notification_subscriptions_v1_webhooks_post: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_webhook** | [**CreateWebhook**](CreateWebhook.md)| The webhook payload | [optional] 

### Return type

[**InlineResponse2013**](InlineResponse2013.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **save_sym_egress_key**
> InlineResponse2012 save_sym_egress_key(v_c_sender_organization_id, v_c_permissions, opts)

Create Webhook Security Keys

Create security keys that CyberSource will use internally to connect to your servers and validate messages using a digital signature.  Select the CREATE example for CyberSource to generate the key on our server and maintain it for you as well. Remeber to save the key in the API response, so that you can use it to validate messages later. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CreateNewWebhooksApi.new

v_c_sender_organization_id = "v_c_sender_organization_id_example" # String | Sender organization id

v_c_permissions = "v_c_permissions_example" # String | Encoded user permissions returned by the CGK, for the entity user who initiated the boarding

opts = { 
  v_c_correlation_id: "v_c_correlation_id_example", # String | A globally unique id associated with your request
  save_sym_egress_key: CyberSource::SaveSymEgressKey.new # SaveSymEgressKey | Provide egress Symmetric key information to save (create or store or refresh)
}

begin
  #Create Webhook Security Keys
  result = api_instance.save_sym_egress_key(v_c_sender_organization_id, v_c_permissions, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CreateNewWebhooksApi->save_sym_egress_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v_c_sender_organization_id** | **String**| Sender organization id | 
 **v_c_permissions** | **String**| Encoded user permissions returned by the CGK, for the entity user who initiated the boarding | 
 **v_c_correlation_id** | **String**| A globally unique id associated with your request | [optional] 
 **save_sym_egress_key** | [**SaveSymEgressKey**](SaveSymEgressKey.md)| Provide egress Symmetric key information to save (create or store or refresh) | [optional] 

### Return type

[**InlineResponse2012**](InlineResponse2012.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



