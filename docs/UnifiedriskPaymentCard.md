# CyberSource::UnifiedriskPaymentCard

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Name on the card | [optional] 
**number** | **String** | Tokenized or masked card number | [optional] 
**card_network** | **String** | Card network: VISA, MASTERCARD, AMEX, etc | [optional] 
**type** | **String** | Card type: CREDIT, DEBIT, PREPAID etc. | [optional] 
**sub_type** | **String** | Card subtype: GOLD, PLATINUM, etc | [optional] 
**bin** | **String** | Bank Identification Number (first 6 digits) | [optional] 
**expiration_month** | **String** | Card expiration month | [optional] 
**expiration_year** | **String** | Card expiration year | [optional] 
**issue_date** | **Date** | Date card was issued | [optional] 
**issuer_country** | **String** | Country where card was issued | [optional] 
**brand** | **String** | Card network: VISA, MASTERCARD, AMEX, etc | [optional] 
**sequence_number** | **Integer** | Sequence number for cards with same PAN | [optional] 
**last4** | **String** | Last 4 digits of card number | [optional] 
**status** | **String** | Card status: ACTIVE, BLOCKED, CANCELLED | [optional] 
**token_transaction_type** | **String** | Transaction type that provided the token data | [optional] 
**token_details** | [**UnifiedriskPaymentCardTokenDetails**](UnifiedriskPaymentCardTokenDetails.md) |  | [optional] 
**added_at_checkout** | **BOOLEAN** | Whether the card was newly entered during checkout | [optional] 
**par_details** | [**UnifiedriskPaymentCardParDetails**](UnifiedriskPaymentCardParDetails.md) |  | [optional] 
**expiry_date** | **String** | Card expiry date in MMYYYY or MMYY format, used for matching against the expiry date declared during enrollment and to flag expired or about-to-expire cards | [optional] 
**entity_id** | **String** | Unique entity identifier for the card as assigned by the card scheme or token service provider, used for lifecycle and risk management | [optional] 
**bin_entity_id** | **String** | Entity identifier linked to the card&#39;s BIN, used to identify the issuing institution or program associated with the card&#39;s BIN range | [optional] 
**security_code** | **String** | Result or presence indicator for Card Security Code (CVV2/CVC2/CID) verification. Indicates whether the security code was present, verified, or matched by the issuer | [optional] 


