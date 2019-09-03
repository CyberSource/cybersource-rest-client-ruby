# CyberSource::PtsV2PayoutsPost201ResponseProcessorInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**approval_code** | **String** | Issuer-generated approval code for the transaction. | [optional] 
**response_code** | **String** | Transaction status from the processor. | [optional] 
**transaction_id** | **String** | Network transaction identifier (TID). This value can be used to identify a specific transaction when you are discussing the transaction with your processor.  | [optional] 
**system_trace_audit_number** | **String** | This field is returned only for **American Express Direct** and **CyberSource through VisaNet**.  #### American Express Direct  System trace audit number (STAN). This value identifies the transaction and is useful when investigating a chargeback dispute.  #### CyberSource through VisaNet  System trace number that must be printed on the customer’s receipt.  For details, see &#x60;receipt_number&#x60; field description in [Credit Card Services Using the SCMP API.](https://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html/wwhelp/wwhimpl/js/html/wwhelp.htm)  | [optional] 
**response_code_source** | **String** | Used by Visa only and contains the response source/reason code that identifies the source of the response decision.  | [optional] 


