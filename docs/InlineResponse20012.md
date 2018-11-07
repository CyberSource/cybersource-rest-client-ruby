# CyberSource::InlineResponse20012

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | An unique identification number assigned by CyberSource to identify the submitted request. | [optional] 
**root_id** | **String** | Payment Request Id | [optional] 
**reconciliation_id** | **String** | The reconciliation id for the submitted transaction. This value is not returned for all processors.  | [optional] 
**merchant_id** | **String** | The description for this field is not available. | [optional] 
**status** | **String** | The status of the submitted transaction. | [optional] 
**submit_time_utc** | **String** | Time of request in UTC. &#x60;Format: YYYY-MM-DDThh:mm:ssZ&#x60;  Example 2016-08-11T22:47:57Z equals August 11, 2016, at 22:47:57 (10:47:57 p.m.). The T separates the date and the time. The Z indicates UTC.  | [optional] 
**application_information** | [**InlineResponse20012ApplicationInformation**](InlineResponse20012ApplicationInformation.md) |  | [optional] 
**buyer_information** | [**InlineResponse20012BuyerInformation**](InlineResponse20012BuyerInformation.md) |  | [optional] 
**client_reference_information** | [**InlineResponse20012ClientReferenceInformation**](InlineResponse20012ClientReferenceInformation.md) |  | [optional] 
**consumer_authentication_information** | [**InlineResponse20012ConsumerAuthenticationInformation**](InlineResponse20012ConsumerAuthenticationInformation.md) |  | [optional] 
**device_information** | [**InlineResponse20012DeviceInformation**](InlineResponse20012DeviceInformation.md) |  | [optional] 
**error_information** | [**InlineResponse20012ErrorInformation**](InlineResponse20012ErrorInformation.md) |  | [optional] 
**installment_information** | [**InlineResponse20012InstallmentInformation**](InlineResponse20012InstallmentInformation.md) |  | [optional] 
**fraud_marking_information** | [**InlineResponse20012FraudMarkingInformation**](InlineResponse20012FraudMarkingInformation.md) |  | [optional] 
**merchant_defined_information** | [**Array&lt;InlineResponse20012MerchantDefinedInformation&gt;**](InlineResponse20012MerchantDefinedInformation.md) | The description for this field is not available. | [optional] 
**merchant_information** | [**InlineResponse20012MerchantInformation**](InlineResponse20012MerchantInformation.md) |  | [optional] 
**order_information** | [**InlineResponse20012OrderInformation**](InlineResponse20012OrderInformation.md) |  | [optional] 
**payment_information** | [**InlineResponse20012PaymentInformation**](InlineResponse20012PaymentInformation.md) |  | [optional] 
**processing_information** | [**InlineResponse20012ProcessingInformation**](InlineResponse20012ProcessingInformation.md) |  | [optional] 
**processor_information** | [**InlineResponse20012ProcessorInformation**](InlineResponse20012ProcessorInformation.md) |  | [optional] 
**point_of_sale_information** | [**InlineResponse20012PointOfSaleInformation**](InlineResponse20012PointOfSaleInformation.md) |  | [optional] 
**risk_information** | [**InlineResponse20012RiskInformation**](InlineResponse20012RiskInformation.md) |  | [optional] 
**sender_information** | [**InlineResponse20012SenderInformation**](InlineResponse20012SenderInformation.md) |  | [optional] 
**_links** | [**InlineResponse2011Links**](InlineResponse2011Links.md) |  | [optional] 


