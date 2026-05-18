# CyberSource::SecureFileShareApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_file**](SecureFileShareApi.md#get_file) | **GET** /sfs/v1/files/{fileId} | Download a File with File Identifier
[**get_file_detail**](SecureFileShareApi.md#get_file_detail) | **GET** /sfs/v1/file-details | Get List of Files


# **get_file**
> get_file(file_id, opts)

Download a File with File Identifier

Download a file for the given file identifier

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SecureFileShareApi.new

file_id = 'file_id_example' # String | Unique identifier for each file

opts = { 
  organization_id: 'organization_id_example' # String | Valid Cybersource Organization Id
}

begin
  #Download a File with File Identifier
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

 - **Content-Type**: */*;charset=utf-8
 - **Accept**: application/xml, text/csv, application/pdf



# **get_file_detail**
> V1FileDetailsGet200Response get_file_detail(start_date, end_date, opts)

Get List of Files

Get list of files and it's information of them available inside the report directory

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::SecureFileShareApi.new

start_date = Date.parse('2013-10-20') # Date | Valid start date in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)   **Example date format:**   - yyyy-MM-dd 

end_date = Date.parse('2013-10-20') # Date | Valid end date in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)   **Example date format:**   - yyyy-MM-dd 

opts = { 
  organization_id: 'organization_id_example', # String | Valid Cybersource Organization Id
  name: 'name_example' # String | **Tailored to searches for specific files with in given Date range** example : MyTransactionDetailreport.xml 
}

begin
  #Get List of Files
  result = api_instance.get_file_detail(start_date, end_date, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling SecureFileShareApi->get_file_detail: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_date** | **Date**| Valid start date in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)   **Example date format:**   - yyyy-MM-dd  | 
 **end_date** | **Date**| Valid end date in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)   **Example date format:**   - yyyy-MM-dd  | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 
 **name** | **String**| **Tailored to searches for specific files with in given Date range** example : MyTransactionDetailreport.xml  | [optional] 

### Return type

[**V1FileDetailsGet200Response**](V1FileDetailsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: */*;charset=utf-8
 - **Accept**: application/hal+json



