# CyberSource::ReportSubscriptionsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**create_standard_or_classic_subscription**](ReportSubscriptionsApi.md#create_standard_or_classic_subscription) | **PUT** /reporting/v3/predefined-report-subscriptions | Create a Standard or Classic Subscription
[**create_subscription**](ReportSubscriptionsApi.md#create_subscription) | **PUT** /reporting/v3/report-subscriptions | Create Report Subscription for a Report Name by Organization
[**delete_subscription**](ReportSubscriptionsApi.md#delete_subscription) | **DELETE** /reporting/v3/report-subscriptions/{reportName} | Delete Subscription of a Report Name by Organization
[**get_all_subscriptions**](ReportSubscriptionsApi.md#get_all_subscriptions) | **GET** /reporting/v3/report-subscriptions | Get All Subscriptions
[**get_subscription**](ReportSubscriptionsApi.md#get_subscription) | **GET** /reporting/v3/report-subscriptions/{reportName} | Get Subscription for Report Name


# **create_standard_or_classic_subscription**
> create_standard_or_classic_subscription(predefined_subscription_request_bean, opts)

Create a Standard or Classic Subscription

Create or update an already existing classic or standard subscription. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportSubscriptionsApi.new

predefined_subscription_request_bean = CyberSource::PredefinedSubscriptionRequestBean.new # PredefinedSubscriptionRequestBean | Report subscription request payload

opts = { 
  organization_id: "organization_id_example" # String | Valid Cybersource Organization Id
}

begin
  #Create a Standard or Classic Subscription
  api_instance.create_standard_or_classic_subscription(predefined_subscription_request_bean, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportSubscriptionsApi->create_standard_or_classic_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **predefined_subscription_request_bean** | [**PredefinedSubscriptionRequestBean**](PredefinedSubscriptionRequestBean.md)| Report subscription request payload | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



# **create_subscription**
> create_subscription(create_report_subscription_request, opts)

Create Report Subscription for a Report Name by Organization

Create a report subscription for your organization. The report name must be unique. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportSubscriptionsApi.new

create_report_subscription_request = CyberSource::CreateReportSubscriptionRequest.new # CreateReportSubscriptionRequest | Report subscription request payload

opts = { 
  organization_id: "organization_id_example" # String | Valid Cybersource Organization Id
}

begin
  #Create Report Subscription for a Report Name by Organization
  api_instance.create_subscription(create_report_subscription_request, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling ReportSubscriptionsApi->create_subscription: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_report_subscription_request** | [**CreateReportSubscriptionRequest**](CreateReportSubscriptionRequest.md)| Report subscription request payload | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/hal+json



# **delete_subscription**
> delete_subscription(report_name)

Delete Subscription of a Report Name by Organization

Delete a report subscription for your organization. You must know the unique name of the report you want to delete. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportSubscriptionsApi.new

report_name = "report_name_example" # String | Name of the Report to Delete


begin
  #Delete Subscription of a Report Name by Organization
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

Get All Subscriptions

View a summary of all report subscriptions. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportSubscriptionsApi.new

begin
  #Get All Subscriptions
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

Get Subscription for Report Name

View the details of a report subscription, such as the report format or report frequency, using the report’s unique name. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReportSubscriptionsApi.new

report_name = "report_name_example" # String | Name of the Report to Retrieve


begin
  #Get Subscription for Report Name
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



