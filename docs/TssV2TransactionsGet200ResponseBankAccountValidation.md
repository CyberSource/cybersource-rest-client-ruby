# CyberSource::TssV2TransactionsGet200ResponseBankAccountValidation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**raw_validation_code** | **Integer** | Raw Validation Codes for routing number and account number      Possible values:     • -1: Unable to perform validation/Unknown error     • -2: Service Unavailable     • 12 to 16: Validation results  | [optional] 
**result_code** | **Integer** | Result codes for account number and routing number      Possible values: 00, 04, 98, 99  | [optional] 
**result_message** | **String** |  | [optional] 


