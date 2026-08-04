# CyberSource::AgentRegistrationResponse201Keys

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique key identifier. Generated from VARS. | 
**key_name** | **String** | Unique identifier for the key | 
**public_key** | **String** | Base64-encoded public key | 
**algorithm** | **String** | Signing algorithm  Possible values: - RSA-SHA256 - RSA-SHA512 - ECDSA-SHA256 - ECDSA-SHA512 - EdDSA | 
**expiration_date** | **DateTime** | Key expiration date in UTC | 
**status** | **String** | Key lifecycle status  Possible values: - active - deactivated - expired | 
**created_at** | **DateTime** | Creation timestamp | 
**updated_at** | **DateTime** | Last update timestamp | 


