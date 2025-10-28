# CyberSource::CardProcessingConfigCommonAcquirers

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**institution_id** | **String** | Identifier of the acquirer. This number is usually assigned by Visa. | [optional] 
**interbank_card_association_id** | **String** | Number assigned by MasterCard to banks to identify the member in transactions. | [optional] 
**discover_institution_id** | **String** | Assigned by Discover to identify the acquirer. | [optional] 
**country_code** | **String** | ISO 4217 format. | [optional] 
**file_destination_bin** | **String** | The BIN to which this capturefile is sent. This field must contain a valid BIN. | [optional] 
**merchant_verification_value** | **String** | Identify merchants that participate in Select Merchant Fee (SMF) programs. Unique to the merchant. | [optional] 
**merchant_id** | **String** | Merchant ID assigned by an acquirer or a processor. Should not be overriden by any other party. | [optional] 
**terminal_id** | **String** | The &#39;Terminal Id&#39; aka TID, is an identifier used for with your payments processor. Depending on the processor and payment acceptance type this may also be the default Terminal ID used for Card Present and Virtual Terminal transactions.  | [optional] 
**allow_multiple_bills** | **BOOLEAN** | Allows multiple captures for a single authorization transaction.  | [optional] 
**enable_transaction_reference_number** | **BOOLEAN** | To enable merchant to send in transaction reference number (unique reconciliation ID). | [optional] 
**payment_types** | [**Hash&lt;String, CardProcessingConfigCommonPaymentTypes&gt;**](CardProcessingConfigCommonPaymentTypes.md) | Valid values are: * VISA * MASTERCARD * AMERICAN_EXPRESS * CUP * EFTPOS * DINERS_CLUB * DISCOVER * JCB  | [optional] 
**currencies** | [**Hash&lt;String, CardProcessingConfigCommonCurrencies&gt;**](CardProcessingConfigCommonCurrencies.md) | Three-character [ISO 4217 ALPHA-3 Standard Currency Codes.](http://apps.cybersource.com/library/documentation/sbc/quickref/currencies.pdf) | [optional] 


