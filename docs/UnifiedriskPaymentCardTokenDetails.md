# CyberSource::UnifiedriskPaymentCardTokenDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**provider_type** | **String** | Token provider type: network_token or merchant_token      Possible values: - network_token - merchant_token | [optional] 
**type** | **String** | Type of payment credential being used. Visa, MasterCard, AMEX | [optional] 
**jti** | **String** | Transient Token JWT ID | [optional] 
**number** | **String** | Token number replacing PAN     | [optional] 
**expiration_month** | **String** | Token expiration month     | [optional] 
**expiration_year** | **String** | Token expiration year     | [optional] 
**bin** | **String** | BIN from underlying card     | [optional] 
**last4** | **String** | Last 4 digits of card     | [optional] 
**expiration_date** | **String** | Combined expiration date of the network token in MMYYYY format, used when the token&#39;s lifecycle is managed separately from the underlying PAN | [optional] 
**requestor_id** | **String** | Unique identifier of the token requestor (e.g., merchant or PSP) registered with the token service provider for DPAN provisioning and lifecycle management | [optional] 
**cryptogram** | **String** | A cryptographic value generated during tokenization (TAVV or CAVV) that authenticates the token for a specific transaction, preventing token replay attacks | [optional] 
**status** | **String** | Current lifecycle status of the network token (e.g., ACTIVE, SUSPENDED, DEACTIVATED). Tokens that are not ACTIVE should not be used for payment | [optional] 
**cryptogra_validity** | **String** | Indicates the validity or expiry state of the cryptogram, helping detect stale or replayed token authentication attempts | [optional] 
**assurance_method** | **String** | Indicates the authentication assurance level of the token provisioning process (e.g., APP_VERIFIED, CARDHOLDER_VERIFIED), impacting liability shift decisions | [optional] 
**additional_data** | **String** | Supplementary data associated with the network token, such as merchant category restrictions, wallet provider metadata, or tokenization service payload extensions | [optional] 


