# CyberSource::InlineResponse20019GoogleMerchantProducts

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**item_id** | **String** | Product item ID. | [optional] 
**title** | **String** | Product title. | [optional] 
**ucp_valid** | **BOOLEAN** | Whether the product passed UCP validation. | [optional] 
**ucp_errors** | **Array&lt;String&gt;** | UCP validation errors (empty if ucpValid is true). | [optional] 
**google_upload_status** | **String** | Google upload status for this product.   Possible values: - UPLOADED - SKIPPED - FAILED | [optional] 
**google_resource_name** | **String** | Google Merchant resource name assigned after upload. | [optional] 
**google_error** | **String** | Error message from Google if upload failed. Null on success. | [optional] 


