# CyberSource::CreditApi

All URIs are relative to *https://api.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_credit**](CreditApi.md#create_credit) | **POST** /v2/credits/ | Process a Credit
[**get_credit**](CreditApi.md#get_credit) | **GET** /v2/credits/{id} | Retrieve a Credit


# **create_credit**
> InlineResponse2014 create_credit(create_credit_request)

Process a Credit

POST to the credit resource to credit funds to a specified credit card.

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::CreditApi.new

create_credit_request = CyberSource::CreateCreditRequest.new # CreateCreditRequest | 


begin
  #Process a Credit
  result = api_instance.create_credit(create_credit_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CreditApi->create_credit: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_credit_request** | [**CreateCreditRequest**](CreateCreditRequest.md)|  | 

### Return type

[**InlineResponse2014**](InlineResponse2014.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_credit**
> InlineResponse2006 get_credit(id)

Retrieve a Credit

Include the credit ID in the GET request to return details of the credit.

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::CreditApi.new

id = "id_example" # String | The credit ID returned from a previous stand-alone credit request. 


begin
  #Retrieve a Credit
  result = api_instance.get_credit(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling CreditApi->get_credit: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The credit ID returned from a previous stand-alone credit request.  | 

### Return type

[**InlineResponse2006**](InlineResponse2006.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



