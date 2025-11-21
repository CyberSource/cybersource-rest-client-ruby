# CyberSource::PatchCustomerPaymentInstrumentRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_links** | [**Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentLinks**](Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentLinks.md) |  | [optional] 
**id** | **String** | The Id of the Payment Instrument Token. | [optional] 
**object** | **String** | The type.  Possible Values: - paymentInstrument  | [optional] 
**default** | **BOOLEAN** | Flag that indicates whether customer payment instrument is the dafault. Possible Values:  - &#x60;true&#x60;: Payment instrument is customer&#39;s default.  - &#x60;false&#x60;: Payment instrument is not customer&#39;s default.  | [optional] 
**state** | **String** | Issuers state for the card number. Possible Values: - ACTIVE - CLOSED : The account has been closed.  | [optional] 
**type** | **String** | The type of Payment Instrument. Possible Values: - cardHash  | [optional] 
**bank_account** | [**Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentBankAccount**](Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentBankAccount.md) |  | [optional] 
**card** | [**Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentCard**](Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentCard.md) |  | [optional] 
**buyer_information** | [**Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentBuyerInformation**](Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentBuyerInformation.md) |  | [optional] 
**bill_to** | [**Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentBillTo**](Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentBillTo.md) |  | [optional] 
**processing_information** | [**TmsPaymentInstrumentProcessingInfo**](TmsPaymentInstrumentProcessingInfo.md) |  | [optional] 
**merchant_information** | [**TmsMerchantInformation**](TmsMerchantInformation.md) |  | [optional] 
**instrument_identifier** | [**Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentInstrumentIdentifier**](Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentInstrumentIdentifier.md) |  | [optional] 
**metadata** | [**Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentMetadata**](Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentMetadata.md) |  | [optional] 
**_embedded** | [**Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentEmbedded**](Tmsv2tokenizeTokenInformationCustomerEmbeddedDefaultPaymentInstrumentEmbedded.md) |  | [optional] 


