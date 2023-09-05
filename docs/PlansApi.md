# CyberSource::PlansApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activate_plan**](PlansApi.md#activate_plan) | **POST** /rbs/v1/plans/{id}/activate | Activate a Plan
[**create_plan**](PlansApi.md#create_plan) | **POST** /rbs/v1/plans | Create a Plan
[**deactivate_plan**](PlansApi.md#deactivate_plan) | **POST** /rbs/v1/plans/{id}/deactivate | Deactivate a Plan
[**delete_plan**](PlansApi.md#delete_plan) | **DELETE** /rbs/v1/plans/{id} | Delete a Plan
[**get_plan**](PlansApi.md#get_plan) | **GET** /rbs/v1/plans/{id} | Get a Plan
[**get_plan_code**](PlansApi.md#get_plan_code) | **GET** /rbs/v1/plans/code | Get a Plan Code
[**get_plans**](PlansApi.md#get_plans) | **GET** /rbs/v1/plans | Get a List of Plans
[**update_plan**](PlansApi.md#update_plan) | **PATCH** /rbs/v1/plans/{id} | Update a Plan


# **activate_plan**
> InlineResponse2004 activate_plan(id)

Activate a Plan

Activate a Plan

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PlansApi.new

id = "id_example" # String | Plan Id


begin
  #Activate a Plan
  result = api_instance.activate_plan(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PlansApi->activate_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Plan Id | 

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **create_plan**
> InlineResponse201 create_plan(create_plan_request)

Create a Plan

The recurring billing service enables you to manage payment plans and subscriptions for recurring payment schedules. It securely stores your customer's payment information and personal data within secure Visa data centers, reducing storage risks and PCI DSS scope through the use of *Token Management* (*TMS*).  The three key elements of *Cybersource* Recurring Billing are:  -  **Token**: stores customer billing, shipping, and payment details.  -  **Plan**: stores the billing schedule.  -  **Subscription**: combines the token and plan, and defines the subscription start date, name, and description.  The APIs in this section demonstrate the management of the Plans and Subscriptions. For Tokens please refer to [Token Management](#token-management) 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PlansApi.new

create_plan_request = CyberSource::CreatePlanRequest.new # CreatePlanRequest | 


begin
  #Create a Plan
  result = api_instance.create_plan(create_plan_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PlansApi->create_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_plan_request** | [**CreatePlanRequest**](CreatePlanRequest.md)|  | 

### Return type

[**InlineResponse201**](InlineResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **deactivate_plan**
> InlineResponse2004 deactivate_plan(id)

Deactivate a Plan

Deactivate a Plan

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PlansApi.new

id = "id_example" # String | Plan Id


begin
  #Deactivate a Plan
  result = api_instance.deactivate_plan(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PlansApi->deactivate_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Plan Id | 

### Return type

[**InlineResponse2004**](InlineResponse2004.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **delete_plan**
> InlineResponse2002 delete_plan(id)

Delete a Plan

Delete a Plan is only allowed: - plan status is in `DRAFT` - plan status is in `ACTIVE`, and `INACTIVE` only allowed when no subscriptions attached to a plan in the lifetime of a plan 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PlansApi.new

id = "id_example" # String | Plan Id


begin
  #Delete a Plan
  result = api_instance.delete_plan(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PlansApi->delete_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Plan Id | 

### Return type

[**InlineResponse2002**](InlineResponse2002.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_plan**
> InlineResponse2001 get_plan(id)

Get a Plan

Retrieve a Plan details by Plan Id.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PlansApi.new

id = "id_example" # String | Plan Id


begin
  #Get a Plan
  result = api_instance.get_plan(id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PlansApi->get_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Plan Id | 

### Return type

[**InlineResponse2001**](InlineResponse2001.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_plan_code**
> InlineResponse2005 get_plan_code

Get a Plan Code

Get a Unique Plan Code

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PlansApi.new

begin
  #Get a Plan Code
  result = api_instance.get_plan_code
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PlansApi->get_plan_code: #{e}"
end
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**InlineResponse2005**](InlineResponse2005.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **get_plans**
> InlineResponse200 get_plans(opts)

Get a List of Plans

Retrieve Plans by Plan Code & Plan Status. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PlansApi.new

opts = { 
  offset: 56, # Integer | Page offset number.
  limit: 56, # Integer | Number of items to be returned. Default - `20`, Max - `100` 
  code: "code_example", # String | Filter by Plan Code
  status: "status_example", # String | Filter by Plan Status
  name: "name_example" # String | Filter by Plan Name. (First sub string or full string) **[Not Recommended]** 
}

begin
  #Get a List of Plans
  result = api_instance.get_plans(opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PlansApi->get_plans: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **offset** | **Integer**| Page offset number. | [optional] 
 **limit** | **Integer**| Number of items to be returned. Default - &#x60;20&#x60;, Max - &#x60;100&#x60;  | [optional] 
 **code** | **String**| Filter by Plan Code | [optional] 
 **status** | **String**| Filter by Plan Status | [optional] 
 **name** | **String**| Filter by Plan Name. (First sub string or full string) **[Not Recommended]**  | [optional] 

### Return type

[**InlineResponse200**](InlineResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



# **update_plan**
> InlineResponse2003 update_plan(id, update_plan_request)

Update a Plan

Update a Plan  Plan in `DRAFT` status - All updates are allowed on Plan with `DRAFT` status  Plan in `ACTIVE` status [Following fields are **Not Updatable**] - `planInformation.billingPeriod` - `planInformation.billingCycles` [Update is only allowed to **increase** billingCycles] - `orderInformation.amountDetails.currency` 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PlansApi.new

id = "id_example" # String | Plan Id

update_plan_request = CyberSource::UpdatePlanRequest.new # UpdatePlanRequest | 


begin
  #Update a Plan
  result = api_instance.update_plan(id, update_plan_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PlansApi->update_plan: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **id** | **String**| Plan Id | 
 **update_plan_request** | [**UpdatePlanRequest**](UpdatePlanRequest.md)|  | 

### Return type

[**InlineResponse2003**](InlineResponse2003.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json, application/hal+json, application/json;charset=utf-8, application/hal+json;charset=utf-8



