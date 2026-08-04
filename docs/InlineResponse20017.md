# CyberSource::InlineResponse20017

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The checkout session identifier. | [optional] 
**status** | **String** | Will always be &#x60;completed&#x60; on a successful response.  Possible values: - completed | [optional] 
**currency** | **String** | ISO 4217 lowercase currency code. | [optional] 
**buyer** | [**AcpCompleteCheckoutResponseBuyer**](AcpCompleteCheckoutResponseBuyer.md) |  | [optional] 
**line_items** | [**Array&lt;InlineResponse20113LineItems&gt;**](InlineResponse20113LineItems.md) | Final line items with confirmed pricing. | [optional] 
**fulfillment_address** | [**InlineResponse20017FulfillmentAddress**](InlineResponse20017FulfillmentAddress.md) |  | [optional] 
**fulfillment_options** | [**Array&lt;InlineResponse20113FulfillmentOptions&gt;**](InlineResponse20113FulfillmentOptions.md) |  | [optional] 
**fulfillment_option_id** | **String** | ID of the selected fulfillment option. | [optional] 
**totals** | [**Array&lt;InlineResponse20113Totals&gt;**](InlineResponse20113Totals.md) | Final order totals as typed total lines. All amounts in minor units (cents). | [optional] 
**order** | [**InlineResponse20017Order**](InlineResponse20017Order.md) |  | [optional] 
**messages** | [**Array&lt;InlineResponse20113Messages&gt;**](InlineResponse20113Messages.md) | Informational or error messages from the merchant backend. | [optional] 
**links** | [**Array&lt;InlineResponse20113Links&gt;**](InlineResponse20113Links.md) | Related resource links from the merchant (e.g. terms of use, privacy policy). | [optional] 


