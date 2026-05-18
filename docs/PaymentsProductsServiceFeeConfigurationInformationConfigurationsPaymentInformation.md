# CyberSource::PaymentsProductsServiceFeeConfigurationInformationConfigurationsPaymentInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**payment_type** | **String** | Payment types accepted by this merchant. The supported values are: MASTERDEBIT, MASTERCREDIT, VISACREDIT, VISADEBIT, DISCOVERCREDIT, AMEXCREDIT, ECHECK  Possible values: - MASTERDEBIT - MASTERCREDIT - VISACREDIT - VISADEBIT - DISCOVERCREDIT - AMEXCREDIT - ECHECK | [optional] 
**fee_type** | **String** | Fee type for the selected payment type. Supported values are: Flat or Percentage.   Possible values: - FLAT - PERCENTAGE | [optional] 
**fee_amount** | **Float** | Fee Amount of the selected payment type if you chose Flat fee type.  | [optional] 
**percentage** | **Float** | Percentage of the selected payment type if you chose Percentage Fee type. Supported values use numbers with decimals. For example, 1.0  | [optional] 
**fee_cap** | **Float** | Fee cap for the selected payment type. Supported values use numbers with decimals. For example, 1.0  | [optional] 


