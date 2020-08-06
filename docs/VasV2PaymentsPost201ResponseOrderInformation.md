# CyberSource::VasV2PaymentsPost201ResponseOrderInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**exempt_amount** | **String** | Total amount of tax exempt amounts. This value is the sum of the values for all the &#x60;orderInformation.lineItems[].exemptAmount&#x60; fields in the tax calculation request.  | [optional] 
**taxable_amount** | **String** | Total amount of all taxable amounts. This value is the sum of the values for all the &#x60;orderInformation.lineItems[].taxAmount&#x60; fields in the tax calculation request.  | [optional] 
**tax_amount** | **String** | Total amount of tax for all lineItems in the tax calculation request.  | [optional] 
**line_items** | [**Array&lt;VasV2PaymentsPost201ResponseOrderInformationLineItems&gt;**](VasV2PaymentsPost201ResponseOrderInformationLineItems.md) |  | [optional] 
**tax_details** | [**Array&lt;VasV2PaymentsPost201ResponseOrderInformationTaxDetails&gt;**](VasV2PaymentsPost201ResponseOrderInformationTaxDetails.md) |  | [optional] 
**amount_details** | [**Ptsv2paymentsidreversalsReversalInformationAmountDetails**](Ptsv2paymentsidreversalsReversalInformationAmountDetails.md) |  | [optional] 


