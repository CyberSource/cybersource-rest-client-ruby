# CyberSource::UnifiedriskAcquirer

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**acquirer_bin** | **String** | Acquirer bank ID number that  corresponds to a certificate that Cybersource already has.This ID has this format. 4XXXXX for Visa and 5XXXXX for Mastercard. | [optional] 
**country** | **String** | Two-letter ISO 3166-1 country code for the acquirer. Used for jurisdiction, regulatory, and risk evaluation when acquirer country may differ from merchant country (including EEA scenarios). | [optional] 
**password** | **String** | Registered password for the Visa directory server. | [optional] 
**merchant_id** | **String** | A unique identifier assigned to the merchant by the acquirer or payment processor | [optional] 
**acquirer_id** | **String** | A unique identifier for the acquirer in a transaction. | A unique identifier for the acquirer in a transaction. This is only relevant if the originating event was a card transaction. | [optional] 
**name** | **String** | Short name of the acquirer in acquirerId | [optional] 
**merchant_account** | [**UnifiedriskAcquirerMerchantAccount**](UnifiedriskAcquirerMerchantAccount.md) |  | [optional] 
**declined_phase** | **String** | Indicates the phase or stage in the transaction processing flow at which the authorization was declined (e.g., ISSUER, ACQUIRER, NETWORK, MERCHANT) | [optional] 
**country_source** | **String** | The source system or database from which the acquirer&#39;s country code was derived or validated (e.g., BIN table, registration data) | [optional] 


