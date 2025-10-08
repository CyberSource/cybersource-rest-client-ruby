# CyberSource::MerchantDefinedFieldCore

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**field_type** | **String** | Possible values: - text - select | 
**label** | **String** |  | 
**customer_visible** | **BOOLEAN** |  | [optional] [default to false]
**text_min_length** | **Integer** | Should be used only if fieldType &#x3D; \&quot;text\&quot; | [optional] 
**text_max_length** | **Integer** | Should be used only if fieldType &#x3D; \&quot;text\&quot; | [optional] 
**text_default_value** | **String** | Should be used only if fieldType &#x3D; \&quot;text\&quot; | [optional] 
**possible_values** | **String** | Should be mandatory and used only if fieldType &#x3D; \&quot;select\&quot; | [optional] 
**read_only** | **BOOLEAN** |  | [optional] [default to false]
**merchant_defined_data_index** | **Integer** |  | 


