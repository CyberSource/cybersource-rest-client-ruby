# CyberSource::Acpv1instructionsinstructionIdconfirmationsOrderInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**order_id** | **String** | Unique identifier for the order | [optional] 
**order_status** | **String** | Status of the order | [optional] 
**order_date** | **String** | Order date (UTC time in Epoch format) | [optional] 
**expected_delivery_date** | **String** | Expected delivery date for the order (UTC time in Epoch format) | [optional] 
**amount_detail** | [**Acpv1instructionsinstructionIdcredentialsOrderInformationAmountDetail**](Acpv1instructionsinstructionIdcredentialsOrderInformationAmountDetail.md) |  | [optional] 
**ship_to** | [**Acpv1instructionsinstructionIdcredentialsOrderInformationShipTo**](Acpv1instructionsinstructionIdcredentialsOrderInformationShipTo.md) |  | [optional] 
**shipping_details** | [**Acpv1instructionsinstructionIdconfirmationsOrderInformationShippingDetails**](Acpv1instructionsinstructionIdconfirmationsOrderInformationShippingDetails.md) |  | [optional] 
**tracking_id** | **String** | Tracking ID for the shipment | [optional] 
**carrier** | **String** | Shipping carrier or provider | [optional] 
**line_items** | [**Array&lt;Acpv1instructionsinstructionIdcredentialsOrderInformationLineItems&gt;**](Acpv1instructionsinstructionIdcredentialsOrderInformationLineItems.md) |  | [optional] 


