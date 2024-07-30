# CyberSource::InlineResponse2013KeyInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**provider** | **String** | Provider name  | [optional] 
**tenant** | **String** | Tenant name  | [optional] 
**organization_id** | **String** | Organization Id  | [optional] 
**client_key_id** | **String** | Client key Id  | [optional] 
**key_id** | **String** | Key Serial Number  | [optional] 
**key** | **String** | Value of the key  | [optional] 
**key_type** | **String** | Type of the key  | [optional] 
**status** | **String** | The status of the key  | [optional] 
**expiration_date** | **String** | The expiration time in UTC. &#x60;Format: YYYY-MM-DDThh:mm:ssZ&#x60; Example 2016-08-11T22:47:57Z equals August 11, 2016, at 22:47:57 (10:47:57 p.m.). The T separates the date and the time. The Z indicates UTC.  | [optional] 
**message** | **String** | Message in case of failed key  | [optional] 
**error_information** | [**InlineResponse2013KeyInformationErrorInformation**](InlineResponse2013KeyInformationErrorInformation.md) |  | [optional] 


