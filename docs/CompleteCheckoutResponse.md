# CyberSource::CompleteCheckoutResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | The checkout session identifier. | 
**status** | **String** | Will always be &#x60;completed&#x60; on a successful response.  Possible values: - completed | 
**currency** | **String** | ISO 4217 lowercase currency code. | 
**buyer** | [**AcpCompleteCheckoutResponseBuyer**](AcpCompleteCheckoutResponseBuyer.md) |  | 
**line_items** | [**Array&lt;CheckoutSessionResponseLineItems&gt;**](CheckoutSessionResponseLineItems.md) | Final line items with confirmed pricing. | 
**fulfillment_address** | [**CompleteCheckoutResponseFulfillmentAddress**](CompleteCheckoutResponseFulfillmentAddress.md) |  | [optional] 
**fulfillment_options** | [**Array&lt;CheckoutSessionResponseFulfillmentOptions&gt;**](CheckoutSessionResponseFulfillmentOptions.md) |  | 
**fulfillment_option_id** | **String** | ID of the selected fulfillment option. | 
**totals** | [**Array&lt;CheckoutSessionResponseTotals&gt;**](CheckoutSessionResponseTotals.md) | Final order totals as typed total lines. All amounts in minor units (cents). | 
**order** | [**CompleteCheckoutResponseOrder**](CompleteCheckoutResponseOrder.md) |  | 
**messages** | [**Array&lt;CheckoutSessionResponseMessages&gt;**](CheckoutSessionResponseMessages.md) | Informational or error messages from the merchant backend. | 
**links** | [**Array&lt;CheckoutSessionResponseLinks&gt;**](CheckoutSessionResponseLinks.md) | Related resource links from the merchant (e.g. terms of use, privacy policy). | 


