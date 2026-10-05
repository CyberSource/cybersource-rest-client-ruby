# CyberSource::PaymentEventsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**confirm_transaction_events**](PaymentEventsApi.md#confirm_transaction_events) | **POST** /icc/v1/instructions/{instructionId}/confirmations | Confirm transaction events
[**retrieve_payment_credentials**](PaymentEventsApi.md#retrieve_payment_credentials) | **POST** /icc/v1/instructions/{instructionId}/credentials | Retrieve payment credentials


# **confirm_transaction_events**
> AgenticConfirmTransactionEventsResponse202 confirm_transaction_events(instruction_id, agentic_confirm_transaction_events_request)

Confirm transaction events

Confirm transaction events for a completed purchase. The agent calls this endpoint after the payment has been submitted to notify the Intelligent Commerce Connect of the transaction outcome. The request includes processor information (transaction type, status, approval codes), order details (shipping, tracking, product information), and merchant information. Returns HTTP 202 acknowledging receipt of the confirmation.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentEventsApi.new

instruction_id = 'instruction_id_example' # String | Unique identifier for the purchase intent instruction.

agentic_confirm_transaction_events_request = CyberSource::AgenticConfirmTransactionEventsRequest.new # AgenticConfirmTransactionEventsRequest | 


begin
  #Confirm transaction events
  result = api_instance.confirm_transaction_events(instruction_id, agentic_confirm_transaction_events_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentEventsApi->confirm_transaction_events: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instruction_id** | **String**| Unique identifier for the purchase intent instruction. | 
 **agentic_confirm_transaction_events_request** | [**AgenticConfirmTransactionEventsRequest**](AgenticConfirmTransactionEventsRequest.md)|  | 

### Return type

[**AgenticConfirmTransactionEventsResponse202**](AgenticConfirmTransactionEventsResponse202.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **retrieve_payment_credentials**
> AgenticRetrievePaymentCredentialsResponse200 retrieve_payment_credentials(instruction_id, agentic_retrieve_payment_credentials_request)

Retrieve payment credentials

Retrieve tokenized payment credentials for a purchase intent to complete the transaction at a merchant. The agent calls this endpoint after a purchase intent has been created and approved, providing transaction-level details including order information, merchant details, payment options, and production information. Returns COMPLETED (HTTP 200) with a signed payload containing encrypted payment credentials (authorization token and JWS-signed payload), or PENDING (HTTP 202) with pendingEvents if additional cardholder authentication is required. The signed payload is used by the merchant's payment processor to complete the transaction.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::PaymentEventsApi.new

instruction_id = 'instruction_id_example' # String | Unique identifier for the purchase intent instruction.

agentic_retrieve_payment_credentials_request = CyberSource::AgenticRetrievePaymentCredentialsRequest.new # AgenticRetrievePaymentCredentialsRequest | 


begin
  #Retrieve payment credentials
  result = api_instance.retrieve_payment_credentials(instruction_id, agentic_retrieve_payment_credentials_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling PaymentEventsApi->retrieve_payment_credentials: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instruction_id** | **String**| Unique identifier for the purchase intent instruction. | 
 **agentic_retrieve_payment_credentials_request** | [**AgenticRetrievePaymentCredentialsRequest**](AgenticRetrievePaymentCredentialsRequest.md)|  | 

### Return type

[**AgenticRetrievePaymentCredentialsResponse200**](AgenticRetrievePaymentCredentialsResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



