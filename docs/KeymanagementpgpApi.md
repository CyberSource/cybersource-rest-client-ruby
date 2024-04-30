# CyberSource::KeyManagementPgpApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**update_pgp**](KeyManagementPgpApi.md#update_pgp) | **PATCH** /kms/v2/keys-pgp/{keyId} | Activate or De-activate PGP Key


# **update_pgp**
> Object update_pgp(key_id, update_pgp_keys_request)

Activate or De-activate PGP Key

Activate or De-activate PGP Key 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::KeyManagementPgpApi.new

key_id = 'key_id_example' # String | Key ID. 

update_pgp_keys_request = CyberSource::UpdatePGPKeysRequest.new # UpdatePGPKeysRequest | 


begin
  #Activate or De-activate PGP Key
  result = api_instance.update_pgp(key_id, update_pgp_keys_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling KeyManagementPgpApi->update_pgp: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key_id** | **String**| Key ID.  | 
 **update_pgp_keys_request** | [**UpdatePGPKeysRequest**](UpdatePGPKeysRequest.md)|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



