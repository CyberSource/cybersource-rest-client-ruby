# CyberSource::UnifiedriskMerchantTradingAddress

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**address_line1** | **String** | First line of the merchant&#39;s trading (physical store or operating) address, including street number and name | [optional] 
**address_line2** | **String** | Second line of the merchant&#39;s trading address for suite, unit, or floor details | [optional] 
**address_line3** | **String** | Third line of the merchant&#39;s trading address for additional location information | [optional] 
**address_type** | **String** | Type of the trading address (e.g., TRADING, PHYSICAL, OPERATING) identifying its business use | [optional] 
**country** | **String** | ISO 3166-1 alpha-3 country code for the merchant&#39;s trading address (e.g., GBR, USA, DEU) | [optional] 
**country_sub_division** | **String** | ISO 3166-2 subdivision code for the merchant&#39;s trading address state, province, or region (e.g., US-CA, GB-ENG) | [optional] 
**full_address** | **String** | Complete concatenated trading address as a single string, including all lines, locality, postcode, and country | [optional] 
**latitude** | **String** | Geographic latitude coordinate of the merchant&#39;s trading location in decimal degrees, used for proximity risk signals | [optional] 
**longitude** | **String** | Geographic longitude coordinate of the merchant&#39;s trading location in decimal degrees, used for proximity risk signals | [optional] 
**postal_code** | **String** | Postal or ZIP code of the merchant&#39;s trading address (e.g., SW1A 1AA, 10001) | [optional] 
**locality** | **String** | City or town of the merchant&#39;s trading address (e.g., London, New York, Berlin) | [optional] 


