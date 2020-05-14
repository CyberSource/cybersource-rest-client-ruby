# CyberSource::Ptsv2paymentsidClientReferenceInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | Merchant-generated order reference or tracking number. It is recommended that you send a unique value for each transaction so that you can perform meaningful searches for the transaction.  #### Used by **Authorization**\\ Required field.  #### FDC Nashville Global Certain circumstances can cause the processor to truncate this value to 15 or 17 characters for Level II and Level III processing, which can cause a discrepancy between the value you submit and the value included in some processor reports.  | [optional] 
**partner** | [**Ptsv2paymentsidClientReferenceInformationPartner**](Ptsv2paymentsidClientReferenceInformationPartner.md) |  | [optional] 
**application_name** | **String** | The name of the Connection Method client (such as Virtual Terminal or SOAP Toolkit API) that the merchant uses to send a transaction request to CyberSource.  | [optional] 
**application_version** | **String** | Version of the CyberSource application or integration used for a transaction.  | [optional] 
**application_user** | **String** | The entity that is responsible for running the transaction and submitting the processing request to CyberSource. This could be a person, a system, or a connection method.  | [optional] 

