# CyberSource::KeymanagementscmpApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**update_scmp**](KeymanagementscmpApi.md#update_scmp) | **PATCH** /kms/v2/keys-scmp/{keyId} | Update or Deactivate


# **update_scmp**
> Object update_scmp(key_id, update_pgp_keys_request)

Update or Deactivate

Update or Deactivate scmp api Key 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::KeymanagementscmpApi.new

key_id = "key_id_example" # String | Key ID. 

update_pgp_keys_request = CyberSource::UpdatePGPKeysRequest1.new # UpdatePGPKeysRequest1 | 


begin
  #Update or Deactivate
  result = api_instance.update_scmp(key_id, update_pgp_keys_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling KeymanagementscmpApi->update_scmp: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key_id** | **String**| Key ID.  | 
 **update_pgp_keys_request** | [**UpdatePGPKeysRequest1**](UpdatePGPKeysRequest1.md)|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



