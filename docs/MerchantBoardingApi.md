# CyberSource::MerchantBoardingApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_registration**](MerchantBoardingApi.md#get_registration) | **GET** /boarding/v1/registrations/{registrationId} | Gets all the information on a boarding registration
[**post_registration**](MerchantBoardingApi.md#post_registration) | **POST** /boarding/v1/registrations | Create a boarding registration


# **get_registration**
> InlineResponse2002 get_registration(registration_id)

Gets all the information on a boarding registration

This end point will get all information of a boarding registration 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantBoardingApi.new

registration_id = 'registration_id_example' # String | Identifies the boarding registration to be updated


begin
  #Gets all the information on a boarding registration
  result = api_instance.get_registration(registration_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantBoardingApi->get_registration: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **registration_id** | **String**| Identifies the boarding registration to be updated | 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_registration**
> InlineResponse2012 post_registration(post_registration_body, opts)

Create a boarding registration

Boarding Product is specifically for resellers who onboard merchants to resell their services to merchants and help integrate REST API into their systems.  The Boarding API is designed to simplify and streamline the onboarding process of merchants by enabling administrators and developers to: 1. Enable and Configure Products: The API helps in adding new products to an existing organization and configuring them to suit specific needs. 2. Update Merchant Information: The API allows for updating an organization's information efficiently. 3. Manage Payment Integration: It provides templates for secure payment integration and management. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantBoardingApi.new

post_registration_body = CyberSource::PostRegistrationBody.new # PostRegistrationBody | Boarding registration data

opts = { 
  v_c_idempotency_id: 'v_c_idempotency_id_example' # String | defines idempotency of the request
}

begin
  #Create a boarding registration
  result = api_instance.post_registration(post_registration_body, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantBoardingApi->post_registration: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **post_registration_body** | [**PostRegistrationBody**](PostRegistrationBody.md)| Boarding registration data | 
 **v_c_idempotency_id** | **String**| defines idempotency of the request | [optional] 

### Return type

[**InlineResponse2012**](InlineResponse2012.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



