# CyberSource::Riskv1authenticationsConsumerAuthenticationInformationIvr

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enabled_message** | **BOOLEAN** | Flag to indicate if a valid IVR transaction was detected.  | [optional] 
**encryption_key** | **String** | Encryption key to be used in the event the ACS requires encryption of the credential field.  | [optional] 
**encryption_mandatory** | **BOOLEAN** | Flag to indicate if the ACS requires the credential to be encrypted.  | [optional] 
**encryption_type** | **String** | An indicator from the ACS to inform the type of encryption that should be used in the event the ACS requires encryption of the credential field.  | [optional] 
**label** | **String** | An ACS Provided label that can be presented to the Consumer. Recommended use with an application.  | [optional] 
**prompt** | **String** | An ACS provided string that can be presented to the Consumer. Recommended use with an application.  | [optional] 
**status_message** | **String** | An ACS provided message that can provide additional information or details.  | [optional] 


