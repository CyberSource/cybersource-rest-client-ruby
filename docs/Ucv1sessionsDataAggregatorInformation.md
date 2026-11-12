# CyberSource::Ucv1sessionsDataAggregatorInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**aggregator_id** | **String** | Value that identifies you as a payment aggregator. Get this value from the processor.  | [optional] 
**name** | **String** | Your payment aggregator business name.  **American Express Direct**\\ The maximum length of the aggregator name depends on the length of the sub-merchant name. The combined length for both values must not exceed 36 characters.\\  | [optional] 
**sub_merchant** | [**Ucv1sessionsDataAggregatorInformationSubMerchant**](Ucv1sessionsDataAggregatorInformationSubMerchant.md) |  | [optional] 
**street_address** | **String** | Acquirer street name. | [optional] 
**city** | **String** | Acquirer city. | [optional] 
**state** | **String** | Acquirer state. | [optional] 
**postal_code** | **String** | Acquirer postal code. | [optional] 
**country** | **String** | Acquirer country used for Payment Facilitator scenarios. | [optional] 
**service_providername** | **String** | Contains transfer service provider name. | [optional] 


