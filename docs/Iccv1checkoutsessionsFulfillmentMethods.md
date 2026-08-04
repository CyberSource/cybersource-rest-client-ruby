# CyberSource::Iccv1checkoutsessionsFulfillmentMethods

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique fulfillment method identifier. | [optional] 
**type** | **String** | Fulfillment method type (e.g. &#x60;shipping&#x60;, &#x60;pickup&#x60;, &#x60;delivery&#x60;). | [optional] 
**line_item_ids** | **Array&lt;String&gt;** | IDs of line items fulfilled by this method. | [optional] 
**destinations** | [**Array&lt;Iccv1checkoutsessionsFulfillmentDestinations&gt;**](Iccv1checkoutsessionsFulfillmentDestinations.md) | Available delivery destinations for this method. | [optional] 
**selected_destination_id** | **String** | ID of the currently selected destination. | [optional] 
**groups** | [**Array&lt;Iccv1checkoutsessionsFulfillmentGroups&gt;**](Iccv1checkoutsessionsFulfillmentGroups.md) | Groups of line items with their associated shipping options. | [optional] 


