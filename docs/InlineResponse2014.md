# CyberSource::InlineResponse2014

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_links** | [**InlineResponse2013Links**](InlineResponse2013Links.md) |  | [optional] 
**id** | **String** | An unique identification number assigned by CyberSource to identify the submitted request. | [optional] 
**submit_time_utc** | **String** | Time of request in UTC. &#x60;Format: YYYY-MM-DDThh:mm:ssZ&#x60;  Example 2016-08-11T22:47:57Z equals August 11, 2016, at 22:47:57 (10:47:57 p.m.). The T separates the date and the time. The Z indicates UTC.  | [optional] 
**status** | **String** | The status of the submitted transaction. | [optional] 
**reconciliation_id** | **String** | The reconciliation id for the submitted transaction. This value is not returned for all processors.  | [optional] 
**client_reference_information** | [**InlineResponse201ClientReferenceInformation**](InlineResponse201ClientReferenceInformation.md) |  | [optional] 
**credit_amount_details** | [**InlineResponse2014CreditAmountDetails**](InlineResponse2014CreditAmountDetails.md) |  | [optional] 
**processor_information** | [**InlineResponse2013ProcessorInformation**](InlineResponse2013ProcessorInformation.md) |  | [optional] 
**order_information** | [**InlineResponse2013OrderInformation**](InlineResponse2013OrderInformation.md) |  | [optional] 


