# CyberSource::KeyRequest1

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key_name** | **String** | Unique name for the key | 
**encryption_key** | **String** | Base64-encoded public key (JWE key wrap public key) | 
**algorithm** | **String** | JWE key wrap algorithm  Possible values: - RSA-OAEP - RSA-OAEP-256 - RSA-OAEP-384 - RSA-OAEP-512 | [optional] 
**encryption_type** | **String** | JWE content encryption algorithm (defaults to A256GCM)  Possible values: - A256GCM - A128GCM - C20P - A256CBC-HS512 - A128CBC-HS256 - A256CCM - A128CCM | [optional] 
**expiration_date** | **DateTime** | Key expiration date in UTC (defaults to 14 days from now if not provided) | [optional] 


