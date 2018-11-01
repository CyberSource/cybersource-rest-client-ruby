# CyberSource::V2paymentsProcessingInformationAuthorizationOptionsInitiator

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | This field indicates whether the transaction is a merchant-initiated transaction or customer-initiated transaction.  | [optional] 
**credential_stored_on_file** | **BOOLEAN** | Flag that indicates whether merchant is intend to use this transaction to store payment credential for follow-up merchant-initiated transactions or not.  | [optional] 
**stored_credential_used** | **BOOLEAN** | Flag that indicates whether merchant is intend to use this transaction to store payment credential for follow-up merchant-initiated transactions or not.  | [optional] 
**merchant_initiated_transaction** | [**V2paymentsProcessingInformationAuthorizationOptionsMerchantInitiatedTransaction**](V2paymentsProcessingInformationAuthorizationOptionsMerchantInitiatedTransaction.md) |  | [optional] 


