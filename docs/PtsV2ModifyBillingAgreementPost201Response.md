# CyberSource::PtsV2ModifyBillingAgreementPost201Response

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_links** | [**PtsV2ModifyBillingAgreementPost201ResponseLinks**](PtsV2ModifyBillingAgreementPost201ResponseLinks.md) |  | [optional] 
**id** | **String** | An unique identification number generated by Cybersource to identify the submitted request. Returned by all services. It is also appended to the endpoint of the resource. On incremental authorizations, this value with be the same as the identification number returned in the original authorization response.  | [optional] 
**submit_time_utc** | **String** | Time of request in UTC. Format: &#x60;YYYY-MM-DDThh:mm:ssZ&#x60; **Example** &#x60;2016-08-11T22:47:57Z&#x60; equals August 11, 2016, at 22:47:57 (10:47:57 p.m.). The &#x60;T&#x60; separates the date and the time. The &#x60;Z&#x60; indicates UTC.  Returned by Cybersource for all services.  | [optional] 
**status** | **String** | The status of the billing agreement. Possible value is:   - PENDING   - REVOKED   - ACTIVE   - FAILED   - EXPIRED   - INACTIVE  | [optional] 
**processor_information** | [**PtsV2CreateBillingAgreementPost201ResponseProcessorInformation**](PtsV2CreateBillingAgreementPost201ResponseProcessorInformation.md) |  | [optional] 
**installment_information** | [**PtsV2CreateBillingAgreementPost201ResponseInstallmentInformation**](PtsV2CreateBillingAgreementPost201ResponseInstallmentInformation.md) |  | [optional] 
**client_reference_information** | [**PtsV2CreateBillingAgreementPost201ResponseClientReferenceInformation**](PtsV2CreateBillingAgreementPost201ResponseClientReferenceInformation.md) |  | [optional] 
**risk_information** | [**PtsV2CreateBillingAgreementPost201ResponseRiskInformation**](PtsV2CreateBillingAgreementPost201ResponseRiskInformation.md) |  | [optional] 
**agreement_information** | [**PtsV2ModifyBillingAgreementPost201ResponseAgreementInformation**](PtsV2ModifyBillingAgreementPost201ResponseAgreementInformation.md) |  | [optional] 
**order_information** | [**PtsV2ModifyBillingAgreementPost201ResponseOrderInformation**](PtsV2ModifyBillingAgreementPost201ResponseOrderInformation.md) |  | [optional] 
**payment_information** | [**PtsV2ModifyBillingAgreementPost201ResponsePaymentInformation**](PtsV2ModifyBillingAgreementPost201ResponsePaymentInformation.md) |  | [optional] 

