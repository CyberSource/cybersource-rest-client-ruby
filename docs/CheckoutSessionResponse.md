# CyberSource::CheckoutSessionResponse

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique identifier for this checkout session. Required for all subsequent calls (update, complete, cancel).  | 
**status** | **String** | Current lifecycle state of the session per ACP spec: - &#x60;not_ready_for_payment&#x60; — session is open but not yet ready - &#x60;ready_for_payment&#x60; — session is ready to be completed - &#x60;completed&#x60; — order has been placed; session is immutable - &#x60;canceled&#x60; — session was abandoned; no charge was made   Possible values: - not_ready_for_payment - ready_for_payment - completed - canceled | 
**currency** | **String** | ISO 4217 lowercase currency code for this session. | 
**line_items** | [**Array&lt;CheckoutSessionResponseLineItems&gt;**](CheckoutSessionResponseLineItems.md) | Line items with merchant-confirmed pricing. | 
**fulfillment_address** | [**CheckoutSessionResponseFulfillmentAddress**](CheckoutSessionResponseFulfillmentAddress.md) |  | [optional] 
**fulfillment_options** | [**Array&lt;CheckoutSessionResponseFulfillmentOptions&gt;**](CheckoutSessionResponseFulfillmentOptions.md) | Available fulfillment methods with pricing. | 
**fulfillment_option_id** | **String** | ID of the currently selected fulfillment option. | [optional] 
**totals** | [**Array&lt;CheckoutSessionResponseTotals&gt;**](CheckoutSessionResponseTotals.md) | Order cost breakdown as an array of typed total lines. All amounts in minor units (cents). | 
**buyer** | [**AcpCheckoutSessionResponseBuyer**](AcpCheckoutSessionResponseBuyer.md) |  | [optional] 
**payment_provider** | [**CheckoutSessionResponsePaymentProvider**](CheckoutSessionResponsePaymentProvider.md) |  | [optional] 
**messages** | [**Array&lt;CheckoutSessionResponseMessages&gt;**](CheckoutSessionResponseMessages.md) | Informational or error messages from the merchant backend. | 
**links** | [**Array&lt;CheckoutSessionResponseLinks&gt;**](CheckoutSessionResponseLinks.md) | Related resource links from the merchant (e.g. terms of use, privacy policy, seller shop policies).  | 


