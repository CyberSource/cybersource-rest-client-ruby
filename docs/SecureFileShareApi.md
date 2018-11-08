# CyberSource::SecureFileShareApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_file**](SecureFileShareApi.md#get_file) | **GET** /v1/files/{fileId} | Download a file with file identifier
[**get_file_details**](SecureFileShareApi.md#get_file_details) | **GET** /v1/file-details | Get list of files


# **get_file**
> get_file(file_id, opts)

Download a file with file identifier

Download a file for the given file identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SecureFileShareApi.new

file_id = "file_id_example" # String | Unique identifier for each file

opts = { 
  organization_id: "organization_id_example" # String | Valid Cybersource Organization Id
}

begin
  #Download a file with file identifier
  api_instance.get_file(file_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling SecureFileShareApi->get_file: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **file_id** | **String**| Unique identifier for each file | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/xml, text/csv, application/pdf



# **get_file_details**
> V1FileDetailsGet200Response get_file_details(start_date, end_date, opts)

Get list of files

Get list of files and it's information of them available inside the report directory

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SecureFileShareApi.new

start_date = Date.parse("2013-10-20") # Date | Valid start date in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd 

end_date = Date.parse("2013-10-20") # Date | Valid end date in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd 

opts = { 
  organization_id: "organization_id_example" # String | Valid Cybersource Organization Id
}

begin
  #Get list of files
  result = api_instance.get_file_details(start_date, end_date, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SecureFileShareApi->get_file_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_date** | **Date**| Valid start date in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd  | 
 **end_date** | **Date**| Valid end date in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14   **Example date format:**   - yyyy-MM-dd  | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 

### Return type

[**V1FileDetailsGet200Response**](V1FileDetailsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



