# CyberSource::MerchantRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**merchant_name** | **String** | Doing business as (DBA) name | 
**merchant_url** | **String** | Base URL of the merchant&#39;s domain. Must use HTTPS and be unique across all registrations. | 
**vmid** | **String** | Visa Merchant ID (VMID). Must be unique — raises 409 if already in use. | [optional] 
**indicator** | **String** | Transaction processing indicator:  - ***TAP*** — Trusted Agent Protocol  - ***ACG*** — Agentic Checkout Gateway  - ***BOTH*** — supports both TAP and ACG   Possible values: - TAP - ACG - BOTH | 
**cryptogram_type** | **String** | Authentication cryptogram type used for payment credential generation. Defaults to ***DAVV*** if not provided.  Possible values: - TAVV - DAVV | [optional] 
**payment_payload_type** | **String** | Credential delivery format. Set to ***ENCRYPTED*** to enable JWE-encrypted payload delivery — requires an &#x60;encryptionKey&#x60;. Defaults to ***UNENCRYPTED***.  Possible values: - ENCRYPTED - UNENCRYPTED | [optional] 
**encryption_key** | [**Iccv1merchantsEncryptionKey**](Iccv1merchantsEncryptionKey.md) |  | [optional] 
**acceptance_relationships** | **Array&lt;String&gt;** | List of payment network acceptance relationships (e.g., \&quot;Visa\&quot;). | [optional] 
**protocol_interactions** | [**Array&lt;Iccv1merchantsProtocolInteractions&gt;**](Iccv1merchantsProtocolInteractions.md) | List of protocol interaction configurations defining the merchant&#39;s endpoint for each supported protocol (ucp, acp, x402). | [optional] 
**web_integrations** | [**Iccv1merchantsWebIntegrations**](Iccv1merchantsWebIntegrations.md) |  | [optional] 
**api_integrations** | [**Iccv1merchantsApiIntegrations**](Iccv1merchantsApiIntegrations.md) |  | [optional] 


