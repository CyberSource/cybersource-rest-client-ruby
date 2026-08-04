# CyberSource::TransactionRiskLabelingApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**submit_labels**](TransactionRiskLabelingApi.md#submit_labels) | **POST** /unifiedrisk | Transaction Risk Labeling


# **submit_labels**
> InlineResponse2013 submit_labels(label_request)

Transaction Risk Labeling

The Labels endpoint enables clients to submit post-transaction feedback, including both the decision made on the transaction  (such as accept or reject) and the final outcome (such as confirmed fraud, valid, or suspected).  Consistent label submission is critical to achieving optimal model performance, as it directly drives model accuracy, tuning,  and the quality of client‑specific insights over time

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::TransactionRiskLabelingApi.new

label_request = CyberSource::LabelRequest.new # LabelRequest | Label submission request


begin
  #Transaction Risk Labeling
  result = api_instance.submit_labels(label_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling TransactionRiskLabelingApi->submit_labels: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **label_request** | [**LabelRequest**](LabelRequest.md)| Label submission request | 

### Return type

[**InlineResponse2013**](InlineResponse2013.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json



