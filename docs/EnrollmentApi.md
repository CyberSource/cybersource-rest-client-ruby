# CyberSource::EnrollmentApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**enroll_card**](EnrollmentApi.md#enroll_card) | **POST** /acp/v1/tokens | Enroll a card


# **enroll_card**
> AgenticCardEnrollmentResponse200 enroll_card(agentic_card_enrollment_request)

Enroll a card

Enroll a payment card for agentic or e-commerce transactions. This is typically the first step in the Intelligent Commerce payment lifecycle — the agent calls this endpoint to register a consumer's card, creating a tokenized reference that can be used in subsequent purchase instructions and payment credential retrieval. Requires device information, consumer identity, billing details, and payment instrument references. Returns a status of ACTIVE (HTTP 200) if enrollment completes immediately, or PENDING (HTTP 202) with pendingEvents if cardholder authentication is required. Call this endpoint when a consumer wants to add a new payment card or when setting up a card for agentic payment flows.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::EnrollmentApi.new

agentic_card_enrollment_request = CyberSource::AgenticCardEnrollmentRequest.new # AgenticCardEnrollmentRequest | 


begin
  #Enroll a card
  result = api_instance.enroll_card(agentic_card_enrollment_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling EnrollmentApi->enroll_card: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agentic_card_enrollment_request** | [**AgenticCardEnrollmentRequest**](AgenticCardEnrollmentRequest.md)|  | 

### Return type

[**AgenticCardEnrollmentResponse200**](AgenticCardEnrollmentResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



