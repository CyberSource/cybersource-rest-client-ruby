# CyberSource::VasV2PaymentsPost201ResponseOrderInformationLineItems

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**tax_details** | [**Array&lt;VasV2PaymentsPost201ResponseOrderInformationTaxDetails&gt;**](VasV2PaymentsPost201ResponseOrderInformationTaxDetails.md) |  | [optional] 
**jurisdiction** | [**Array&lt;VasV2PaymentsPost201ResponseOrderInformationJurisdiction&gt;**](VasV2PaymentsPost201ResponseOrderInformationJurisdiction.md) |  | [optional] 
**exempt_amount** | **String** | Exempt amount for the lineItem. Returned only if the &#x60;taxInformation.showTaxPerLineItem&#x60; field is set to &#x60;Yes&#x60;.  | [optional] 
**taxable_amount** | **String** | Portion of the item amount that is taxable.  | [optional] 
**tax_amount** | **String** | Total tax for the item. This value is the sum of all taxes applied to the item.  | [optional] 


