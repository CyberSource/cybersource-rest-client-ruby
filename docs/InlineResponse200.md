# CyberSource::InlineResponse200

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**access_token** | **String** | Created JWT token. | [optional] 
**token_type** | **String** | Bearer. | [optional] 
**refresh_token** | **String** | Newly created JWT token for initial request or if refresh token expired, else the same refresh token as in the request. | [optional] 
**expires_in** | **Integer** | Number of seconds left till the access token gets expired. | [optional] 
**scope** | **String** | List of permissions for APIs. | [optional] 
**refresh_token_expires_in** | **Integer** | Number of seconds left till the refresh token gets expired. | [optional] 
**client_status** | **String** | Successful response can be returned only if client status is active. | [optional] 


