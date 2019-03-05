# CyberSource::PtsV2PaymentsCapturesPost201Response

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_links** | [**PtsV2PaymentsCapturesPost201ResponseLinks**](PtsV2PaymentsCapturesPost201ResponseLinks.md) |  | [optional] 
**id** | **String** | An unique identification number assigned by CyberSource to identify the submitted request. | [optional] 
**submit_time_utc** | **String** | Time of request in UTC. &#x60;Format: YYYY-MM-DDThh:mm:ssZ&#x60;  Example 2016-08-11T22:47:57Z equals August 11, 2016, at 22:47:57 (10:47:57 p.m.). The T separates the date and the time. The Z indicates UTC.  | [optional] 
**status** | **String** | The status of the submitted transaction.  Possible values:  - PENDING  | [optional] 
**reconciliation_id** | **String** | The reconciliation id for the submitted transaction. This value is not returned for all processors.  | [optional] 
**client_reference_information** | [**PtsV2PaymentsPost201ResponseClientReferenceInformation**](PtsV2PaymentsPost201ResponseClientReferenceInformation.md) |  | [optional] 
**processor_information** | [**PtsV2PaymentsCapturesPost201ResponseProcessorInformation**](PtsV2PaymentsCapturesPost201ResponseProcessorInformation.md) |  | [optional] 
**order_information** | [**PtsV2PaymentsCapturesPost201ResponseOrderInformation**](PtsV2PaymentsCapturesPost201ResponseOrderInformation.md) |  | [optional] 


