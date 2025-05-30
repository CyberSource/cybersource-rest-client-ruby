# CyberSource::DeviceDeAssociationV3Api

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**post_de_associate_v3_terminal**](DeviceDeAssociationV3Api.md#post_de_associate_v3_terminal) | **POST** /dms/v3/devices/deassociate | De-associate a device from merchant to account or reseller and from account to reseller V3


# **post_de_associate_v3_terminal**
> Array&lt;InlineResponse2005&gt; post_de_associate_v3_terminal(device_de_associate_v3_request)

De-associate a device from merchant to account or reseller and from account to reseller V3

A device will be de-associated from its current organization and moved up in the hierarchy. The device's new position will be determined by a specified destination, either an account or a portfolio. If no destination is provided, the device will default to the currently logged-in user. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::DeviceDeAssociationV3Api.new

device_de_associate_v3_request = [CyberSource::DeviceDeAssociateV3Request.new] # Array<DeviceDeAssociateV3Request> | deviceId that has to be de-associated to the destination organizationId.


begin
  #De-associate a device from merchant to account or reseller and from account to reseller V3
  result = api_instance.post_de_associate_v3_terminal(device_de_associate_v3_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling DeviceDeAssociationV3Api->post_de_associate_v3_terminal: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **device_de_associate_v3_request** | [**Array&lt;DeviceDeAssociateV3Request&gt;**](DeviceDeAssociateV3Request.md)| deviceId that has to be de-associated to the destination organizationId. | 

### Return type

[**Array&lt;InlineResponse2005&gt;**](InlineResponse2005.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=UTF-8
 - **Accept**: application/json;charset=UTF-8



