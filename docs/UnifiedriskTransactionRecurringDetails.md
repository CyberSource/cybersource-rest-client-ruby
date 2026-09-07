# CyberSource::UnifiedriskTransactionRecurringDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**frequency** | **Integer** | Days between recurring payments | [optional] 
**occurrence** | **String** | Recurring frequency code: DAILY, WEEKLY, MONTHLY, etc | [optional] 
**end_date** | **Date** | Date when recurring payments end | [optional] 
**number_of_payments** | **Integer** | Total number of payments in recurring series | [optional] 
**sequence_number** | **Integer** | Current sequence number in recurring series | [optional] 
**type** | **String** | Recurring type: REGISTRATION, SUBSEQUENT, MODIFICATION, CANCELLATION | [optional] 
**validation_indicator** | **String** | Indicates if recurring payment was validated | [optional] 
**amount_type** | **String** | Amount type: FIXED, VARIABLE_WITH_MAX | [optional] 
**maximum_amount** | **Float** | Maximum amount for variable recurring payments | [optional] 
**original_purchase_date** | **DateTime** | Date of original recurring purchase | [optional] 
**reference_number** | **String** | Reference number for recurring payment | [optional] 
**first_payment_date** | **String** | Date of the first payment in a recurring series, in ISO 8601 format (YYYY-MM-DD). Used to establish the anchor date for recurring payment scheduling and risk assessment | [optional] 


