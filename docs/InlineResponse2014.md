# CyberSource::InlineResponse2014

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**submit_time_utc** | **String** | Time of request in UTC. Format: &#x60;YYYY-MM-DDThh:mm:ssZ&#x60; Example &#x60;2016-08-11T22:47:57Z&#x60; equals August 11, 2016, at 22:47:57 (10:47:57 p.m.). The &#x60;T&#x60; separates the date and the time. The &#x60;Z&#x60; indicates UTC.  | [optional] 
**status** | **String** | The status of the submitted transaction. Possible values:  - ACCEPTED  | [optional] 
**client_reference_information** | [**Kmsegressv2keyssymClientReferenceInformation**](Kmsegressv2keyssymClientReferenceInformation.md) |  | [optional] 
**key_information** | [**InlineResponse2014KeyInformation**](InlineResponse2014KeyInformation.md) |  | [optional] 


