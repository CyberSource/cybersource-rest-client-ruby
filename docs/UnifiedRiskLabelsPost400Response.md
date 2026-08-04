# CyberSource::UnifiedRiskLabelsPost400Response

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**request_id** | **String** | Echoes the unique request identifier from the original request. May be absent if the request could not be parsed (e.g., malformed JSON). | 
**submit_time_utc** | **DateTime** | UTC timestamp indicating when the failed request was received by the server. | 
**errors** | [**Array&lt;UnifiedRiskLabelsPost400ResponseErrors&gt;**](UnifiedRiskLabelsPost400ResponseErrors.md) | Root-level list of action-level errors describing what failed and why. | 


