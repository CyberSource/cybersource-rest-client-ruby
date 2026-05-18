# CyberSource::Ucv1sessionsDataProcessingInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reconciliation_id** | **String** | The reconciliation ID | [optional] 
**purpose_of_payment** | **String** | This field is applicable for AFT and OCT transactions.  For list of supported values, please refer to Developer Guide.  | [optional] 
**authorization_options** | [**Ucv1sessionsDataProcessingInformationAuthorizationOptions**](Ucv1sessionsDataProcessingInformationAuthorizationOptions.md) |  | [optional] 
**recurring_options** | [**Ucv1sessionsDataProcessingInformationRecurringOptions**](Ucv1sessionsDataProcessingInformationRecurringOptions.md) |  | [optional] 
**bank_transfer_options** | [**Ucv1sessionsDataProcessingInformationBankTransferOptions**](Ucv1sessionsDataProcessingInformationBankTransferOptions.md) |  | [optional] 
**business_application_id** | **String** | The business application Id&lt;br&gt;&lt;br&gt;  Optional field: This field cannot be configured through the Merchant Experience screens in the Business Center, but if required should be provided on a per‑transaction basis in the uc/v1/sessions API request.  | [optional] 
**commerce_indicator** | **String** | The commerce indicator&lt;br&gt;&lt;br&gt;  Optional field: This field cannot be configured through the Merchant Experience screens in the Business Center, but if required should be provided on a per‑transaction basis in the uc/v1/sessions API request.  | [optional] 
**processing_instruction** | **String** | The processing instruction&lt;br&gt;&lt;br&gt;  Optional field: This field cannot be configured through the Merchant Experience screens in the Business Center, but if required should be provided on a per‑transaction basis in the uc/v1/sessions API request.  | [optional] 


