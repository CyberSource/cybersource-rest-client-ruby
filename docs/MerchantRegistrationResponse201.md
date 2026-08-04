# CyberSource::MerchantRegistrationResponse201

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique merchant identifier (UUID) | 
**merchant_name** | **String** | Doing business as (DBA) name | 
**merchant_url** | **String** | Base merchant URL | 
**vmid** | **String** | Visa Merchant ID | [optional] 
**cryptogram_type** | **String** | Authentication cryptogram type  Possible values: - TAVV - DAVV | [optional] 
**payment_payload_type** | **String** | Credential delivery format  Possible values: - ENCRYPTED - UNENCRYPTED | [optional] 
**indicator** | **String** | Transaction processing type  Possible values: - TAP - ACG - BOTH | 
**merchant_metadata** | **Object** | Additional merchant metadata | [optional] 
**acceptance_relationships** | **Array&lt;String&gt;** | List of acceptance network relationships | [optional] 
**protocol_interactions** | [**Array&lt;Iccv1merchantsProtocolInteractions&gt;**](Iccv1merchantsProtocolInteractions.md) | List of protocol interaction configurations (ucp, acp, x402) | [optional] 
**web_integrations** | [**Iccv1merchantsWebIntegrations**](Iccv1merchantsWebIntegrations.md) |  | [optional] 
**api_integrations** | [**Iccv1merchantsApiIntegrations**](Iccv1merchantsApiIntegrations.md) |  | [optional] 
**is_active** | **BOOLEAN** | Whether the merchant is active | 
**created_at** | **DateTime** | Creation timestamp | 
**updated_at** | **DateTime** | Last update timestamp | 
**keys** | [**Array&lt;MerchantRegistrationResponse201Keys&gt;**](MerchantRegistrationResponse201Keys.md) | List of encryption keys associated with the merchant | [optional] 


