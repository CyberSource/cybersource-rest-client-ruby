# CyberSource::UserManagementApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_users**](UserManagementApi.md#get_users) | **GET** /ums/v1/users | Get User Information


# **get_users**
> UmsV1UsersGet200Response get_users(opts)

Get User Information

This endpoint is to get all the user information depending on the filter criteria passed in the query.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::UserManagementApi.new

opts = { 
  organization_id: "organization_id_example", # String | This is the orgId of the organization which the user belongs to.
  user_name: "user_name_example", # String | User ID of the user you want to get details on.
  permission_id: "permission_id_example", # String | permission that you are trying to search user on.
  role_id: "role_id_example" # String | role of the user you are trying to search on.
}

begin
  #Get User Information
  result = api_instance.get_users(opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling UserManagementApi->get_users: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **organization_id** | **String**| This is the orgId of the organization which the user belongs to. | [optional] 
 **user_name** | **String**| User ID of the user you want to get details on. | [optional] 
 **permission_id** | **String**| permission that you are trying to search user on. | [optional] 
 **role_id** | **String**| role of the user you are trying to search on. | [optional] 

### Return type

[**UmsV1UsersGet200Response**](UmsV1UsersGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



