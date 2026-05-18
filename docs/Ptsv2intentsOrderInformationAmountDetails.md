# CyberSource::Ptsv2intentsOrderInformationAmountDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**total_amount** | **String** | Grand total for the order. This value cannot be negative. You can include a decimal point (.), but you cannot include any other special characters. CyberSource truncates the amount to the correct number of decimal places  | [optional] 
**currency** | **String** | Currency used for the order  | [optional] 
**discount_amount** | **String** | Discount amount for the transaction.   | [optional] 
**shipping_amount** | **String** | Aggregate shipping charges for the transactions.  | [optional] 
**shipping_discount_amount** | **String** | Shipping discount amount for the transaction.   | [optional] 
**tax_amount** | **String** | Total tax amount.   | [optional] 
**insurance_amount** | **String** | Amount being charged for the insurance fee.   | [optional] 
**duty_amount** | **String** | Amount being charged as duty amount.              | [optional] 


