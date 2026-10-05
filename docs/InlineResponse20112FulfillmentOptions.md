# CyberSource::InlineResponse20112FulfillmentOptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique fulfillment option ID. Pass as &#x60;fulfillment_option_id&#x60; to select it. | 
**type** | **String** | Fulfillment method type.  Possible values: - shipping - digital | 
**title** | **String** | Display name for this fulfillment option. | 
**subtitle** | **String** | Additional description (e.g. estimated delivery window). | [optional] 
**carrier** | **String** | Carrier name for shipping options. | [optional] 
**earliest_delivery_time** | **DateTime** | Earliest estimated delivery in RFC 3339 format. | [optional] 
**latest_delivery_time** | **DateTime** | Latest estimated delivery in RFC 3339 format. | [optional] 
**subtotal** | **Integer** | Shipping cost before tax, in minor units. | 
**tax** | **Integer** | Tax on shipping cost, in minor units. | 
**total** | **Integer** | Total shipping cost including tax, in minor units. | 


