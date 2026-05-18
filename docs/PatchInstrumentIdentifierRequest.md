# CyberSource::PatchInstrumentIdentifierRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_links** | [**TmsEmbeddedInstrumentIdentifierLinks**](TmsEmbeddedInstrumentIdentifierLinks.md) |  | [optional] 
**id** | **String** | The Id of the Instrument Identifier Token.  | [optional] 
**object** | **String** | The type.  Possible Values: - instrumentIdentifier  | [optional] 
**state** | **String** | Issuers state for the card number. Possible Values: - ACTIVE - CLOSED : The account has been closed.  | [optional] 
**type** | **String** | The type of Instrument Identifier. Possible Values: - enrollable card - enrollable token  | [optional] 
**source** | **String** | Source of the card details. Possible Values: - CONTACTLESS_TAP  | [optional] 
**token_provisioning_information** | [**Ptsv2paymentsTokenInformationTokenProvisioningInformation**](Ptsv2paymentsTokenInformationTokenProvisioningInformation.md) |  | [optional] 
**card** | [**TmsEmbeddedInstrumentIdentifierCard**](TmsEmbeddedInstrumentIdentifierCard.md) |  | [optional] 
**point_of_sale_information** | [**TmsEmbeddedInstrumentIdentifierPointOfSaleInformation**](TmsEmbeddedInstrumentIdentifierPointOfSaleInformation.md) |  | [optional] 
**bank_account** | [**TmsEmbeddedInstrumentIdentifierBankAccount**](TmsEmbeddedInstrumentIdentifierBankAccount.md) |  | [optional] 
**tokenized_card** | [**Tmsv2TokenizedCard**](Tmsv2TokenizedCard.md) |  | [optional] 
**issuer** | [**TmsEmbeddedInstrumentIdentifierIssuer**](TmsEmbeddedInstrumentIdentifierIssuer.md) |  | [optional] 
**processing_information** | [**TmsEmbeddedInstrumentIdentifierProcessingInformation**](TmsEmbeddedInstrumentIdentifierProcessingInformation.md) |  | [optional] 
**bill_to** | [**TmsEmbeddedInstrumentIdentifierBillTo**](TmsEmbeddedInstrumentIdentifierBillTo.md) |  | [optional] 
**metadata** | [**TmsEmbeddedInstrumentIdentifierMetadata**](TmsEmbeddedInstrumentIdentifierMetadata.md) |  | [optional] 
**_embedded** | [**TmsEmbeddedInstrumentIdentifierEmbedded**](TmsEmbeddedInstrumentIdentifierEmbedded.md) |  | [optional] 


