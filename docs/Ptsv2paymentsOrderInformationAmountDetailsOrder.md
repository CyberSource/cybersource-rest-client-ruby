# CyberSource::Ptsv2paymentsOrderInformationAmountDetailsOrder

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**total_amount** | **String** | Grand total for the order. This value cannot be negative. You can include a decimal point (.), but you cannot include any other special characters. CyberSource truncates the amount to the correct number of decimal places  | [optional] 
**currency** | **String** | Currency used for the order  | [optional] 
**sub_total_amount** | **String** | Shipping discount amount for the transaction. If this amount has changed since the initial sessions request, you must include the new value in the order request. You must also include all additional amount fields that apply to the order and ensure the total amount equals the purchaseTotals_grandTotalAmount value.  | [optional] 
**handling_amount** | **String** | Aggregate handling charges for the transaction. If this amount has changed since the initial sessions request, you must include the new value in the order request. You must also include all additional amount fields that apply to the order and ensure the total amount equals the purchaseTotals_grandTotalAmount value.  | [optional] 
**shipping_amount** | **String** | Aggregate shipping charges for the transaction If this amount has changed since the initial sessions request, you must include the new value in the order request. You must also include all additional amount fields that apply to the order and ensure the total amount equals the purchaseTotals_grandTotalAmount value.  | [optional] 
**shipping_discount_amount** | **String** | Shipping discount amount for the transaction. If this amount has changed since the initial sessions request, you must include the new value in the order request. You must also include all additional amount fields that apply to the order and ensure the total amount equals the purchaseTotals_grandTotalAmount value.  | [optional] 
**tax_amount** | **String** | Total tax amount. When the purchaseTotals_ taxAmount and ap_subtotalAmount fields are included in the request, do not include the tax amount as part of the subtotal amount calculation.   | [optional] 
**insurance_amount** | **String** | Amount being charged for the insurance fee. Only supported when the payment_method is set to paypal.  | [optional] 
**gift_wrap_amount** | **String** | Amount being charged as gift wrap fee.             | [optional] 


