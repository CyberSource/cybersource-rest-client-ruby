# CyberSource::KeymanagementpasswordApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**update_password**](KeymanagementpasswordApi.md#update_password) | **PATCH** /kms/v2/keys-password/{keyId} | Activate or De-activate Password


# **update_password**
> Object update_password(key_id, update_password_keys_request)

Activate or De-activate Password

Activate or De-activate key of type password 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::KeymanagementpasswordApi.new

key_id = "key_id_example" # String | Key ID. 

update_password_keys_request = CyberSource::UpdatePasswordKeysRequest.new # UpdatePasswordKeysRequest | 


begin
  #Activate or De-activate Password
  result = api_instance.update_password(key_id, update_password_keys_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling KeymanagementpasswordApi->update_password: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **key_id** | **String**| Key ID.  | 
 **update_password_keys_request** | [**UpdatePasswordKeysRequest**](UpdatePasswordKeysRequest.md)|  | 

### Return type

**Object**

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



