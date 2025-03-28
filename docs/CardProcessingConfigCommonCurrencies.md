# CyberSource::CardProcessingConfigCommonCurrencies

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enabled** | **BOOLEAN** |  | [optional] 
**enabled_card_present** | **BOOLEAN** | Indicates whether the card-present transaction is activated for the selected currency. If both enabledCardPresent and enabledCardNotPresent are set to null, then enabledCardPresent will have the value of enabled. | [optional] 
**enabled_card_not_present** | **BOOLEAN** | Indicates whether the card-not-present transaction is activated for the selected currency. If both enabledCardPresent and enabledCardNotPresent are set to null, then enabledCardNotPresent will have the value of enabled. | [optional] 
**merchant_id** | **String** | Merchant ID assigned by an acquirer or a processor. Should not be overridden by any other party. | [optional] 
**terminal_id** | **String** | The &#39;Terminal Id&#39; aka TID, is an identifier used for with your payments processor. Depending on the processor and payment acceptance type this may also be the default Terminal ID used for Card Present and Virtual Terminal transactions.  | [optional] 
**terminal_ids** | **Array&lt;String&gt;** | Applicable for Prisma (prisma) processor. | [optional] 
**service_enablement_number** | **String** | Service Establishment Number (a.k.a. SE Number) is a unique ten-digit number assigned by American Express to a merchant that accepts American Express cards. 10 digit number provided by acquirer currency. This may be unique for each currency, however it depends on the way the processor is set up for the merchant.  | [optional] 


