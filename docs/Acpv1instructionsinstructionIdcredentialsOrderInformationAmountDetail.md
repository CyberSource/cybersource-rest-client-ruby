# CyberSource::Acpv1instructionsinstructionIdcredentialsOrderInformationAmountDetail

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**total_amount** | **String** | The final amount that the customer needs to pay or paid. | 
**currency** | **String** | (Conditional) ISO 4217 currency code. Currency in which the transactionAmount, subTotal, tax, Shipping&amp; handling or discount amount is expressed. Conditionality - Required when either transactionAmount, subTotal, tax, Shipping&amp; handling or discount amount is present.  | 
**sub_total_amount** | **String** | The total transaction amount before any taxes or discounts are applied. | [optional] 
**discount_amount** | **String** | The total discount amount applied to the transaction. | [optional] 
**shipping_amount** | **String** | The total shipping and handling cost(amount) applied to the transaction. | [optional] 
**handling_amount** | **String** | The total shipping and handling cost(amount) applied to the transaction. | [optional] 


