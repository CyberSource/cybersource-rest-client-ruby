# CyberSource::Boardingv1registrationsOrganizationInformationOwners

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**first_name** | **String** |  | 
**middle_name** | **String** |  | [optional] 
**last_name** | **String** |  | 
**birth_date** | **Date** | &#x60;Format: YYYY-MM-DD&#x60; Example 2016-08-11 equals August 11, 2016  | 
**is_primary** | **BOOLEAN** | Determines whether the owner is the Primary owner of the organization | 
**ssn** | **String** | Social Security Number | [optional] 
**passport_number** | **String** | Passport number | [optional] 
**passport_country** | **String** |  | [optional] 
**job_title** | **String** |  | 
**has_significant_responsability** | **BOOLEAN** | Determines whether owner has significant responsibility to control, manage or direct the company | 
**ownership_percentage** | **Float** | Determines the percentage of ownership this owner has. For the primary owner the percentage can be from 0-100; for other owners the percentage can be from 25-100 and the sum of ownership accross owners cannot exceed 100 | 
**phone_number** | **String** |  | 
**email** | **String** |  | 
**address** | [**Boardingv1registrationsOrganizationInformationBusinessInformationAddress**](Boardingv1registrationsOrganizationInformationBusinessInformationAddress.md) |  | 


