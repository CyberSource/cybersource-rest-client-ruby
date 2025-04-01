# CyberSource::CreateNewWebhooksApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**save_sym_egress_key**](CreateNewWebhooksApi.md#save_sym_egress_key) | **POST** /kms/egress/v2/keys-sym | Create Webhook Security Keys


# **save_sym_egress_key**
> InlineResponse2013 save_sym_egress_key(v_c_sender_organization_id, v_c_permissions, opts)

Create Webhook Security Keys

Create security keys that CyberSource will use internally to connect to your servers and validate messages using a digital signature.  Select the CREATE example for CyberSource to generate the key on our server and maintain it for you as well. Remember to save the key in the API response, so that you can use it to validate messages later. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::CreateNewWebhooksApi.new

v_c_sender_organization_id = 'v_c_sender_organization_id_example' # String | Sender organization id

v_c_permissions = 'v_c_permissions_example' # String | Encoded user permissions returned by the CGK, for the entity user who initiated the boarding

opts = { 
  v_c_correlation_id: 'v_c_correlation_id_example', # String | A globally unique id associated with your request
  save_sym_egress_key: CyberSource::SaveSymEgressKey.new # SaveSymEgressKey | Provide egress Symmetric key information to save (create or store or refresh)
}

begin
  #Create Webhook Security Keys
  result = api_instance.save_sym_egress_key(v_c_sender_organization_id, v_c_permissions, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CreateNewWebhooksApi->save_sym_egress_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **v_c_sender_organization_id** | **String**| Sender organization id | 
 **v_c_permissions** | **String**| Encoded user permissions returned by the CGK, for the entity user who initiated the boarding | 
 **v_c_correlation_id** | **String**| A globally unique id associated with your request | [optional] 
 **save_sym_egress_key** | [**SaveSymEgressKey**](SaveSymEgressKey.md)| Provide egress Symmetric key information to save (create or store or refresh) | [optional] 

### Return type

[**InlineResponse2013**](InlineResponse2013.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



