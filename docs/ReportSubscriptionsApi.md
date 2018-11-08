# CyberSource::ReportSubscriptionsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_subscription**](ReportSubscriptionsApi.md#create_subscription) | **PUT** /reporting/v3/report-subscriptions/{reportName} | Create Report Subscription for a report name by organization
[**delete_subscription**](ReportSubscriptionsApi.md#delete_subscription) | **DELETE** /reporting/v3/report-subscriptions/{reportName} | Delete subscription of a report name by organization
[**get_all_subscriptions**](ReportSubscriptionsApi.md#get_all_subscriptions) | **GET** /reporting/v3/report-subscriptions | Retrieve all subscriptions by organization
[**get_subscription**](ReportSubscriptionsApi.md#get_subscription) | **GET** /reporting/v3/report-subscriptions/{reportName} | Retrieve subscription for a report name by organization


# **create_subscription**
> create_subscription(report_name, request_body)

Create Report Subscription for a report name by organization



### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportSubscriptionsApi.new

report_name = "report_name_example" # String | Name of the Report to Create

request_body = CyberSource::RequestBody.new # RequestBody | Report subscription request payload


begin
  #Create Report Subscription for a report name by organization
  api_instance.create_subscription(report_name, request_body)
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportSubscriptionsApi->create_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_name** | **String**| Name of the Report to Create | 
 **request_body** | [**RequestBody**](RequestBody.md)| Report subscription request payload | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/hal+json



# **delete_subscription**
> delete_subscription(report_name)

Delete subscription of a report name by organization



### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportSubscriptionsApi.new

report_name = "report_name_example" # String | Name of the Report to Delete


begin
  #Delete subscription of a report name by organization
  api_instance.delete_subscription(report_name)
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportSubscriptionsApi->delete_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_name** | **String**| Name of the Report to Delete | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



# **get_all_subscriptions**
> ReportingV3ReportSubscriptionsGet200Response get_all_subscriptions

Retrieve all subscriptions by organization



### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportSubscriptionsApi.new

begin
  #Retrieve all subscriptions by organization
  result = api_instance.get_all_subscriptions
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportSubscriptionsApi->get_all_subscriptions: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**ReportingV3ReportSubscriptionsGet200Response**](ReportingV3ReportSubscriptionsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



# **get_subscription**
> ReportingV3ReportSubscriptionsGet200ResponseSubscriptions get_subscription(report_name)

Retrieve subscription for a report name by organization



### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportSubscriptionsApi.new

report_name = "report_name_example" # String | Name of the Report to Retrieve


begin
  #Retrieve subscription for a report name by organization
  result = api_instance.get_subscription(report_name)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportSubscriptionsApi->get_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **report_name** | **String**| Name of the Report to Retrieve | 

### Return type

[**ReportingV3ReportSubscriptionsGet200ResponseSubscriptions**](ReportingV3ReportSubscriptionsGet200ResponseSubscriptions.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



