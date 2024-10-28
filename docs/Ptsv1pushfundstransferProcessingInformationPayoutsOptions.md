# CyberSource::Ptsv1pushfundstransferProcessingInformationPayoutsOptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**source_currency** | **String** | Use a 3-character alpha currency code for source currency of the funds transfer.  Required if sending processingInformation.payoutsOptions.sourceAmount.  ISO standard currencies: http://apps.cybersource.com/library/documentation/sbc/quickref/currencies.pdf  | [optional] 
**destination_currency** | **String** | Use a 3-character alpha currency code for destination currency of the funds transfer.  Yellow Pepper  Supported for cross border funds transfers.  ISO standard currencies: http://apps.cybersource.com/library/documentation/sbc/quickref/currencies.pdf  | [optional] 
**source_amount** | **String** | Source Amount is required in certain markets to identify the transaction amount entered in the sender&#39;s currency code prior to FX conversion by the originating entity.  Format:  Minimum Value: 0  Maximum value: 999999999.99  Allowed fractional digits: 2  | [optional] 
**retrieval_reference_number** | **String** | Unique reference number returned by the processor that identifies the transaction at the network.  | [optional] 
**account_funding_reference_id** | **String** | Visa-generated transaction identifier (TID) that is unique for each original authorization and financial request.  | [optional] 


