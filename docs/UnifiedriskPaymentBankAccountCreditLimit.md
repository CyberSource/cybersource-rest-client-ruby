# CyberSource::UnifiedriskPaymentBankAccountCreditLimit

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**value** | **Float** | Credit limit on account     | [optional] 
**currency** | **String** | Currency of credit limit     | [optional] 
**base_currency** | **String** | 3 letter ISO 4217 currency code, such as GBP, USD or EUR. A complete list of codes can be found at \&quot;https://www.iso.org/iso-4217-currency-codes.html\&quot; The baseCurrency (the currency the baseValue is ex     | [optional] 
**base_value** | **Float** | Value of transaction expressed in the currency defined in the baseCurrency field.     | [optional] 
**merchant_currency** | **String** | ISO 4217 3-letter code for the merchant&#39;s local currency used to express the credit limit amount (e.g., EUR for EU merchants) | [optional] 
**merchant_value** | **Float** | Credit limit amount expressed in the merchant&#39;s local currency, used for utilization ratio calculations and cross-currency risk assessment | [optional] 


