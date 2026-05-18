# CyberSource::Ptsv1pullfundstransferAggregatorInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**aggregator_id** | **String** | Visa Direct(11 characters)   Value that identifies you as a payment aggregator. Get this value from the processor.  | [optional] 
**name** | **String** | Visa Direct(25 characters)   Your payment aggregator business name. This field is conditionally required when aggregator id is present.  | [optional] 
**sub_merchant** | [**Ptsv1pullfundstransferAggregatorInformationSubMerchant**](Ptsv1pullfundstransferAggregatorInformationSubMerchant.md) |  | [optional] 
**city** | **String** | Aggregator city.  | [optional] 
**country** | **String** | Aggregator country.  | [optional] 
**postal_code** | **String** | Aggregator postal code.  | [optional] 
**state** | **String** | Aggregator state.  | [optional] 
**street_address** | **String** | Aggregator street name.   | [optional] 


