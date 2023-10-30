# CyberSource::Boardingv1registrationsProductInformationSelectedProductsPaymentsPayoutsConfigurationInformationConfigurationsPullfunds

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**acquirer_organization_id** | **String** | Valid organization in OMS with an organizationInformation.type as \&quot;acquirer\&quot;. | [optional] 
**acquiring_bin** | **Integer** | This code identifies the financial institution acting as the acquirer of this transaction. The acquirer is the client or system user that signed the originator or installed the unattended cardholder- activated environment. When a processing center operates for multiple acquirers, this code is for the individual client or system user, not a code for the center. | 
**allow_crypto_currency_purchase** | **BOOLEAN** | This configuration allows a transaction to be flagged for cryptocurrency funds transfer. | [optional] 
**card_acceptor_id** | **String** | A unique identifier number for the originator of transfers that is unique to the processor or acquirer. | 
**originator_mvv** | **String** | Merchant Verification Value (MVV) is used to identify originators that participate in a variety of programs. The MVV is unique to the merchant. | [optional] 
**originator_name_abbreviation** | **String** | A 4 character max name abbreviation for the originator. | [optional] 
**card_terminal_id** | **String** | This field contains a code that identifies a terminal at the card acceptor location. This field is used in all messages related to a transaction. If sending transactions from a card not present environment, use the same value for all transactions. | 


