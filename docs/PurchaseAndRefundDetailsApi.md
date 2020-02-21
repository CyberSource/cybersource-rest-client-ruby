# CyberSource::PurchaseAndRefundDetailsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**get_purchase_and_refund_details**](PurchaseAndRefundDetailsApi.md#get_purchase_and_refund_details) | **GET** /reporting/v3/purchase-refund-details | Get Purchase and Refund Details


# **get_purchase_and_refund_details**
> ReportingV3PurchaseRefundDetailsGet200Response get_purchase_and_refund_details(start_time, end_time, opts)

Get Purchase and Refund Details

Download the Purchase and Refund Details report. This report report includes all purchases and refund transactions, as well as all activities related to transactions resulting in an adjustment to the net proceeds. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PurchaseAndRefundDetailsApi.new

start_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

end_time = DateTime.parse("2013-10-20T19:20:30+01:00") # DateTime | Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd'T'HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z) 

opts = { 
  organization_id: "organization_id_example", # String | Valid Cybersource Organization Id
  payment_subtype: "ALL", # String | Payment Subtypes.   - **ALL**:  All Payment Subtypes   - **VI** :  Visa   - **MC** :  Master Card   - **AX** :  American Express   - **DI** :  Discover   - **DP** :  Pinless Debit 
  view_by: "requestDate", # String | View results by Request Date or Submission Date.   - **requestDate** : Request Date   - **submissionDate**: Submission Date 
  group_name: "group_name_example", # String | Valid CyberSource Group Name.User can define groups using CBAPI and Group Management Module in EBC2. Groups are collection of organizationIds
  offset: 56, # Integer | Offset of the Purchase and Refund Results.
  limit: 2000 # Integer | Results count per page. Range(1-2000)
}

begin
  #Get Purchase and Refund Details
  result = api_instance.get_purchase_and_refund_details(start_time, end_time, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PurchaseAndRefundDetailsApi->get_purchase_and_refund_details: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **start_time** | **DateTime**| Valid report Start Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **end_time** | **DateTime**| Valid report End Time in **ISO 8601 format** Please refer the following link to know more about ISO 8601 format.[Rfc Date Format](https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14)  **Example date format:**   - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZ (e.g. 2018-01-01T00:00:00.000Z)  | 
 **organization_id** | **String**| Valid Cybersource Organization Id | [optional] 
 **payment_subtype** | **String**| Payment Subtypes.   - **ALL**:  All Payment Subtypes   - **VI** :  Visa   - **MC** :  Master Card   - **AX** :  American Express   - **DI** :  Discover   - **DP** :  Pinless Debit  | [optional] [default to ALL]
 **view_by** | **String**| View results by Request Date or Submission Date.   - **requestDate** : Request Date   - **submissionDate**: Submission Date  | [optional] [default to requestDate]
 **group_name** | **String**| Valid CyberSource Group Name.User can define groups using CBAPI and Group Management Module in EBC2. Groups are collection of organizationIds | [optional] 
 **offset** | **Integer**| Offset of the Purchase and Refund Results. | [optional] 
 **limit** | **Integer**| Results count per page. Range(1-2000) | [optional] [default to 2000]

### Return type

[**ReportingV3PurchaseRefundDetailsGet200Response**](ReportingV3PurchaseRefundDetailsGet200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json



