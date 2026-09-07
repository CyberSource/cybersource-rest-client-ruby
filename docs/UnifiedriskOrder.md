# CyberSource::UnifiedriskOrder

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**total_items_count** | **Integer** | Total number of items in order | [optional] 
**returns_accepted** | **BOOLEAN** | Indicates if returns are accepted | [optional] 
**line_items** | [**Array&lt;UnifiedriskOrderLineItems&gt;**](UnifiedriskOrderLineItems.md) |  | [optional] 
**shipping** | [**UnifiedriskOrderShipping**](UnifiedriskOrderShipping.md) |  | [optional] 
**billing** | [**UnifiedriskOrderBilling**](UnifiedriskOrderBilling.md) |  | [optional] 
**order_id** | **String** | Merchant-assigned unique identifier for this order, used for transaction correlation, dispute matching, and fraud monitoring | [optional] 
**order_description** | **String** | Free-text description of the order contents or purpose, provided by the merchant for risk analysis and dispute management | [optional] 


