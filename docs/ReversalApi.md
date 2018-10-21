# CyberSource::ReversalApi

All URIs are relative to *https://api.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**auth_reversal**](ReversalApi.md#auth_reversal) | **POST** /v2/payments/{id}/reversals | Process an Authorization Reversal
[**get_auth_reversal**](ReversalApi.md#get_auth_reversal) | **GET** /v2/reversals/{id} | Retrieve an Authorization Reversal


# **auth_reversal**
> InlineResponse2011 auth_reversal(id, auth_reversal_request)

Process an Authorization Reversal

Include the payment ID in the POST request to reverse the payment amount.

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::ReversalApi.new

id = "id_example" # String | The payment ID returned from a previous payment request.

auth_reversal_request = CyberSource::AuthReversalRequest.new # AuthReversalRequest | 


begin
  #Process an Authorization Reversal
  result = api_instance.auth_reversal(id, auth_reversal_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ReversalApi->auth_reversal: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The payment ID returned from a previous payment request. | 
 **auth_reversal_request** | [**AuthReversalRequest**](AuthReversalRequest.md)|  | 

### Return type

[**InlineResponse2011**](InlineResponse2011.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



# **get_auth_reversal**
> InlineResponse2003 get_auth_reversal(id)

Retrieve an Authorization Reversal

Include the authorization reversal ID in the GET request to retrieve the authorization reversal details. 

### Example
```ruby
# load the gem
require 'cyberSource_client'

api_instance = CyberSource::ReversalApi.new

id = "id_example" # String | The authorization reversal ID returned from a previous authorization reversal request.


begin
  #Retrieve an Authorization Reversal
  result = api_instance.get_auth_reversal(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ReversalApi->get_auth_reversal: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| The authorization reversal ID returned from a previous authorization reversal request. | 

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json



