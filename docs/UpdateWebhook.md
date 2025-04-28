# CyberSource::UpdateWebhook

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Client friendly webhook name. | [optional] 
**organization_id** | **String** | Organization Id. | [optional] 
**description** | **String** | Client friendly webhook description. | [optional] 
**products** | [**Array&lt;Notificationsubscriptionsv2webhooksProducts&gt;**](Notificationsubscriptionsv2webhooksProducts.md) |  | [optional] 
**webhook_url** | **String** | The client&#39;s endpoint (URL) to receive webhooks. | [optional] 
**health_check_url** | **String** | The client&#39;s health check endpoint (URL). This should be as close as possible to the actual webhookUrl. | [optional] 
**security_policy** | [**Notificationsubscriptionsv2webhooksSecurityPolicy**](Notificationsubscriptionsv2webhooksSecurityPolicy.md) |  | [optional] 
**additional_attributes** | **Array&lt;Hash&lt;String, String&gt;&gt;** | Additional, free form configuration data. | [optional] 


