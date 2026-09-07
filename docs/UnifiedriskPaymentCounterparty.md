# CyberSource::UnifiedriskPaymentCounterparty

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_id** | **String** | Counterparty account identifier | [optional] 
**account_format** | **String** | Counterparty account format | [optional] 
**branch_id** | **String** | Counterparty branch identifier | [optional] 
**name** | **String** | Full legal name of the counterparty (individual or business) used for identity matching, beneficiary validation, and fraud screening | [optional] 
**type** | **String** | Classification of the counterparty entity type (e.g., INDIVIDUAL, BUSINESS, FINANCIAL_INSTITUTION). Used for AML screening and beneficiary risk assessment | [optional] 
**agent_id** | **String** | Unique identifier for the financial agent or correspondent bank through which the counterparty payment is being routed | [optional] 
**agent_name** | **String** | Name of the financial agent or correspondent institution facilitating the payment to the counterparty | [optional] 
**branch_address** | [**UnifiedriskPaymentCounterpartyBranchAddress**](UnifiedriskPaymentCounterpartyBranchAddress.md) |  | [optional] 
**address** | [**UnifiedriskPaymentCounterpartyAddress**](UnifiedriskPaymentCounterpartyAddress.md) |  | [optional] 
**creation_time** | **String** | Timestamp when the counterparty record was created in the system, expressed in ISO 8601 format. Used for new payee fraud detection | [optional] 


