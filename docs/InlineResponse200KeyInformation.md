# CyberSource::InlineResponse200KeyInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**organization_id** | **String** | Merchant Id  | [optional] 
**key_id** | **String** | Key serial number  | [optional] 
**status** | **String** | The status of the key.  Possible values:  - FAILED  - ACTIVE  - INACTIVE  - EXPIRED  | [optional] 
**expiration_date** | **String** | The expiration time in UTC.  | [optional] 
**message** | **String** | message in case of failed key  | [optional] 
**error_information** | [**InlineResponse201ErrorInformation**](InlineResponse201ErrorInformation.md) |  | [optional] 


