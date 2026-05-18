# CyberSource::Acpv1instructionsMandates

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**mandate_id** | **String** | Unique identifier with in the context of a purchase-intent for the mandate.   Assigned by Partner. Id shall not be reused when a mandate is updated/deleted.  | 
**preferred_merchant_name** | **String** | User merchant preference. | [optional] 
**merchant_category** | **String** | Merchant category Description. | [optional] 
**merchant_category_code** | **String** | Merchant category Code. Once it is checked, it has to be valid merchant category code. Ex:\&quot; 5311\&quot; | [optional] 
**decline_threshold** | [**Acpv1instructionsDeclineThreshold**](Acpv1instructionsDeclineThreshold.md) |  | 
**recurring_payment_information** | [**Acpv1instructionsRecurringPaymentInformation**](Acpv1instructionsRecurringPaymentInformation.md) |  | [optional] 
**effective_until_time** | **String** | UTC time in Unix epoch format. | 
**quantity** | **String** | Quantity of the product. | [optional] 
**description** | **String** | Description of the product. | 


