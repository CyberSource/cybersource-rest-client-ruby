# CyberSource::MerchantRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**merchant_name** | **String** | Doing business as (DBA) name | 
**merchant_url** | **String** | Base merchant URL (must use HTTPS) | 
**vmid** | **String** | Visa Merchant ID — unique identifier | [optional] 
**indicator** | **String** | Transaction processing type  Possible values: - TAP - ACG - BOTH | 
**cryptogram_type** | **String** | Authentication cryptogram type (defaults to DAVV)  Possible values: - TAVV - DAVV | [optional] 
**payment_payload_type** | **String** | Credential delivery format (defaults to UNENCRYPTED)  Possible values: - ENCRYPTED - UNENCRYPTED | [optional] 
**encryption_key** | [**Iccv1merchantsEncryptionKey**](Iccv1merchantsEncryptionKey.md) |  | [optional] 
**acceptance_relationships** | **Array&lt;String&gt;** | List of acceptance network relationships | [optional] 
**protocol_interactions** | [**Array&lt;Iccv1merchantsProtocolInteractions&gt;**](Iccv1merchantsProtocolInteractions.md) | List of protocol configurations (ucp, acp, x402) with HTTPS URLs | [optional] 
**web_integrations** | [**Iccv1merchantsWebIntegrations**](Iccv1merchantsWebIntegrations.md) |  | [optional] 
**api_integrations** | [**Iccv1merchantsApiIntegrations**](Iccv1merchantsApiIntegrations.md) |  | [optional] 


