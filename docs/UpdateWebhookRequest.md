# CyberSource::UpdateWebhookRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Client friendly webhook name. | [optional] 
**description** | **String** | Client friendly webhook description.\\ | [optional] 
**organization_id** | **String** | Organization Id. | [optional] 
**product_id** | **String** | The product you are receiving a webhook for. | [optional] 
**event_types** | **Array&lt;String&gt;** | Array of the different events for a given product id. | [optional] 
**webhook_url** | **String** | The client&#39;s endpoint (URL) to receive webhooks. | [optional] 
**health_check_url** | **String** | The client&#39;s health check endpoint (URL). This should be as close as possible to the actual webhookUrl. | [optional] 
**status** | **String** | Webhook status. | [optional] [default to &#39;INACTIVE&#39;]
**notification_scope** | [**Notificationsubscriptionsv1webhooksNotificationScope**](Notificationsubscriptionsv1webhooksNotificationScope.md) |  | [optional] 
**retry_policy** | [**Notificationsubscriptionsv1webhooksRetryPolicy**](Notificationsubscriptionsv1webhooksRetryPolicy.md) |  | [optional] 
**security_policy** | [**Notificationsubscriptionsv1webhooksSecurityPolicy**](Notificationsubscriptionsv1webhooksSecurityPolicy.md) |  | [optional] 
**additional_attributes** | **Array&lt;Hash&lt;String, String&gt;&gt;** | Additional, free form configuration data. | [optional] 


