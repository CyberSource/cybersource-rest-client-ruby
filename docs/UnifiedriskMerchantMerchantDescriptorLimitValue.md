# CyberSource::UnifiedriskMerchantMerchantDescriptorLimitValue

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**base_currency** | **String** | ISO 4217 3-letter code for the base reference currency of the limit value | [optional] 
**base_value** | **Integer** | Financial limit amount in the base currency, in minor units | [optional] 
**currency** | **String** | ISO 4217 3-letter currency code in which the limit value is expressed | [optional] 
**merchant_currency** | **String** | ISO 4217 3-letter code for the merchant&#39;s local currency for the limit value | [optional] 
**merchant_value** | **Integer** | Financial limit in the merchant&#39;s local currency, in minor units | [optional] 
**value** | **Integer** | Limit value amount in the specified currency, in minor units | [optional] 
**expected_monthly_volume** | **Integer** | Expected monthly transaction volume used alongside limit value to set composite risk thresholds | [optional] 


