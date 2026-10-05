# CyberSource::InlineResponse20018

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The checkout session identifier. | 
**status** | **String** | Will always be &#x60;canceled&#x60; on a successful response.  Possible values: - canceled | 
**currency** | **String** | ISO 4217 lowercase currency code. | 
**buyer** | [**AcpCheckoutSessionResponseBuyer**](AcpCheckoutSessionResponseBuyer.md) |  | [optional] 
**line_items** | [**Array&lt;InlineResponse20112LineItems&gt;**](InlineResponse20112LineItems.md) | Line items with merchant-confirmed pricing. | 
**fulfillment_address** | [**InlineResponse20017FulfillmentAddress**](InlineResponse20017FulfillmentAddress.md) |  | [optional] 
**fulfillment_options** | [**Array&lt;InlineResponse20112FulfillmentOptions&gt;**](InlineResponse20112FulfillmentOptions.md) | Available fulfillment methods with pricing. | 
**fulfillment_option_id** | **String** | ID of the currently selected fulfillment option. | [optional] 
**totals** | [**Array&lt;InlineResponse20112Totals&gt;**](InlineResponse20112Totals.md) | Order cost breakdown as typed total lines. All amounts in minor units (cents). | 
**messages** | [**Array&lt;InlineResponse20112Messages&gt;**](InlineResponse20112Messages.md) | Informational or error messages from the merchant backend. | 
**links** | [**Array&lt;InlineResponse20112Links&gt;**](InlineResponse20112Links.md) | Related resource links from the merchant (e.g. terms of use, privacy policy). | 


