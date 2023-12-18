# CyberSource::PaymentsProductsCardProcessingConfigurationInformationConfigurationsFeaturesCardPresent

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**processors** | [**Hash&lt;String, PaymentsProductsCardProcessingConfigurationInformationConfigurationsFeaturesCardPresentProcessors&gt;**](PaymentsProductsCardProcessingConfigurationInformationConfigurationsFeaturesCardPresentProcessors.md) | e.g. * amexdirect * barclays2 * CUP * EFTPOS * fdiglobal * gpx * smartfdc * tsys * vero * VPC  For VPC, CUP and EFTPOS processors, replace the processor name from VPC or CUP or EFTPOS to the actual processor name in the sample request. e.g. replace VPC with &amp;lt;your vpc processor&amp;gt;  | [optional] 
**enable_terminal_id_lookup** | **BOOLEAN** | Used for Card Present and Virtual Terminal Transactions for Terminal ID lookup. Applicable for GPX (gpx) processor. | [optional] 


