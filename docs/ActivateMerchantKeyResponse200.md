# CyberSource::ActivateMerchantKeyResponse200

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique key identifier (UUID). Generated from VMRS. | 
**merchant_id** | **String** | Merchant identifier (UUID) | 
**merchant_name** | **String** | Merchant name | 
**key_name** | **String** | Unique name for the key | 
**encryption_key** | **String** | Base64-encoded public key | 
**algorithm** | **String** | JWE key wrap algorithm  Possible values: - RSA-OAEP - RSA-OAEP-256 - RSA-OAEP-384 - RSA-OAEP-512 | 
**encryption_type** | **String** | JWE content encryption algorithm  Possible values: - A256GCM - A128GCM - C20P - A256CBC-HS512 - A128CBC-HS256 - A256CCM - A128CCM | 
**expiration_date** | **DateTime** | Key expiration date in UTC | 
**status** | **String** | Key lifecycle status  Possible values: - active - deactivated - expired | 
**created_at** | **DateTime** | Creation timestamp | 
**updated_at** | **DateTime** | Last update timestamp | 


