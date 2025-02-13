# CyberSource::Ptsv2paymentsidrefundsPaymentInformationBankAccount

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | Account type.  Possible values:  - **C**: Checking.  - **G**: General ledger. This value is supported only on Wells Fargo ACH.  - **S**: Savings (U.S. dollars only).  - **X**: Corporate checking (U.S. dollars only).  | [optional] 
**number** | **String** | Account number.  When processing encoded account numbers, use this field for the encoded account number.  | [optional] 
**encoder_id** | **String** | Identifier for the bank that provided the customer&#39;s encoded account number.  To obtain the bank identifier, contact your processor.  | [optional] 
**check_number** | **String** | Check number.  Chase Paymentech Solutions - Optional. CyberSource ACH Service - Not used. RBS WorldPay Atlanta - Optional on debits. Required on credits. TeleCheck - Strongly recommended on debit requests. Optional on credits.  | [optional] 
**check_image_reference_number** | **String** | Image reference number associated with the check. You cannot include any special characters.  | [optional] 


