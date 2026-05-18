# CyberSource::AgenticConfirmTransactionEventsRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**client_correlation_id** | **String** | Client Correlation Id used during the tokenization or during FIDO assertion. | 
**payment_information** | [**Acpv1tokensPaymentInformation**](Acpv1tokensPaymentInformation.md) |  | 
**confirmation_data** | [**Array&lt;Acpv1instructionsinstructionIdconfirmationsConfirmationData&gt;**](Acpv1instructionsinstructionIdconfirmationsConfirmationData.md) | (Required) Contains Transaction, Order and Payment Confirmation Events. | 


