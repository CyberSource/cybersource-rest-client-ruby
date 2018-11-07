# CyberSource::InlineResponse20012ProcessorInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**processor** | [**InlineResponse20012ProcessorInformationProcessor**](InlineResponse20012ProcessorInformationProcessor.md) |  | [optional] 
**transaction_id** | **String** | Network transaction identifier (TID). You can use this value to identify a specific transaction when you are discussing the transaction with your processor. Not all processors provide this  value.  | [optional] 
**network_transaction_id** | **String** | The description for this field is not available. | [optional] 
**response_id** | **String** | The description for this field is not available. | [optional] 
**provider_transaction_id** | **String** | The description for this field is not available. | [optional] 
**approval_code** | **String** | Authorization code. Returned only when the processor returns this value.  | [optional] 
**response_code** | **String** | For most processors, this is the error message sent directly from the bank. Returned only when the processor returns this value.  Important Do not use this field to evaluate the result of the authorization.  | [optional] 
**avs** | [**InlineResponse201ProcessorInformationAvs**](InlineResponse201ProcessorInformationAvs.md) |  | [optional] 
**card_verification** | [**InlineResponse20012ProcessorInformationCardVerification**](InlineResponse20012ProcessorInformationCardVerification.md) |  | [optional] 
**ach_verification** | [**InlineResponse20012ProcessorInformationAchVerification**](InlineResponse20012ProcessorInformationAchVerification.md) |  | [optional] 
**electronic_verification_results** | [**InlineResponse20012ProcessorInformationElectronicVerificationResults**](InlineResponse20012ProcessorInformationElectronicVerificationResults.md) |  | [optional] 


