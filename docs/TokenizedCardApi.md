# CyberSource::TokenizedCardApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**delete_tokenized_card**](TokenizedCardApi.md#delete_tokenized_card) | **DELETE** /tms/v2/tokenized-cards/{tokenizedCardId} | Delete a Tokenized Card
[**get_tokenized_card**](TokenizedCardApi.md#get_tokenized_card) | **GET** /tms/v2/tokenized-cards/{tokenizedCardId} | Retrieve a Tokenized Card
[**post_tokenized_card**](TokenizedCardApi.md#post_tokenized_card) | **POST** /tms/v2/tokenized-cards | Create a Tokenized Card


# **delete_tokenized_card**
> delete_tokenized_card(tokenized_card_id, opts)

Delete a Tokenized Card

|  |  |  | | --- | --- | --- | | The Network Token will attempt to be deleted from the card association and if successful the corresponding TMS Network Token will be deleted. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TokenizedCardApi.new

tokenized_card_id = 'tokenized_card_id_example' # String | The Id of a tokenized card.

opts = { 
  profile_id: 'profile_id_example' # String | The Id of a profile containing user specific TMS configuration.
}

begin
  #Delete a Tokenized Card
  api_instance.delete_tokenized_card(tokenized_card_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling TokenizedCardApi->delete_tokenized_card: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenized_card_id** | **String**| The Id of a tokenized card. | 
 **profile_id** | **String**| The Id of a profile containing user specific TMS configuration. | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_tokenized_card**
> TokenizedcardRequest get_tokenized_card(tokenized_card_id, opts)

Retrieve a Tokenized Card

|  |  |  | | --- | --- | --- | |**Tokenized Cards**<br>A Tokenized Card represents a network token. Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TokenizedCardApi.new

tokenized_card_id = 'tokenized_card_id_example' # String | The Id of a tokenized card.

opts = { 
  profile_id: 'profile_id_example' # String | The Id of a profile containing user specific TMS configuration.
}

begin
  #Retrieve a Tokenized Card
  result = api_instance.get_tokenized_card(tokenized_card_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TokenizedCardApi->get_tokenized_card: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenized_card_id** | **String**| The Id of a tokenized card. | 
 **profile_id** | **String**| The Id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**TokenizedcardRequest**](TokenizedcardRequest.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_tokenized_card**
> TokenizedcardRequest post_tokenized_card(tokenizedcard_request, opts)

Create a Tokenized Card

|  |  |  | | --- | --- | --- | |**Tokenized cards**<br>A Tokenized card represents a network token. Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TokenizedCardApi.new

tokenizedcard_request = CyberSource::TokenizedcardRequest.new # TokenizedcardRequest | 

opts = { 
  profile_id: 'profile_id_example' # String | The Id of a profile containing user specific TMS configuration.
}

begin
  #Create a Tokenized Card
  result = api_instance.post_tokenized_card(tokenizedcard_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TokenizedCardApi->post_tokenized_card: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **tokenizedcard_request** | [**TokenizedcardRequest**](TokenizedcardRequest.md)|  | 
 **profile_id** | **String**| The Id of a profile containing user specific TMS configuration. | [optional] 

### Return type

[**TokenizedcardRequest**](TokenizedcardRequest.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



