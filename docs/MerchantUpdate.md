# CyberSource::MerchantUpdate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**merchant_name** | **String** | Doing business as (DBA) name | [optional] 
**merchant_url** | **String** | Base merchant URL (must use HTTPS) | [optional] 
**cryptogram_type** | **String** | Authentication cryptogram type  Possible values: - TAVV - DAVV | [optional] 
**payment_payload_type** | **String** | Credential delivery format  Possible values: - ENCRYPTED - UNENCRYPTED | [optional] 
**acceptance_relationships** | **Array&lt;String&gt;** | List of acceptance network relationships | [optional] 
**protocol_interactions** | [**Array&lt;Iccv1merchantsProtocolInteractions&gt;**](Iccv1merchantsProtocolInteractions.md) | List of protocol configurations | [optional] 
**web_integrations** | [**Iccv1merchantsWebIntegrations**](Iccv1merchantsWebIntegrations.md) |  | [optional] 
**api_integrations** | [**Iccv1merchantsApiIntegrations**](Iccv1merchantsApiIntegrations.md) |  | [optional] 


