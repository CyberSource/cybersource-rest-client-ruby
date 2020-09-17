# CyberSource::KmsV2KeysAsymDeletesPost200ResponseKeyInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**organization_id** | **String** | Merchant Id  | [optional] 
**reference_number** | **String** | Reference number is a unique identifier provided by the client along with the organization Id. This is an optional field provided solely for the client’s convenience. If client specifies value for this field in the request, it is expected to be available in the response.  | [optional] 
**key_id** | **String** | Key Serial Number  | [optional] 
**status** | **String** | The status of the key.  Possible values:  - FAILED  - ACTIVE  - INACTIVE  - EXPIRED  | [optional] 
**message** | **String** | message in case of failed key | [optional] 
**error_information** | [**KmsV2KeysSymPost201ResponseErrorInformation**](KmsV2KeysSymPost201ResponseErrorInformation.md) |  | [optional] 


