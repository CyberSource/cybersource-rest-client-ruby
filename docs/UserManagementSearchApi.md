# CyberSource::UserManagementSearchApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**search_users**](UserManagementSearchApi.md#search_users) | **POST** /ums/v1/users/search | Search User Information


# **search_users**
> UmsV1UsersGet200Response search_users(search_request)

Search User Information

This endpoint is to get all the user information depending on the filter criteria passed in request body.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::UserManagementSearchApi.new

search_request = CyberSource::SearchRequest.new # SearchRequest | 


begin
  #Search User Information
  result = api_instance.search_users(search_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling UserManagementSearchApi->search_users: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **search_request** | [**SearchRequest**](SearchRequest.md)|  | 

### Return type

[**UmsV1UsersGet200Response**](UmsV1UsersGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/hal+json;charset=utf-8



