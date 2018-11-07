# CyberSource::Ptsv2paymentsRecipientInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | Identifier for the recipient’s account. Use the first six digits and last four digits of the recipient’s account number. This field is a pass-through, which means that CyberSource does not verify the value or modify it in any way before sending it to the processor. If the field is not required for the transaction, CyberSource does not forward it to the processor.  | [optional] 
**last_name** | **String** | Recipient’s last name. This field is a passthrough, which means that CyberSource does not verify the value or modify it in any way before sending it to the processor. If the field is not required for the transaction, CyberSource does not forward it to the processor.  | [optional] 
**postal_code** | **String** | Partial postal code for the recipient’s address. For example, if the postal code is **NN5 7SG**, the value for this  field should be the first part of the postal code: **NN5**. This field is a pass-through, which means that CyberSource does not verify the value or modify it in any way before sending it to the processor. If the field is not required for the transaction, CyberSource does not forward it to the processor.  | [optional] 


