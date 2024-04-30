# CyberSource::AsymmetricKeyManagementApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_p12_keys**](AsymmetricKeyManagementApi.md#create_p12_keys) | **POST** /kms/v2/keys-asym | Create one or more PKCS12 keys
[**delete_bulk_p12_keys**](AsymmetricKeyManagementApi.md#delete_bulk_p12_keys) | **POST** /kms/v2/keys-asym/deletes | Delete one or more PKCS12 keys
[**get_p12_key_details**](AsymmetricKeyManagementApi.md#get_p12_key_details) | **GET** /kms/v2/keys-asym/{keyId} | Retrieves PKCS12 key details
[**update_asym_key**](AsymmetricKeyManagementApi.md#update_asym_key) | **PATCH** /kms/v2/keys-asym/{keyId} | Activate or De-activate Asymmetric Key


# **create_p12_keys**
> KmsV2KeysAsymPost201Response create_p12_keys(create_p12_keys_request)

Create one or more PKCS12 keys

'Create one or more PKCS12 keys' 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AsymmetricKeyManagementApi.new

create_p12_keys_request = CyberSource::CreateP12KeysRequest.new # CreateP12KeysRequest | 


begin
  #Create one or more PKCS12 keys
  result = api_instance.create_p12_keys(create_p12_keys_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AsymmetricKeyManagementApi->create_p12_keys: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_p12_keys_request** | [**CreateP12KeysRequest**](CreateP12KeysRequest.md)|  | 

### Return type

[**KmsV2KeysAsymPost201Response**](KmsV2KeysAsymPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **delete_bulk_p12_keys**
> KmsV2KeysAsymDeletesPost200Response delete_bulk_p12_keys(delete_bulk_p12_keys_request)

Delete one or more PKCS12 keys

'Delete one or more PKCS12 keys' 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AsymmetricKeyManagementApi.new

delete_bulk_p12_keys_request = CyberSource::DeleteBulkP12KeysRequest.new # DeleteBulkP12KeysRequest | 


begin
  #Delete one or more PKCS12 keys
  result = api_instance.delete_bulk_p12_keys(delete_bulk_p12_keys_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AsymmetricKeyManagementApi->delete_bulk_p12_keys: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_bulk_p12_keys_request** | [**DeleteBulkP12KeysRequest**](DeleteBulkP12KeysRequest.md)|  | 

### Return type

[**KmsV2KeysAsymDeletesPost200Response**](KmsV2KeysAsymDeletesPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_p12_key_details**
> KmsV2KeysAsymGet200Response get_p12_key_details(key_id)

Retrieves PKCS12 key details

Retrieves keys details by providing the key id.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AsymmetricKeyManagementApi.new

key_id = 'key_id_example' # String | Key ID. 


begin
  #Retrieves PKCS12 key details
  result = api_instance.get_p12_key_details(key_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AsymmetricKeyManagementApi->get_p12_key_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key_id** | **String**| Key ID.  | 

### Return type

[**KmsV2KeysAsymGet200Response**](KmsV2KeysAsymGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_asym_key**
> Object update_asym_key(key_id, update_asym_keys_request)

Activate or De-activate Asymmetric Key

Activate or De-activate Asymmetric Key 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AsymmetricKeyManagementApi.new

key_id = 'key_id_example' # String | Key ID. 

update_asym_keys_request = CyberSource::UpdateAsymKeysRequest.new # UpdateAsymKeysRequest | 


begin
  #Activate or De-activate Asymmetric Key
  result = api_instance.update_asym_key(key_id, update_asym_keys_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AsymmetricKeyManagementApi->update_asym_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key_id** | **String**| Key ID.  | 
 **update_asym_keys_request** | [**UpdateAsymKeysRequest**](UpdateAsymKeysRequest.md)|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



