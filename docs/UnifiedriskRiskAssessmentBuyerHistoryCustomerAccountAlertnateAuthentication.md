# CyberSource::UnifiedriskRiskAssessmentBuyerHistoryCustomerAccountAlertnateAuthentication

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**authentication_method** | **String** | Method used for alternate authentication during the current session (e.g., FRICTIONLESS, OTP, BIOMETRIC, PUSH_NOTIFICATION). Used as a risk signal in the 3DS flow | [optional] 
**authentication_date** | **String** | Date and time of the alternate authentication event in ISO 8601 format. Recency of authentication affects risk scoring and challenge exemption decisions | [optional] 
**authentication_data** | **String** | Opaque data payload from the alternate authentication process (e.g., signed assertion, biometric template reference). Value is issuer or method specific | [optional] 
**prior_authentication_method** | **String** | Authentication method used in the most recent prior authentication for this account (e.g., OTP, PASSWORD, BIOMETRIC). Provides historical authentication context | [optional] 
**prior_authentication_date** | **String** | Date and time of the most recent prior authentication event in ISO 8601 format, used to calculate authentication recency risk signals | [optional] 
**prior_authentication_data** | **String** | Opaque data payload from the prior authentication event, providing additional context about the historical authentication assertion | [optional] 
**prior_authentication_ref** | **String** | Reference identifier linking back to the prior authentication session or transaction, used for session continuity and risk correlation | [optional] 


