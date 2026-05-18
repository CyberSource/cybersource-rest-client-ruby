# CyberSource::TmsBusinessInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Name of the network token merchant. | [optional] 
**doing_business_as** | **String** | Name the network token merchant does business as | [optional] 
**address** | [**TmsBusinessInformationAddress**](TmsBusinessInformationAddress.md) |  | [optional] 
**website_url** | **String** | Website of network token merchant. | [optional] 
**business_identification_type** | **String** | The Identifier associated with the business type; required unless both acquirerId and acquirerMerchantId are provided.  | [optional] 
**business_identification_value** | **String** | The value associated with the business identifier type; required unless both acquirerId and acquirerMerchantId are provided.  | [optional] 
**acquirer** | [**TmsBusinessInformationAcquirer**](TmsBusinessInformationAcquirer.md) |  | [optional] 


