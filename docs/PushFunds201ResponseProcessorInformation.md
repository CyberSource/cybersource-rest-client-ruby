# CyberSource::PushFunds201ResponseProcessorInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**transaction_id** | **Integer** | Network transaction identifier (TID). This value can be used to identify a specific transaction when you are discussing the transaction with your processor.  | [optional] 
**response_code** | **String** | Transaction status from the processor.  | [optional] 
**approval_code** | **String** | Issuer-generated approval code for the transaction.  | [optional] 
**system_trace_audit_number** | **String** | System audit number. Returned by authorization and incremental authorization services.  Visa Platform Connect  System trace number that must be printed on the customer’s receipt.  | [optional] 
**response_code_source** | **String** | Used by Visa only and contains the response source/reason code that identifies the source of the response decision.  | [optional] 
**retrieval_reference_number** | **String** | Unique reference number returned by the processor that identifies the transaction at the network.  Supported by Mastercard Send  | [optional] 


