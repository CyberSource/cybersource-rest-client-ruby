# CyberSource::UnifiedriskAcquirerMerchantAccountSecurityAmount

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**base_currency** | **String** | The primary reference currency used for security deposit or holdback amounts, expressed as an ISO 4217 3-letter currency code (e.g., USD, EUR, GBP) | [optional] 
**base_value** | **String** | The monetary value of the security deposit or holdback amount expressed in the base currency, typically in minor units (e.g., cents) | [optional] 
**currency** | **String** | The transaction currency in which the security amount is collected or held, expressed as an ISO 4217 3-letter currency code | [optional] 
**merchant_currency** | **String** | The merchant&#39;s local or preferred currency for expressing the security amount, expressed as an ISO 4217 3-letter currency code | [optional] 
**merchant_value** | **String** | The security deposit or holdback amount expressed in the merchant&#39;s local currency, in minor units | [optional] 
**value** | **String** | The security deposit or holdback amount in the transaction currency, in minor units (e.g., cents) | [optional] 


