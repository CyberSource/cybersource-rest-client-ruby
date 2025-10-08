# CyberSource::DeviceDeAssociationApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_terminal_association**](DeviceDeAssociationApi.md#delete_terminal_association) | **PATCH** /dms/v2/devices/deassociate | De-associate a device from merchant or account V2
[**post_de_associate_v3_terminal**](DeviceDeAssociationApi.md#post_de_associate_v3_terminal) | **POST** /dms/v3/devices/deassociate | De-associate a device from merchant to account or reseller and from account to reseller


# **delete_terminal_association**
> delete_terminal_association(de_association_request_body)

De-associate a device from merchant or account V2

The current association of the device will be removed and will be assigned back to parent in the hierarchy based on internal logic

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DeviceDeAssociationApi.new

de_association_request_body = CyberSource::DeAssociationRequestBody.new # DeAssociationRequestBody | de association of the deviceId in the request body.


begin
  #De-associate a device from merchant or account V2
  api_instance.delete_terminal_association(de_association_request_body)
rescue CyberSource::ApiError => e
  puts "Exception when calling DeviceDeAssociationApi->delete_terminal_association: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **de_association_request_body** | [**DeAssociationRequestBody**](DeAssociationRequestBody.md)| de association of the deviceId in the request body. | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=UTF-8
 - **Accept**: application/hal+json;charset=utf-8



# **post_de_associate_v3_terminal**
> Array&lt;InlineResponse2008&gt; post_de_associate_v3_terminal(device_de_associate_v3_request)

De-associate a device from merchant to account or reseller and from account to reseller

A device will be de-associated from its current organization and moved up in the hierarchy. The device's new position will be determined by a specified destination, either an account or a portfolio. If no destination is provided, the device will default to the currently logged-in user. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DeviceDeAssociationApi.new

device_de_associate_v3_request = [CyberSource::DeviceDeAssociateV3Request.new] # Array<DeviceDeAssociateV3Request> | deviceId that has to be de-associated to the destination organizationId.


begin
  #De-associate a device from merchant to account or reseller and from account to reseller
  result = api_instance.post_de_associate_v3_terminal(device_de_associate_v3_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling DeviceDeAssociationApi->post_de_associate_v3_terminal: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **device_de_associate_v3_request** | [**Array&lt;DeviceDeAssociateV3Request&gt;**](DeviceDeAssociateV3Request.md)| deviceId that has to be de-associated to the destination organizationId. | 

### Return type

[**Array&lt;InlineResponse2008&gt;**](InlineResponse2008.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=UTF-8
 - **Accept**: application/json;charset=UTF-8



