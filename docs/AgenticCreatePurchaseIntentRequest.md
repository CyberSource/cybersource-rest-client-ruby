# CyberSource::AgenticCreatePurchaseIntentRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**client_correlation_id** | **String** | Client Correlation Id used during the tokenization or during FIDO assertion. | 
**payment_information** | [**Acpv1tokensPaymentInformation**](Acpv1tokensPaymentInformation.md) |  | 
**device_information** | [**Acpv1tokensDeviceInformation**](Acpv1tokensDeviceInformation.md) |  | 
**assurance_data** | [**Array&lt;Acpv1tokensAssuranceData&gt;**](Acpv1tokensAssuranceData.md) | Assurance data. | 
**mandates** | [**Array&lt;Acpv1instructionsMandates&gt;**](Acpv1instructionsMandates.md) | Mandate data. | 
**buyer_information** | [**Acpv1tokensBuyerInformation**](Acpv1tokensBuyerInformation.md) |  | [optional] 
**is_recurring** | **BOOLEAN** | Indicates whether the transaction is recurring. Default value is false. | [optional] 
**consumer_prompt** | **String** | Recap - A summary or condensed version of user prompts that leads to the purchase. | [optional] 


