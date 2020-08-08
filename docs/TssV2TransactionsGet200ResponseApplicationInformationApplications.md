# CyberSource::TssV2TransactionsGet200ResponseApplicationInformationApplications

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | The name of the CyberSource transaction type (such as CC settlement or CC authorization) that the merchant wants to process in a transaction request. More than one transaction type can included in a transaction request. Each transaction type separately returns their own status, reasonCode, rCode, and rFlag messages.  | [optional] 
**status** | **String** | The description for this field is not available. | [optional] 
**reason_code** | **String** | 3-digit reason code that indicates why the customer profile payment succeeded or failed. | [optional] 
**r_code** | **String** | Indicates whether the service request was successful. Possible values:  - &#x60;-1&#x60;: An error occurred. - &#x60;0&#x60;: The request was declined. - &#x60;1&#x60;: The request was successful.  | [optional] 
**r_flag** | **String** | One-word description of the result of the application.  | [optional] 
**reconciliation_id** | **String** | Reference number that you use to reconcile your CyberSource reports with your processor reports.  | [optional] 
**r_message** | **String** | Message that explains the reply flag for the application.  | [optional] 
**return_code** | **Integer** | The description for this field is not available. | [optional] 


