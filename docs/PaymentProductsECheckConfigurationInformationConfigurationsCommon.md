# CyberSource::PaymentProductsECheckConfigurationInformationConfigurationsCommon

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**processors** | [**Hash&lt;String, PaymentProductsECheckConfigurationInformationConfigurationsCommonProcessors&gt;**](PaymentProductsECheckConfigurationInformationConfigurationsCommonProcessors.md) |  | [optional] 
**internal_only** | [**PaymentProductsECheckConfigurationInformationConfigurationsCommonInternalOnly**](PaymentProductsECheckConfigurationInformationConfigurationsCommonInternalOnly.md) |  | [optional] 
**account_holder_name** | **String** | Mandatory  Name on Merchant&#39;s Bank Account Only ASCII (Hex 20 to Hex 7E)  | 
**account_type** | **String** | Mandatory  Type of account for Merchant&#39;s Bank Account Possible values: - checking - savings - corporatechecking - corporatesavings  | 
**account_routing_number** | **String** | Mandatory  Routing number for Merchant&#39;s Bank Account US Account Routing Number  | 
**account_number** | **String** | Mandatory  Account number for Merchant&#39;s Bank Account  | 


