# CyberSource::TmsNetworkTokenServicesVisaTokenService

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enable_service** | **BOOLEAN** | Indicates if the service for network tokens for the Visa card association are enabled | [optional] 
**enable_transactional_tokens** | **BOOLEAN** | Indicates if network tokens for the Visa card association are enabled for transactions | [optional] 
**token_requestor_id** | **String** | Token Requestor ID provided by Visa during the registration process for the Tokenization Service  Pattern: ^[0-9]{11}\\\\z$\&quot; Min Length: 11 Max Length: 11 Example:  \&quot;40000000082\&quot;  | [optional] 
**relationship_id** | **String** | Relationship ID provided by visa  Min Length: 1 Max Length: 100 Example: \&quot;24681921-40000000082\&quot;  | [optional] 


