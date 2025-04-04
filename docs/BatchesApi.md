# CyberSource::BatchesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_batch_report**](BatchesApi.md#get_batch_report) | **GET** /accountupdater/v1/batches/{batchId}/report | Retrieve a Batch Report
[**get_batch_status**](BatchesApi.md#get_batch_status) | **GET** /accountupdater/v1/batches/{batchId}/status | Retrieve a Batch Status
[**get_batches_list**](BatchesApi.md#get_batches_list) | **GET** /accountupdater/v1/batches | List Batches
[**post_batch**](BatchesApi.md#post_batch) | **POST** /accountupdater/v1/batches | Create a Batch


# **get_batch_report**
> InlineResponse2004 get_batch_report(batch_id)

Retrieve a Batch Report

**Get Batch Report**<br>This resource accepts a batch id and returns: - The batch status. - The total number of accepted, rejected, updated records. - The total number of card association responses. - The billable quantities of:   - New Account Numbers (NAN)   - New Expiry Dates (NED)   - Account Closures (ACL)   - Contact Card Holders (CCH) - Source record information including token ids, masked card number, expiration dates & card type. - Response record information including response code, reason, token ids, masked card number, expiration dates & card type. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::BatchesApi.new

batch_id = 'batch_id_example' # String | Unique identification number assigned to the submitted request.


begin
  #Retrieve a Batch Report
  result = api_instance.get_batch_report(batch_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling BatchesApi->get_batch_report: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **batch_id** | **String**| Unique identification number assigned to the submitted request. | 

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_batch_status**
> InlineResponse2003 get_batch_status(batch_id)

Retrieve a Batch Status

**Get Batch Status**<br>This resource accepts a batch id and returns: - The batch status. - The total number of accepted, rejected, updated records. - The total number of card association responses. - The billable quantities of:   - New Account Numbers (NAN)   - New Expiry Dates (NED)   - Account Closures (ACL)   - Contact Card Holders (CCH) 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::BatchesApi.new

batch_id = 'batch_id_example' # String | Unique identification number assigned to the submitted request.


begin
  #Retrieve a Batch Status
  result = api_instance.get_batch_status(batch_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling BatchesApi->get_batch_status: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **batch_id** | **String**| Unique identification number assigned to the submitted request. | 

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **get_batches_list**
> InlineResponse2002 get_batches_list(opts)

List Batches

**List Batches**<br>This resource accepts a optional date range, record offset and limit, returning a paginated response of batches containing: - The batch id. - The batch status. - The batch created / modified dates. - The total number of accepted, rejected, updated records. - The total number of card association responses. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::BatchesApi.new

opts = { 
  offset: 0, # Integer | Starting record in zero-based dataset that should be returned as the first object in the array.
  limit: 20, # Integer | The maximum number that can be returned in the array starting from the offset record in zero-based dataset.
  from_date: 'from_date_example', # String | ISO-8601 format: yyyyMMddTHHmmssZ
  to_date: 'to_date_example' # String | ISO-8601 format: yyyyMMddTHHmmssZ
}

begin
  #List Batches
  result = api_instance.get_batches_list(opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling BatchesApi->get_batches_list: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **Integer**| Starting record in zero-based dataset that should be returned as the first object in the array. | [optional] [default to 0]
 **limit** | **Integer**| The maximum number that can be returned in the array starting from the offset record in zero-based dataset. | [optional] [default to 20]
 **from_date** | **String**| ISO-8601 format: yyyyMMddTHHmmssZ | [optional] 
 **to_date** | **String**| ISO-8601 format: yyyyMMddTHHmmssZ | [optional] 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



# **post_batch**
> InlineResponse202 post_batch(body)

Create a Batch

**Create a Batch**<br>This resource accepts TMS tokens ids of a Customer, Payment Instrument or Instrument Identifier. <br> The card numbers for the supplied tokens ids are then sent to the relevant card associations to check for updates.<br>The following type of batches can be submitted: -  **oneOff** batch containing tokens id for Visa or MasterCard card numbers. - **amexRegistration** batch containing tokens id for Amex card numbers.  A batch id will be returned on a successful response which can be used to get the batch status and the batch report. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::BatchesApi.new

body = CyberSource::Body.new # Body | 


begin
  #Create a Batch
  result = api_instance.post_batch(body)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling BatchesApi->post_batch: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **body** | [**Body**](Body.md)|  | 

### Return type

[**InlineResponse202**](InlineResponse202.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



