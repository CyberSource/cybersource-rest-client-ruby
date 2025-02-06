# CyberSource::Ptsv2payoutsRecipientInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**first_name** | **String** | First name of recipient. characters. * CTV (14) * Paymentech (30)  | [optional] 
**middle_name** | **String** | Recipient&#39;s middle name. This field is a _passthrough_, which means that CyberSource does not verify the value or modify it in any way before sending it to the processor. If the field is not required for the transaction, CyberSource does not forward it to the processor.  | [optional] 
**last_name** | **String** | Last name of recipient. characters. * CTV (14) * Paymentech (30)  | [optional] 
**address1** | **String** | Recipient address information. Required only for FDCCompass. | [optional] 
**locality** | **String** | Recipient city. Required only for FDCCompass. | [optional] 
**administrative_area** | **String** | Recipient State. Required only for FDCCompass. | [optional] 
**country** | **String** | Recipient country code. Required only for FDCCompass. | [optional] 
**postal_code** | **String** | Recipient postal code. Required only for FDCCompass. | [optional] 
**phone_number** | **String** | Recipient phone number. Required only for FDCCompass. | [optional] 
**alias_name** | **String** | Account owner alias name.  | [optional] 
**nationality** | **String** | Account Owner Nationality | [optional] 
**country_of_birth** | **String** | Account Owner Country of Birth | [optional] 
**occupation** | **String** | Account Owner Occupation | [optional] 
**email** | **String** | Account Owner email address | [optional] 


