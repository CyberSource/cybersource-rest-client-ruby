# CyberSource::TssV2TransactionsGet200ResponsePaymentInformationBank

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**routing_number** | **String** | Bank routing number. This is also called the transit number.  | [optional] 
**branch_code** | **String** | Code used to identify the branch of the customer&#39;s bank. Required for some countries if you do not or are not allowed to provide the IBAN. Use this field only when scoring a direct debit transaction.  | [optional] 
**swift_code** | **String** | Bank&#39;s SWIFT code. You can use this field only when scoring a direct debit transaction. Required only for crossborder transactions.  | [optional] 
**bank_code** | **String** | Country-specific code used to identify the customer&#39;s bank. Required for some countries if you do not or are not allowed to provide the IBAN instead. You can use this field only when scoring a direct debit transaction.  | [optional] 
**iban** | **String** | International Bank Account Number (IBAN) for the bank account. For some countries you can provide this number instead of the traditional bank account information. You can use this field only when scoring a direct debit transaction.  | [optional] 
**account** | [**TssV2TransactionsGet200ResponsePaymentInformationBankAccount**](TssV2TransactionsGet200ResponsePaymentInformationBankAccount.md) |  | [optional] 
**mandate** | [**TssV2TransactionsGet200ResponsePaymentInformationBankMandate**](TssV2TransactionsGet200ResponsePaymentInformationBankMandate.md) |  | [optional] 


