# CyberSource::TmsNetworkTokenServicesAmericanExpressTokenService

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enable_service** | **BOOLEAN** | Indicates if the service for network tokens for the American Express card association are enabled | [optional] 
**enable_transactional_tokens** | **BOOLEAN** | Indicates if network tokens for the American Express card association are enabled for transactions | [optional] 
**token_requestor_id** | **String** | Token Requestor ID provided by American Express during the registration process for the Tokenization Service  Pattern: ^[0-9]{11}\\\\z$\&quot; Min Length: 11 Max Length: 11 Example: \&quot;12345678912\&quot;  | [optional] 
**se_number** | **String** | SE Number assigned by American Express for the merchant&#39;s account  Pattern: \&quot;^[0-9]{11}\\\\z$\&quot; Min Length: 10 Max Length: 10 Example: \&quot;9876543212\&quot;  | [optional] 


