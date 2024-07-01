# CyberSource::PtsV2PaymentsRefundPost201ResponseOrderInformationAmountDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**settlement_amount** | **String** | This is a multicurrency field. It contains the transaction amount (field 4), converted to the Currency used to bill the cardholder&#39;s account. This field is returned for OCT transactions.  | [optional] 
**settlement_currency** | **String** | This is a multicurrency-only field. It contains a 3-digit numeric code that identifies the currency used by the issuer to bill the cardholder&#39;s account. This field is returned for OCT transactions.  | [optional] 
**exchange_rate** | **String** | Exchange rate returned by the DCC service. Includes a decimal point and a maximum of 4 decimal places.  | [optional] 
**foreign_amount** | **String** | Set this field to the converted amount that was returned by the DCC provider.  | [optional] 
**foreign_currency** | **String** | Set this field to the converted amount that was returned by the DCC provider.  | [optional] 


