# CyberSource::Ptsv2paymentsidrefundsPaymentInformationBank

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account** | [**Ptsv2paymentsidrefundsPaymentInformationBankAccount**](Ptsv2paymentsidrefundsPaymentInformationBankAccount.md) |  | [optional] 
**routing_number** | **String** | Bank routing number. This is also called the _transit number_.  | [optional] 
**iban** | **String** | International Bank Account Number (IBAN) for the bank account. For some countries you can provide this number instead of the traditional bank account information. You can use this field only when scoring a direct debit transaction.  | [optional] 
**swift_code** | **String** | Bank&#39;s SWIFT code. You can use this field only when scoring a direct debit transaction. Required only for crossborder transactions.  | [optional] 


