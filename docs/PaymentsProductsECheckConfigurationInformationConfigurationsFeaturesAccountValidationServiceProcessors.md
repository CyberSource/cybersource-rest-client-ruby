# CyberSource::PaymentsProductsECheckConfigurationInformationConfigurationsFeaturesAccountValidationServiceProcessors

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**avs_account_ownership_service** | **BOOLEAN** | *NEW* Determined in WF eTicket if account has opted into the Account Ownership Service. | [optional] 
**avs_account_status_service** | **BOOLEAN** | *NEW* Determined in WF eTicket if account has opted into the Account Status Service. | [optional] 
**avs_signed_agreement** | **BOOLEAN** | *NEW* Taken from Addendum Agreement Column in boarding form. | [optional] 
**avs_additional_id** | **String** | *NEW* Also known as the Additional ID. Taken from the boarding form. | [optional] 
**enable_avs** | **BOOLEAN** | *NEW* | [optional] [default to true]
**avs_entity_id** | **String** | *NEW* Also known as the AVS Gateway Entity ID. | [optional] 
**enable_avs_token_creation** | **BOOLEAN** | *NEW* Applicable if the merchant wants to run AVS on token creation requests only. | [optional] [default to false]


