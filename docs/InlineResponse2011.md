# CyberSource::InlineResponse2011

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_links** | [**InlineResponse201EmbeddedCaptureLinks**](InlineResponse201EmbeddedCaptureLinks.md) |  | [optional] 
**id** | **String** | An unique identification number assigned by CyberSource to identify the submitted request. | [optional] 
**submit_time_utc** | **String** | Time of request in UTC. &#x60;Format: YYYY-MM-DDThh:mm:ssZ&#x60;  Example 2016-08-11T22:47:57Z equals August 11, 2016, at 22:47:57 (10:47:57 p.m.). The T separates the date and the time. The Z indicates UTC.  | [optional] 
**status** | **String** | The status of the submitted transaction. | [optional] 
**reconciliation_id** | **String** | The reconciliation id for the submitted transaction. This value is not returned for all processors.  | [optional] 
**client_reference_information** | [**InlineResponse201ClientReferenceInformation**](InlineResponse201ClientReferenceInformation.md) |  | [optional] 
**reversal_amount_details** | [**InlineResponse2011ReversalAmountDetails**](InlineResponse2011ReversalAmountDetails.md) |  | [optional] 
**processor_information** | [**InlineResponse2011ProcessorInformation**](InlineResponse2011ProcessorInformation.md) |  | [optional] 
**authorization_information** | [**InlineResponse2011AuthorizationInformation**](InlineResponse2011AuthorizationInformation.md) |  | [optional] 
**point_of_sale_information** | [**V2paymentsidreversalsPointOfSaleInformation**](V2paymentsidreversalsPointOfSaleInformation.md) |  | [optional] 


