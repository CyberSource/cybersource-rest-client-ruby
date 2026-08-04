# CyberSource::LabelRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**actions** | **Array&lt;String&gt;** | Actions to perform. For label submission, specify VISA_PROTECT_RISK_INSIGHTS. | 
**events** | **Array&lt;String&gt;** | Must be LABELS for label submission requests. | 
**request_id** | **String** | Unique identifier for the label submission request | [optional] 
**event_time** | **DateTime** | The time that the real-world event occurred. | [optional] 
**transaction** | [**UnifiedriskTransaction**](UnifiedriskTransaction.md) |  | 
**labels** | [**UnifiedriskLabels**](UnifiedriskLabels.md) |  | 


