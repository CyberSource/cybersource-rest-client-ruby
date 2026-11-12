# CyberSource::RefreshPaymentStatusResponseOrderInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reference_id** | **String** | Merchant-generated order reference or tracking number for the payment.  | [optional] 
**description** | **String** | Description of the order, as provided by the merchant in the original request.  | [optional] 
**custom_id** | **String** | Merchant-defined custom identifier for the order.  | [optional] 
**merchant_descriptor** | [**RefreshPaymentStatusResponseOrderInformationMerchantDescriptor**](RefreshPaymentStatusResponseOrderInformationMerchantDescriptor.md) |  | [optional] 
**bill_to** | [**RefreshPaymentStatusResponseOrderInformationBillTo**](RefreshPaymentStatusResponseOrderInformationBillTo.md) |  | [optional] 
**ship_to** | [**RefreshPaymentStatusResponseOrderInformationShipTo**](RefreshPaymentStatusResponseOrderInformationShipTo.md) |  | [optional] 
**amount_details** | [**RefreshPaymentStatusResponseOrderInformationAmountDetails**](RefreshPaymentStatusResponseOrderInformationAmountDetails.md) |  | [optional] 


