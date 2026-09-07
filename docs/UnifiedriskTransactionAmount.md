# CyberSource::UnifiedriskTransactionAmount

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | **Float** | Transaction amount in the specified currency | [optional] 
**currency** | **String** | ISO 4217 3-letter currency code | [optional] 
**base_currency** | **String** | Base currency for multi-currency transactions | [optional] 
**base_value** | **Float** | Amount in base currency | [optional] 
**merchant_currency** | **String** | ISO 4217 3-letter code for the merchant&#39;s local currency used to express the transaction amount (e.g., EUR for EU merchants). Used for cross-currency risk analysis | [optional] 
**merchant_value** | **Float** | Transaction amount expressed in the merchant&#39;s local currency, used for cross-currency comparison and risk threshold evaluation against merchant&#39;s baseline | [optional] 


