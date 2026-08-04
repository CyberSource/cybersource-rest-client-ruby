# CyberSource::InlineResponse2015OrderInformationAmountDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**authorized_amount** | **String** | Amount that was authorized.  | [optional] 
**currency** | **String** | Currency used for the order. Use the three-character ISO Standard Currency Codes.  | [optional] 
**exchange_rate** | **String** | The rate of conversion of the currency given in the request.  | [optional] 
**total_amount** | **String** | Grand total for the order. This value cannot be negative. You can include a decimal point (.), but no other special characters. CyberSource truncates the amount to the correct number of decimal places.  | [optional] 
**settlement_amount** | **String** | This is a multicurrency field. It contains the transaction amount, converted to the currency used to bill the cardholder&#39;s account.  | [optional] 


