# CyberSource::MerchantUpdate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**merchant_name** | **String** | Doing business as (DBA) name | [optional] 
**merchant_url** | **String** | Base URL of the merchant&#39;s domain. Must use HTTPS and be unique — raises 409 if already registered. | [optional] 
**cryptogram_type** | **String** | Authentication cryptogram type used for payment credential generation.  Possible values: - TAVV - DAVV | [optional] 
**payment_payload_type** | **String** | Credential delivery format. Set to ***ENCRYPTED*** to enable JWE-encrypted payload delivery — requires an active encryption key. Returns 400 if no active key exists.  Possible values: - ENCRYPTED - UNENCRYPTED | [optional] 
**acceptance_relationships** | **Array&lt;String&gt;** | List of payment network acceptance relationships (e.g., \&quot;Visa\&quot;). | [optional] 
**protocol_interactions** | [**Array&lt;Iccv1merchantsProtocolInteractions&gt;**](Iccv1merchantsProtocolInteractions.md) | List of protocol interaction configurations defining the merchant&#39;s endpoint for each supported protocol (ucp, acp, x402). | [optional] 
**web_integrations** | [**MerchantRegistrationResponse201WebIntegrations**](MerchantRegistrationResponse201WebIntegrations.md) |  | [optional] 
**api_integrations** | [**MerchantRegistrationResponse201ApiIntegrations**](MerchantRegistrationResponse201ApiIntegrations.md) |  | [optional] 


