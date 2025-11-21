# CyberSource::MerchantDefinedFieldsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_merchant_defined_field_definition**](MerchantDefinedFieldsApi.md#create_merchant_defined_field_definition) | **POST** /invoicing/v2/{referenceType}/merchantDefinedFields | Create merchant defined field for a given reference type
[**delete_merchant_defined_fields_definitions**](MerchantDefinedFieldsApi.md#delete_merchant_defined_fields_definitions) | **DELETE** /invoicing/v2/{referenceType}/merchantDefinedFields/{id} | Delete a MerchantDefinedField by ID
[**get_merchant_defined_fields_definitions**](MerchantDefinedFieldsApi.md#get_merchant_defined_fields_definitions) | **GET** /invoicing/v2/{referenceType}/merchantDefinedFields | Get all merchant defined fields for a given reference type
[**put_merchant_defined_fields_definitions**](MerchantDefinedFieldsApi.md#put_merchant_defined_fields_definitions) | **PUT** /invoicing/v2/{referenceType}/merchantDefinedFields/{id} | Update a MerchantDefinedField by ID


# **create_merchant_defined_field_definition**
> Array&lt;InlineResponse2003&gt; create_merchant_defined_field_definition(reference_type, merchant_defined_field_definition_request)

Create merchant defined field for a given reference type

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantDefinedFieldsApi.new

reference_type = 'reference_type_example' # String | The reference type for which merchant defined fields are to be fetched. Available values are Invoice, Purchase, Donation

merchant_defined_field_definition_request = CyberSource::MerchantDefinedFieldDefinitionRequest.new # MerchantDefinedFieldDefinitionRequest | 


begin
  #Create merchant defined field for a given reference type
  result = api_instance.create_merchant_defined_field_definition(reference_type, merchant_defined_field_definition_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantDefinedFieldsApi->create_merchant_defined_field_definition: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reference_type** | **String**| The reference type for which merchant defined fields are to be fetched. Available values are Invoice, Purchase, Donation | 
 **merchant_defined_field_definition_request** | [**MerchantDefinedFieldDefinitionRequest**](MerchantDefinedFieldDefinitionRequest.md)|  | 

### Return type

[**Array&lt;InlineResponse2003&gt;**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **delete_merchant_defined_fields_definitions**
> delete_merchant_defined_fields_definitions(reference_type, id)

Delete a MerchantDefinedField by ID

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantDefinedFieldsApi.new

reference_type = 'reference_type_example' # String | 

id = 789 # Integer | 


begin
  #Delete a MerchantDefinedField by ID
  api_instance.delete_merchant_defined_fields_definitions(reference_type, id)
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantDefinedFieldsApi->delete_merchant_defined_fields_definitions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reference_type** | **String**|  | 
 **id** | **Integer**|  | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_merchant_defined_fields_definitions**
> Array&lt;InlineResponse2003&gt; get_merchant_defined_fields_definitions(reference_type)

Get all merchant defined fields for a given reference type

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantDefinedFieldsApi.new

reference_type = 'reference_type_example' # String | The reference type for which merchant defined fields are to be fetched. Available values are Invoice, Purchase, Donation


begin
  #Get all merchant defined fields for a given reference type
  result = api_instance.get_merchant_defined_fields_definitions(reference_type)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantDefinedFieldsApi->get_merchant_defined_fields_definitions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reference_type** | **String**| The reference type for which merchant defined fields are to be fetched. Available values are Invoice, Purchase, Donation | 

### Return type

[**Array&lt;InlineResponse2003&gt;**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **put_merchant_defined_fields_definitions**
> Array&lt;InlineResponse2003&gt; put_merchant_defined_fields_definitions(reference_type, id, merchant_defined_field_core)

Update a MerchantDefinedField by ID

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantDefinedFieldsApi.new

reference_type = 'reference_type_example' # String | 

id = 789 # Integer | 

merchant_defined_field_core = CyberSource::MerchantDefinedFieldCore.new # MerchantDefinedFieldCore | 


begin
  #Update a MerchantDefinedField by ID
  result = api_instance.put_merchant_defined_fields_definitions(reference_type, id, merchant_defined_field_core)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantDefinedFieldsApi->put_merchant_defined_fields_definitions: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **reference_type** | **String**|  | 
 **id** | **Integer**|  | 
 **merchant_defined_field_core** | [**MerchantDefinedFieldCore**](MerchantDefinedFieldCore.md)|  | 

### Return type

[**Array&lt;InlineResponse2003&gt;**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



