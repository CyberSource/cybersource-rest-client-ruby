# CyberSource::SymmetricKeyManagementApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_v2_shared_secret_keys**](SymmetricKeyManagementApi.md#create_v2_shared_secret_keys) | **POST** /kms/v2/keys-sym | Create Shared-Secret Keys
[**create_v2_shared_secret_keys_verifi**](SymmetricKeyManagementApi.md#create_v2_shared_secret_keys_verifi) | **POST** /kms/v2/keys-sym/verifi | Create Shared-Secret Keys as per verifi spec
[**delete_bulk_symmetric_keys**](SymmetricKeyManagementApi.md#delete_bulk_symmetric_keys) | **POST** /kms/v2/keys-sym/deletes | Delete one or more Symmetric keys
[**get_key_details**](SymmetricKeyManagementApi.md#get_key_details) | **GET** /kms/v2/keys-sym/{keyId} | Retrieves shared secret key details


# **create_v2_shared_secret_keys**
> KmsV2KeysSymPost201Response create_v2_shared_secret_keys(create_shared_secret_keys_request)

Create Shared-Secret Keys

Create one or more Shared-Secret Keys 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SymmetricKeyManagementApi.new

create_shared_secret_keys_request = CyberSource::CreateSharedSecretKeysRequest.new # CreateSharedSecretKeysRequest | 


begin
  #Create Shared-Secret Keys
  result = api_instance.create_v2_shared_secret_keys(create_shared_secret_keys_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SymmetricKeyManagementApi->create_v2_shared_secret_keys: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_shared_secret_keys_request** | [**CreateSharedSecretKeysRequest**](CreateSharedSecretKeysRequest.md)|  | 

### Return type

[**KmsV2KeysSymPost201Response**](KmsV2KeysSymPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **create_v2_shared_secret_keys_verifi**
> KmsV2KeysSymPost201Response create_v2_shared_secret_keys_verifi(v_ic_domain, create_shared_secret_keys_verifi_request)

Create Shared-Secret Keys as per verifi spec

Create one or more Shared-Secret Keys as per Verifi spec with 32 chars, store digest algo during key generation. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SymmetricKeyManagementApi.new

v_ic_domain = 'v_ic_domain_example' # String | domain

create_shared_secret_keys_verifi_request = CyberSource::CreateSharedSecretKeysVerifiRequest.new # CreateSharedSecretKeysVerifiRequest | 


begin
  #Create Shared-Secret Keys as per verifi spec
  result = api_instance.create_v2_shared_secret_keys_verifi(v_ic_domain, create_shared_secret_keys_verifi_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SymmetricKeyManagementApi->create_v2_shared_secret_keys_verifi: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v_ic_domain** | **String**| domain | 
 **create_shared_secret_keys_verifi_request** | [**CreateSharedSecretKeysVerifiRequest**](CreateSharedSecretKeysVerifiRequest.md)|  | 

### Return type

[**KmsV2KeysSymPost201Response**](KmsV2KeysSymPost201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **delete_bulk_symmetric_keys**
> KmsV2KeysSymDeletesPost200Response delete_bulk_symmetric_keys(delete_bulk_symmetric_keys_request)

Delete one or more Symmetric keys

'Delete one or more Symmetric keys' 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SymmetricKeyManagementApi.new

delete_bulk_symmetric_keys_request = CyberSource::DeleteBulkSymmetricKeysRequest.new # DeleteBulkSymmetricKeysRequest | 


begin
  #Delete one or more Symmetric keys
  result = api_instance.delete_bulk_symmetric_keys(delete_bulk_symmetric_keys_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SymmetricKeyManagementApi->delete_bulk_symmetric_keys: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **delete_bulk_symmetric_keys_request** | [**DeleteBulkSymmetricKeysRequest**](DeleteBulkSymmetricKeysRequest.md)|  | 

### Return type

[**KmsV2KeysSymDeletesPost200Response**](KmsV2KeysSymDeletesPost200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_key_details**
> KmsV2KeysSymGet200Response get_key_details(key_id)

Retrieves shared secret key details

Retrieves keys details by providing the key id.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SymmetricKeyManagementApi.new

key_id = 'key_id_example' # String | Key ID. 


begin
  #Retrieves shared secret key details
  result = api_instance.get_key_details(key_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SymmetricKeyManagementApi->get_key_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key_id** | **String**| Key ID.  | 

### Return type

[**KmsV2KeysSymGet200Response**](KmsV2KeysSymGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



