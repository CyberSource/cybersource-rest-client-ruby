# CyberSource::PtsV2PaymentsPost201ResponseMerchantInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**merchant_name** | **String** | Use this field only if you are requesting payment with Payer Authentication serice together.  Your company&#39;s name as you want it to appear to the customer in the issuing bank&#39;s authentication form. This value overrides the value specified by your merchant bank.  | [optional] 
**merchant_descriptor** | [**PtsV2PaymentsPost201ResponseMerchantInformationMerchantDescriptor**](PtsV2PaymentsPost201ResponseMerchantInformationMerchantDescriptor.md) |  | [optional] 
**return_url** | **String** | URL for displaying payment results to the consumer (notifications) after the transaction is processed. Usually this URL belongs to merchant and its behavior is defined by merchant  | [optional] 


