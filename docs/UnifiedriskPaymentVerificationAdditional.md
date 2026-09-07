# CyberSource::UnifiedriskPaymentVerificationAdditional

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**signature** | **String** | Paper signature verification: SUCCESS, FAILURE     | [optional] 
**account_holder_auth** | **String** | Account holder authentication value: SUCCESS, FAILURE     | [optional] 
**authentication_token** | **String** | Authentication token verification: SUCCESS, FAILURE     | [optional] 
**cardholder_id_data** | **String** | Cardholder ID data verification: SUCCESS, FAILURE     | [optional] 
**passive_auth** | **String** | Passive authentication: SUCCESS, FAILURE     | [optional] 
**sim_swap** | **String** | SIM swap check: NO_SWAP_DETECTED, SWAP_DETECTED     | [optional] 
**secure_corp_payment_indicator** | **String** | Secure Corporate Payment Indicator (SCPI) flag assigned by the issuer to indicate a trusted commercial or corporate payment credential. Impacts SCA (Strong Customer Authentication) exemption eligibility under PSD2 | [optional] 


