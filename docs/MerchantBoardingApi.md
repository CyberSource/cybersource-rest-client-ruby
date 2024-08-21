# CyberSource::MerchantBoardingApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_registration**](MerchantBoardingApi.md#get_registration) | **GET** /boarding/v1/registrations/{registrationId} | Gets all the information on a boarding registration
[**post_registration**](MerchantBoardingApi.md#post_registration) | **POST** /boarding/v1/registrations | Create a boarding registration


# **get_registration**
> InlineResponse2001 get_registration(registration_id)

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

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



# **post_registration**
> InlineResponse2012 post_registration(post_registration_body, opts)

Create a boarding registration

Create a registration to board merchant  If you have  Card Processing product enabled in your boarding request, select payment processor from Configuration -> Sample Request. You may unselect attributes from the Request Builder tree which you do not need in the request. For VPC, CUP and EFTPOS processors, replace the processor name from VPC or CUP or EFTPOS to the actual processor name in the sample request. e.g. replace VPC with &lt;your vpc processor&gt; 

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



