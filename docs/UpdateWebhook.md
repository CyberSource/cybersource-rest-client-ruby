# CyberSource::UpdateWebhook

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Client friendly webhook name. | [optional] 
**organization_id** | **String** | Organization Id. | [optional] 
**description** | **String** | Client friendly webhook description. | [optional] 
**products** | [**Array&lt;Notificationsubscriptionsv2webhooksProducts&gt;**](Notificationsubscriptionsv2webhooksProducts.md) |  | [optional] 
**webhook_url** | **String** | The client&#39;s endpoint (URL) to receive webhooks. | [optional] 
**notification_scope** | **String** | The webhook scope. 1. SELF The Webhook is used to deliver webhooks for only this Organization (or Merchant). 2. DESCENDANTS The Webhook is used to deliver webhooks for this Organization and its children. This field is optional.    Possible values: - SELF - DESCENDANTS | [optional] [default to &#39;DESCENDANTS&#39;]
**health_check_url** | **String** | The client&#39;s health check endpoint (URL). | [optional] 
**security_policy** | [**Notificationsubscriptionsv2webhooksSecurityPolicy**](Notificationsubscriptionsv2webhooksSecurityPolicy.md) |  | [optional] 


