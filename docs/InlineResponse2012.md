# CyberSource::InlineResponse2012

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** |  | [optional] 
**submit_time_utc** | **DateTime** | Time of request in UTC. &#x60;Format: YYYY-MM-DDThh:mm:ssZ&#x60;  Example 2016-08-11T22:47:57Z equals August 11, 2016, at 22:47:57 (10:47:57 p.m.). The T separates the date and the time. The Z indicates UTC.  | [optional] 
**status** | **String** | The status of Registration request Possible Values:   - &#39;INITIALIZED&#39;   - &#39;RECEIVED&#39;   - &#39;PROCESSING&#39;   - &#39;SUCCESS&#39;   - &#39;FAILURE&#39;   - &#39;PARTIAL&#39;  | [optional] 
**registration_information** | [**InlineResponse2012RegistrationInformation**](InlineResponse2012RegistrationInformation.md) |  | [optional] 
**integration_information** | [**InlineResponse2012IntegrationInformation**](InlineResponse2012IntegrationInformation.md) |  | [optional] 
**organization_information** | [**InlineResponse2012OrganizationInformation**](InlineResponse2012OrganizationInformation.md) |  | [optional] 
**product_information_setups** | [**Array&lt;InlineResponse2012ProductInformationSetups&gt;**](InlineResponse2012ProductInformationSetups.md) |  | [optional] 
**message** | **String** |  | [optional] 
**details** | **Hash&lt;String, Array&lt;Object&gt;&gt;** |  | [optional] 


