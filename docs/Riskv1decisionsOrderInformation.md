# CyberSource::Riskv1decisionsOrderInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**amount_details** | [**Riskv1decisionsOrderInformationAmountDetails**](Riskv1decisionsOrderInformationAmountDetails.md) |  | [optional] 
**shipping_details** | [**Riskv1decisionsOrderInformationShippingDetails**](Riskv1decisionsOrderInformationShippingDetails.md) |  | [optional] 
**ship_to** | [**Riskv1decisionsOrderInformationShipTo**](Riskv1decisionsOrderInformationShipTo.md) |  | [optional] 
**returns_accepted** | **String** | Boolean that indicates whether returns are accepted for this order. This field can contain one of the following values: - &#x60;yes&#x60;: Returns are accepted for this order. - &#x60;no&#x60;: Returns are not accepted for this order.  | [optional] 
**line_items** | [**Array&lt;Riskv1decisionsOrderInformationLineItems&gt;**](Riskv1decisionsOrderInformationLineItems.md) | This array contains detailed information about individual products in the order. | [optional] 
**bill_to** | [**Riskv1decisionsOrderInformationBillTo**](Riskv1decisionsOrderInformationBillTo.md) |  | [optional] 


