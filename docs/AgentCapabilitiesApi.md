# CyberSource::AgentCapabilitiesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activate_agent_key**](AgentCapabilitiesApi.md#activate_agent_key) | **POST** /icc/v1/agents/{agentId}/keys/{keyId}/activate | Activate a key
[**add_agent_key**](AgentCapabilitiesApi.md#add_agent_key) | **POST** /icc/v1/agents/{agentId}/keys | Add a key to an agent
[**cancel_checkout**](AgentCapabilitiesApi.md#cancel_checkout) | **POST** /icc/v1/checkout_sessions/{session_id}/cancel | Cancel Checkout ACP
[**cancel_purchase_intent**](AgentCapabilitiesApi.md#cancel_purchase_intent) | **PUT** /icc/v1/instructions/{instructionId}/cancel | Cancel a purchase intent
[**complete_checkout**](AgentCapabilitiesApi.md#complete_checkout) | **POST** /icc/v1/checkout_sessions/{session_id}/complete | Complete Checkout ACP
[**confirm_transaction_events**](AgentCapabilitiesApi.md#confirm_transaction_events) | **POST** /icc/v1/instructions/{instructionId}/confirmations | Confirm transaction events
[**create_checkout_session**](AgentCapabilitiesApi.md#create_checkout_session) | **POST** /icc/v1/checkout_sessions | Create Checkout Session ACP
[**deactivate_agent_key**](AgentCapabilitiesApi.md#deactivate_agent_key) | **DELETE** /icc/v1/agents/{agentId}/keys/{keyId} | Deactivate a key
[**enroll_card**](AgentCapabilitiesApi.md#enroll_card) | **POST** /icc/v1/tokens | Enroll a card
[**get_agent**](AgentCapabilitiesApi.md#get_agent) | **GET** /icc/v1/agents/{agentId} | Get an agent
[**get_agent_key**](AgentCapabilitiesApi.md#get_agent_key) | **GET** /icc/v1/agents/{agentId}/keys/{keyId} | Get a key by agent and key ID
[**get_checkout_session**](AgentCapabilitiesApi.md#get_checkout_session) | **GET** /icc/v1/checkout_sessions/{session_id} | Get Checkout Session ACP
[**initiate_purchase_intent**](AgentCapabilitiesApi.md#initiate_purchase_intent) | **POST** /icc/v1/instructions | Initiate a purchase intent
[**list_agent_keys**](AgentCapabilitiesApi.md#list_agent_keys) | **GET** /icc/v1/agents/{agentId}/keys | List keys for an agent
[**register_agent**](AgentCapabilitiesApi.md#register_agent) | **POST** /icc/v1/agents | Register an agent
[**retrieve_payment_credentials**](AgentCapabilitiesApi.md#retrieve_payment_credentials) | **POST** /icc/v1/instructions/{instructionId}/credentials | Retrieve payment credentials
[**ucp_cancel_checkout**](AgentCapabilitiesApi.md#ucp_cancel_checkout) | **POST** /icc/v1/checkout-sessions/{session_id}/cancel | Cancel Checkout UCP
[**ucp_complete_checkout**](AgentCapabilitiesApi.md#ucp_complete_checkout) | **POST** /icc/v1/checkout-sessions/{session_id}/complete | Complete Checkout UCP
[**ucp_create_checkout_session**](AgentCapabilitiesApi.md#ucp_create_checkout_session) | **POST** /icc/v1/checkout-sessions | Create Checkout Session UCP
[**ucp_get_checkout_session**](AgentCapabilitiesApi.md#ucp_get_checkout_session) | **GET** /icc/v1/checkout-sessions/{session_id} | Get Checkout Session UCP
[**ucp_update_checkout_session**](AgentCapabilitiesApi.md#ucp_update_checkout_session) | **PUT** /icc/v1/checkout-sessions/{session_id} | Update Checkout Session UCP
[**update_agent**](AgentCapabilitiesApi.md#update_agent) | **PUT** /icc/v1/agents/{agentId} | Update an agent
[**update_agent_key**](AgentCapabilitiesApi.md#update_agent_key) | **PUT** /icc/v1/agents/{agentId}/keys/{keyId} | Update a key
[**update_checkout_session**](AgentCapabilitiesApi.md#update_checkout_session) | **POST** /icc/v1/checkout_sessions/{session_id} | Update Checkout Session ACP
[**update_purchase_intent**](AgentCapabilitiesApi.md#update_purchase_intent) | **PUT** /icc/v1/instructions/{instructionId} | Update a purchase intent


# **activate_agent_key**
> AddAgentKeyResponse201 activate_agent_key(agent_id, key_id)

Activate a key

Activate a deactivated key. Raises 404 if agent or key not found, 403 if agent is deactivated.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

key_id = 'key_id_example' # String | Unique key identifier


begin
  #Activate a key
  result = api_instance.activate_agent_key(agent_id, key_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->activate_agent_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agent_id** | **String**| Unique agent identifier | 
 **key_id** | **String**| Unique key identifier | 

### Return type

[**AddAgentKeyResponse201**](AddAgentKeyResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **add_agent_key**
> AddAgentKeyResponse201 add_agent_key(agent_id, key_request)

Add a key to an agent

[category 1 — Agent_Capabilities] Upload a Base64-encoded public key for an agent.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

key_request = CyberSource::KeyRequest.new # KeyRequest | Key creation request


begin
  #Add a key to an agent
  result = api_instance.add_agent_key(agent_id, key_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->add_agent_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agent_id** | **String**| Unique agent identifier | 
 **key_request** | [**KeyRequest**](KeyRequest.md)| Key creation request | 

### Return type

[**AddAgentKeyResponse201**](AddAgentKeyResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **cancel_checkout**
> InlineResponse20018 cancel_checkout(session_id, opts)

Cancel Checkout ACP

Cancels an active ACP checkout session. No charge is made to the buyer.  This call is safe to make multiple times — cancelling an already-cancelled session returns a successful response without error.  Sessions also expire automatically after 30 minutes of inactivity, so explicit cancellation is optional but recommended to release any reserved inventory immediately. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

session_id = 'session_id_example' # String | The unique identifier of the ACP checkout session to cancel. Obtained from the `id` field in the Create Session response. 

opts = { 
  idempotency_key: 'idempotency_key_example', # String | Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned. 
  accept_language: 'accept_language_example', # String | Preferred language for the response (e.g. `en-US`, `fr-FR`). Passed to the merchant backend for localized content. 
  user_agent: 'user_agent_example', # String | Client user agent string identifying the AI agent platform and version. 
  request_id: 'request_id_example', # String | Unique request identifier for distributed tracing and debugging. Echoed back in the response headers. 
  signature: 'signature_example', # String | Request signature for payload integrity verification. 
  timestamp: 'timestamp_example', # String | ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection. 
  api_version: 'api_version_example' # String | ACP specification version the client is targeting (e.g. `2024-01-01`). When omitted, the latest supported version is assumed. 
}

begin
  #Cancel Checkout ACP
  result = api_instance.cancel_checkout(session_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->cancel_checkout: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **session_id** | **String**| The unique identifier of the ACP checkout session to cancel. Obtained from the &#x60;id&#x60; field in the Create Session response.  | 
 **idempotency_key** | **String**| Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned.  | [optional] 
 **accept_language** | **String**| Preferred language for the response (e.g. &#x60;en-US&#x60;, &#x60;fr-FR&#x60;). Passed to the merchant backend for localized content.  | [optional] 
 **user_agent** | **String**| Client user agent string identifying the AI agent platform and version.  | [optional] 
 **request_id** | **String**| Unique request identifier for distributed tracing and debugging. Echoed back in the response headers.  | [optional] 
 **signature** | **String**| Request signature for payload integrity verification.  | [optional] 
 **timestamp** | **String**| ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection.  | [optional] 
 **api_version** | **String**| ACP specification version the client is targeting (e.g. &#x60;2024-01-01&#x60;). When omitted, the latest supported version is assumed.  | [optional] 

### Return type

[**InlineResponse20018**](InlineResponse20018.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **cancel_purchase_intent**
> AgenticCreatePurchaseIntentResponse200 cancel_purchase_intent(instruction_id, agentic_cancel_purchase_intent_request)

Cancel a purchase intent

Cancel an existing purchase intent (instruction) identified by its instructionId. The agent calls this endpoint when the consumer decides to abandon the purchase before payment credentials have been used. Requires device information and assurance data for identity verification. Returns status CANCELLED (HTTP 200) on success, or PENDING (HTTP 202) with pendingEvents if cardholder authentication is required before cancellation can proceed.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

instruction_id = 'instruction_id_example' # String | 

agentic_cancel_purchase_intent_request = CyberSource::AgenticCancelPurchaseIntentRequest.new # AgenticCancelPurchaseIntentRequest | Unique identifier for the purchase intent instruction.


begin
  #Cancel a purchase intent
  result = api_instance.cancel_purchase_intent(instruction_id, agentic_cancel_purchase_intent_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->cancel_purchase_intent: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instruction_id** | **String**|  | 
 **agentic_cancel_purchase_intent_request** | [**AgenticCancelPurchaseIntentRequest**](AgenticCancelPurchaseIntentRequest.md)| Unique identifier for the purchase intent instruction. | 

### Return type

[**AgenticCreatePurchaseIntentResponse200**](AgenticCreatePurchaseIntentResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **complete_checkout**
> InlineResponse20017 complete_checkout(session_id, acp_complete_checkout_request, opts)

Complete Checkout ACP

**Final step of the ACP checkout flow.**  Submits payment and buyer information to place the order with the merchant. On success, the session transitions to `completed` and an `order_id` is returned confirming the merchant accepted the order.  Once completed, the session is immutable — it cannot be updated or cancelled.  **Payment token:** The `payment.token` must be a valid token from the payment provider configured for the merchant (e.g. a tokenized card from Stripe or Braintree). ACG forwards the token to the merchant's payment processor — it is never stored. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

session_id = 'session_id_example' # String | The unique identifier of the ACP checkout session to complete.

acp_complete_checkout_request = CyberSource::AcpCompleteCheckoutRequest.new # AcpCompleteCheckoutRequest | Final buyer and payment details needed to place the order. Both `buyer` and `payment` may have been provided in earlier Create/Update calls; if so, they can be omitted here. At least a valid payment token is required to process the transaction. 

opts = { 
  idempotency_key: 'idempotency_key_example', # String | Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned. 
  accept_language: 'accept_language_example', # String | Preferred language for the response (e.g. `en-US`, `fr-FR`). Passed to the merchant backend for localized content. 
  user_agent: 'user_agent_example', # String | Client user agent string identifying the AI agent platform and version. 
  request_id: 'request_id_example', # String | Unique request identifier for distributed tracing and debugging. Echoed back in the response headers. 
  signature: 'signature_example', # String | Request signature for payload integrity verification. 
  timestamp: 'timestamp_example', # String | ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection. 
  api_version: 'api_version_example' # String | ACP specification version the client is targeting (e.g. `2024-01-01`). When omitted, the latest supported version is assumed. 
}

begin
  #Complete Checkout ACP
  result = api_instance.complete_checkout(session_id, acp_complete_checkout_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->complete_checkout: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **session_id** | **String**| The unique identifier of the ACP checkout session to complete. | 
 **acp_complete_checkout_request** | [**AcpCompleteCheckoutRequest**](AcpCompleteCheckoutRequest.md)| Final buyer and payment details needed to place the order. Both &#x60;buyer&#x60; and &#x60;payment&#x60; may have been provided in earlier Create/Update calls; if so, they can be omitted here. At least a valid payment token is required to process the transaction.  | 
 **idempotency_key** | **String**| Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned.  | [optional] 
 **accept_language** | **String**| Preferred language for the response (e.g. &#x60;en-US&#x60;, &#x60;fr-FR&#x60;). Passed to the merchant backend for localized content.  | [optional] 
 **user_agent** | **String**| Client user agent string identifying the AI agent platform and version.  | [optional] 
 **request_id** | **String**| Unique request identifier for distributed tracing and debugging. Echoed back in the response headers.  | [optional] 
 **signature** | **String**| Request signature for payload integrity verification.  | [optional] 
 **timestamp** | **String**| ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection.  | [optional] 
 **api_version** | **String**| ACP specification version the client is targeting (e.g. &#x60;2024-01-01&#x60;). When omitted, the latest supported version is assumed.  | [optional] 

### Return type

[**InlineResponse20017**](InlineResponse20017.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **confirm_transaction_events**
> AgenticConfirmTransactionEventsResponse202 confirm_transaction_events(instruction_id, agentic_confirm_transaction_events_request)

Confirm transaction events

Confirm transaction events for a completed purchase. The agent calls this endpoint after the payment has been submitted to notify the Intelligent Commerce Connect of the transaction outcome. The request includes processor information (transaction type, status, approval codes), order details (shipping, tracking, product information), and merchant information. Returns HTTP 202 acknowledging receipt of the confirmation.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

instruction_id = 'instruction_id_example' # String | Unique identifier for the purchase intent instruction.

agentic_confirm_transaction_events_request = CyberSource::AgenticConfirmTransactionEventsRequest.new # AgenticConfirmTransactionEventsRequest | 


begin
  #Confirm transaction events
  result = api_instance.confirm_transaction_events(instruction_id, agentic_confirm_transaction_events_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->confirm_transaction_events: #{e}"
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



# **create_checkout_session**
> InlineResponse20112 create_checkout_session(acp_create_checkout_session_request, opts)

Create Checkout Session ACP

**Step 1 of the ACP checkout flow.**  Initiates a new ACP checkout session with the buyer's cart. ACG validates item availability against the merchant's catalog, calculates initial pricing and tax, and returns a session object with a unique `id`.  **Store the `id`** — every subsequent call in this checkout flow (update, complete, cancel) requires it.  The session remains active for 30 minutes. A new session must be created after expiry.  **Idempotency:** Supply an `Idempotency-Key` header to safely retry this call without creating duplicate sessions. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

acp_create_checkout_session_request = CyberSource::AcpCreateCheckoutSessionRequest.new # AcpCreateCheckoutSessionRequest | The cart contents and buyer context for this checkout session. `items` is required. `buyer` and `fulfillment_address` are optional on creation and can be provided via Update Session before completing checkout. 

opts = { 
  idempotency_key: 'idempotency_key_example', # String | Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned. 
  accept_language: 'accept_language_example', # String | Preferred language for the response (e.g. `en-US`, `fr-FR`). Passed to the merchant backend for localized content. 
  user_agent: 'user_agent_example', # String | Client user agent string identifying the AI agent platform and version. 
  request_id: 'request_id_example', # String | Unique request identifier for distributed tracing and debugging. Echoed back in the response headers. 
  signature: 'signature_example', # String | Request signature for payload integrity verification. 
  timestamp: 'timestamp_example', # String | ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection. 
  api_version: 'api_version_example' # String | ACP specification version the client is targeting (e.g. `2024-01-01`). When omitted, the latest supported version is assumed. 
}

begin
  #Create Checkout Session ACP
  result = api_instance.create_checkout_session(acp_create_checkout_session_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->create_checkout_session: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **acp_create_checkout_session_request** | [**AcpCreateCheckoutSessionRequest**](AcpCreateCheckoutSessionRequest.md)| The cart contents and buyer context for this checkout session. &#x60;items&#x60; is required. &#x60;buyer&#x60; and &#x60;fulfillment_address&#x60; are optional on creation and can be provided via Update Session before completing checkout.  | 
 **idempotency_key** | **String**| Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned.  | [optional] 
 **accept_language** | **String**| Preferred language for the response (e.g. &#x60;en-US&#x60;, &#x60;fr-FR&#x60;). Passed to the merchant backend for localized content.  | [optional] 
 **user_agent** | **String**| Client user agent string identifying the AI agent platform and version.  | [optional] 
 **request_id** | **String**| Unique request identifier for distributed tracing and debugging. Echoed back in the response headers.  | [optional] 
 **signature** | **String**| Request signature for payload integrity verification.  | [optional] 
 **timestamp** | **String**| ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection.  | [optional] 
 **api_version** | **String**| ACP specification version the client is targeting (e.g. &#x60;2024-01-01&#x60;). When omitted, the latest supported version is assumed.  | [optional] 

### Return type

[**InlineResponse20112**](InlineResponse20112.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **deactivate_agent_key**
> deactivate_agent_key(agent_id, key_id)

Deactivate a key

Deactivate a key (soft delete). Raises 404 if key not found.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

key_id = 'key_id_example' # String | Unique key identifier


begin
  #Deactivate a key
  api_instance.deactivate_agent_key(agent_id, key_id)
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->deactivate_agent_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agent_id** | **String**| Unique agent identifier | 
 **key_id** | **String**| Unique key identifier | 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **enroll_card**
> AgenticCardEnrollmentResponse200 enroll_card(agentic_card_enrollment_request)

Enroll a card

Enroll a payment card for agentic or e-commerce transactions. This is typically the first step in the Intelligent Commerce payment lifecycle — the agent calls this endpoint to register a consumer's card, creating a tokenized reference that can be used in subsequent purchase instructions and payment credential retrieval. Requires device information, consumer identity, billing details, and payment instrument references. Returns a status of ACTIVE (HTTP 200) if enrollment completes immediately, or PENDING (HTTP 202) with pendingEvents if cardholder authentication is required. Call this endpoint when a consumer wants to add a new payment card or when setting up a card for agentic payment flows.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agentic_card_enrollment_request = CyberSource::AgenticCardEnrollmentRequest.new # AgenticCardEnrollmentRequest | 


begin
  #Enroll a card
  result = api_instance.enroll_card(agentic_card_enrollment_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->enroll_card: #{e}"
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



# **get_agent**
> AgentRegistrationResponse201 get_agent(agent_id)

Get an agent

[category 1 — Agent_Capabilities] Get agent by ID with all keys. Raises 404 if agent not found.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier


begin
  #Get an agent
  result = api_instance.get_agent(agent_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->get_agent: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agent_id** | **String**| Unique agent identifier | 

### Return type

[**AgentRegistrationResponse201**](AgentRegistrationResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_agent_key**
> AddAgentKeyResponse201 get_agent_key(agent_id, key_id)

Get a key by agent and key ID

Get a specific key by agent ID and key ID. Raises 404 if key not found.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

key_id = 'key_id_example' # String | Unique key identifier


begin
  #Get a key by agent and key ID
  result = api_instance.get_agent_key(agent_id, key_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->get_agent_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agent_id** | **String**| Unique agent identifier | 
 **key_id** | **String**| Unique key identifier | 

### Return type

[**AddAgentKeyResponse201**](AddAgentKeyResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_checkout_session**
> InlineResponse20112 get_checkout_session(session_id, acp_get_checkout_session_request, opts)

Get Checkout Session ACP

Retrieves the current state of an ACP checkout session, including line items, buyer information,  and current totals.  Use this to: - Verify session status before presenting a checkout summary to the buyer - Resume an interrupted checkout flow - Poll for status after an async operation - Confirm a session has not expired before submitting payment 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

session_id = 'session_id_example' # String | The unique identifier of the ACP checkout session to retrieve. Obtained from the `id` field in the Create Session response. 

acp_get_checkout_session_request = nil # Object | Empty request body.

opts = { 
  idempotency_key: 'idempotency_key_example', # String | Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned. 
  accept_language: 'accept_language_example', # String | Preferred language for the response (e.g. `en-US`, `fr-FR`). Passed to the merchant backend for localized content. 
  user_agent: 'user_agent_example', # String | Client user agent string identifying the AI agent platform and version. 
  request_id: 'request_id_example', # String | Unique request identifier for distributed tracing and debugging. Echoed back in the response headers. 
  signature: 'signature_example', # String | Request signature for payload integrity verification. 
  timestamp: 'timestamp_example', # String | ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection. 
  api_version: 'api_version_example' # String | ACP specification version the client is targeting (e.g. `2024-01-01`). When omitted, the latest supported version is assumed. 
}

begin
  #Get Checkout Session ACP
  result = api_instance.get_checkout_session(session_id, acp_get_checkout_session_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->get_checkout_session: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **session_id** | **String**| The unique identifier of the ACP checkout session to retrieve. Obtained from the &#x60;id&#x60; field in the Create Session response.  | 
 **acp_get_checkout_session_request** | **Object**| Empty request body. | 
 **idempotency_key** | **String**| Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned.  | [optional] 
 **accept_language** | **String**| Preferred language for the response (e.g. &#x60;en-US&#x60;, &#x60;fr-FR&#x60;). Passed to the merchant backend for localized content.  | [optional] 
 **user_agent** | **String**| Client user agent string identifying the AI agent platform and version.  | [optional] 
 **request_id** | **String**| Unique request identifier for distributed tracing and debugging. Echoed back in the response headers.  | [optional] 
 **signature** | **String**| Request signature for payload integrity verification.  | [optional] 
 **timestamp** | **String**| ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection.  | [optional] 
 **api_version** | **String**| ACP specification version the client is targeting (e.g. &#x60;2024-01-01&#x60;). When omitted, the latest supported version is assumed.  | [optional] 

### Return type

[**InlineResponse20112**](InlineResponse20112.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **initiate_purchase_intent**
> AgenticCreatePurchaseIntentResponse200 initiate_purchase_intent(agentic_create_purchase_intent_request)

Initiate a purchase intent

Create a new purchase intent (instruction) for an agentic transaction. The agent calls this endpoint after a card has been enrolled to define what the consumer wants to buy. The request includes payment instrument references, device and assurance data, mandates (spending limits, merchant preferences, and product descriptions), and optional buyer information. Return an instructionId (HTTP 200) if the intent is created immediately, or PENDING (HTTP 202) with pendingEvents if cardholder authentication is required. The instructionId returned is used in all subsequent operations - update, cancel, retrieve credentials, and confirm transaction.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agentic_create_purchase_intent_request = CyberSource::AgenticCreatePurchaseIntentRequest.new # AgenticCreatePurchaseIntentRequest | 


begin
  #Initiate a purchase intent
  result = api_instance.initiate_purchase_intent(agentic_create_purchase_intent_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->initiate_purchase_intent: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agentic_create_purchase_intent_request** | [**AgenticCreatePurchaseIntentRequest**](AgenticCreatePurchaseIntentRequest.md)|  | 

### Return type

[**AgenticCreatePurchaseIntentResponse200**](AgenticCreatePurchaseIntentResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **list_agent_keys**
> ListAgentKeysResponse200 list_agent_keys(agent_id, opts)

List keys for an agent

[category 1 — Agent_Capabilities] List all keys for a specific agent with pagination.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

opts = { 
  page: 1, # Integer | Page number (1-indexed)
  page_size: 30 # Integer | Items per page (max 100)
}

begin
  #List keys for an agent
  result = api_instance.list_agent_keys(agent_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->list_agent_keys: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agent_id** | **String**| Unique agent identifier | 
 **page** | **Integer**| Page number (1-indexed) | [optional] [default to 1]
 **page_size** | **Integer**| Items per page (max 100) | [optional] [default to 30]

### Return type

[**ListAgentKeysResponse200**](ListAgentKeysResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **register_agent**
> AgentRegistrationResponse201 register_agent(agent_request)

Register an agent

Register a new AI agent in the VARS. Once registered, the agent can upload public keys that merchants and Visa services use to verify request signatures. Raises 409 if domain, contactEmail, or tokenRequestorId already exists.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agent_request = CyberSource::AgentRequest.new # AgentRequest | Agent registration request


begin
  #Register an agent
  result = api_instance.register_agent(agent_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->register_agent: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agent_request** | [**AgentRequest**](AgentRequest.md)| Agent registration request | 

### Return type

[**AgentRegistrationResponse201**](AgentRegistrationResponse201.md)

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

api_instance = CyberSource::AgentCapabilitiesApi.new

instruction_id = 'instruction_id_example' # String | Unique identifier for the purchase intent instruction.

agentic_retrieve_payment_credentials_request = CyberSource::AgenticRetrievePaymentCredentialsRequest.new # AgenticRetrievePaymentCredentialsRequest | 


begin
  #Retrieve payment credentials
  result = api_instance.retrieve_payment_credentials(instruction_id, agentic_retrieve_payment_credentials_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->retrieve_payment_credentials: #{e}"
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



# **ucp_cancel_checkout**
> InlineResponse20113 ucp_cancel_checkout(session_id)

Cancel Checkout UCP

Cancels an active UCP checkout session. No charge is made.  This operation is idempotent — cancelling an already-cancelled session returns a successful response. Sessions also expire automatically after 30 minutes of inactivity. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

session_id = 'sess_abc123' # String | The unique identifier of the UCP checkout session to cancel.


begin
  #Cancel Checkout UCP
  result = api_instance.ucp_cancel_checkout(session_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->ucp_cancel_checkout: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **session_id** | **String**| The unique identifier of the UCP checkout session to cancel. | 

### Return type

[**InlineResponse20113**](InlineResponse20113.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **ucp_complete_checkout**
> InlineResponse20113 ucp_complete_checkout(session_id, opts)

Complete Checkout UCP

**Final step of the UCP checkout flow.**  Finalizes the session and places the order with the merchant. ACG translates the UCP completion request to the merchant's checkout API.  On success, the session transitions to `completed`. An `order_id` is not returned in the UCP response — use the ACP Complete endpoint if you need order confirmation details.  **Always use an `idempotency-key`** to prevent duplicate orders on network retries. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

session_id = 'sess_abc123' # String | The unique identifier of the UCP checkout session to complete.

opts = { 
  idempotency_key: 'a1b2c3d4-e5f6-7890-abcd-ef1234567890', # String | **Strongly recommended.** A unique key that ensures this order is placed exactly once on retries. Lowercase per UCP spec. 
  ucp_complete_checkout_request: CyberSource::UcpCompleteCheckoutRequest.new # UcpCompleteCheckoutRequest | UCP completion payload containing payment instrument and optional risk signals. If payment context was already provided in the Create or Update call, the body can be omitted. Risk signals are logged for fraud analysis and are not forwarded to the merchant. 
}

begin
  #Complete Checkout UCP
  result = api_instance.ucp_complete_checkout(session_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->ucp_complete_checkout: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **session_id** | **String**| The unique identifier of the UCP checkout session to complete. | 
 **idempotency_key** | **String**| **Strongly recommended.** A unique key that ensures this order is placed exactly once on retries. Lowercase per UCP spec.  | [optional] 
 **ucp_complete_checkout_request** | [**UcpCompleteCheckoutRequest**](UcpCompleteCheckoutRequest.md)| UCP completion payload containing payment instrument and optional risk signals. If payment context was already provided in the Create or Update call, the body can be omitted. Risk signals are logged for fraud analysis and are not forwarded to the merchant.  | [optional] 

### Return type

[**InlineResponse20113**](InlineResponse20113.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **ucp_create_checkout_session**
> InlineResponse20113 ucp_create_checkout_session(ucp_create_checkout_session_request, opts)

Create Checkout Session UCP

**Step 1 of the UCP checkout flow.**  Creates a new UCP checkout session using Google's Universal Commerce Protocol format. ACG translates the UCP request into the internal ACP format, applies merchant pricing, and returns a UCP-format session response with a session `id`.  UCP uses `line_items` (instead of `items`) and lowercase header names (`idempotency-key`) per the UCP specification.  **Store the `id`** from the response — it is required for all subsequent UCP calls. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

ucp_create_checkout_session_request = CyberSource::UcpCreateCheckoutSessionRequest.new # UcpCreateCheckoutSessionRequest | UCP checkout session creation payload containing line items, buyer details, currency, and optional payment, fulfillment, and discount information. 

opts = { 
  idempotency_key: 'fc23729f-dc9b-4619-8742-2cf9d7bfdf1b' # String | Client-generated unique key (UUID recommended) to ensure this request is processed exactly once. Lowercase per UCP specification. 
}

begin
  #Create Checkout Session UCP
  result = api_instance.ucp_create_checkout_session(ucp_create_checkout_session_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->ucp_create_checkout_session: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **ucp_create_checkout_session_request** | [**UcpCreateCheckoutSessionRequest**](UcpCreateCheckoutSessionRequest.md)| UCP checkout session creation payload containing line items, buyer details, currency, and optional payment, fulfillment, and discount information.  | 
 **idempotency_key** | **String**| Client-generated unique key (UUID recommended) to ensure this request is processed exactly once. Lowercase per UCP specification.  | [optional] 

### Return type

[**InlineResponse20113**](InlineResponse20113.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **ucp_get_checkout_session**
> InlineResponse20113 ucp_get_checkout_session(session_id, ucp_get_checkout_session_request)

Get Checkout Session UCP

Retrieves the current state of a UCP checkout session.  Use this to verify session status, retrieve updated totals after a fulfillment change, or resume a session after an interruption. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

session_id = 'sess_abc123' # String | The unique identifier of the UCP checkout session to retrieve. Obtained from the `id` field in the Create Session response. 

ucp_get_checkout_session_request = nil # Object | Empty request body.


begin
  #Get Checkout Session UCP
  result = api_instance.ucp_get_checkout_session(session_id, ucp_get_checkout_session_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->ucp_get_checkout_session: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **session_id** | **String**| The unique identifier of the UCP checkout session to retrieve. Obtained from the &#x60;id&#x60; field in the Create Session response.  | 
 **ucp_get_checkout_session_request** | **Object**| Empty request body. | 

### Return type

[**InlineResponse20113**](InlineResponse20113.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **ucp_update_checkout_session**
> InlineResponse20113 ucp_update_checkout_session(session_id, ucp_update_checkout_session_request, opts)

Update Checkout Session UCP

Modifies an active UCP checkout session and returns the updated session state.  Use this to change line item quantities, update fulfillment address or method, or apply discount codes. Totals are recalculated and returned in the response.  Only the fields you include in the request body are updated. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

session_id = 'sess_abc123' # String | The unique identifier of the UCP checkout session to update.

ucp_update_checkout_session_request = CyberSource::UcpUpdateCheckoutSessionRequest.new # UcpUpdateCheckoutSessionRequest | UCP session update payload. All fields are optional — only fields you include will be applied. 

opts = { 
  idempotency_key: 'a1b2c3d4-e5f6-7890-abcd-ef1234567890' # String | Client-generated unique key for idempotency. Lowercase per UCP spec.
}

begin
  #Update Checkout Session UCP
  result = api_instance.ucp_update_checkout_session(session_id, ucp_update_checkout_session_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->ucp_update_checkout_session: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **session_id** | **String**| The unique identifier of the UCP checkout session to update. | 
 **ucp_update_checkout_session_request** | [**UcpUpdateCheckoutSessionRequest**](UcpUpdateCheckoutSessionRequest.md)| UCP session update payload. All fields are optional — only fields you include will be applied.  | 
 **idempotency_key** | **String**| Client-generated unique key for idempotency. Lowercase per UCP spec. | [optional] 

### Return type

[**InlineResponse20113**](InlineResponse20113.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_agent**
> AgentRegistrationResponse201 update_agent(agent_id, agent_update)

Update an agent

[category 1 — Agent_Capabilities] Update agent information. Updatable fields are name, domain, description, contactEmail, and agentMetadata. Extra fields (e.g. tokenRequestorId, keys) will return 422 Validation Error. Raises 404 if agent not found, 403 if agent is deactivated, 409 if new domain or contactEmail already exists.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

agent_update = CyberSource::AgentUpdate.new # AgentUpdate | Agent update request


begin
  #Update an agent
  result = api_instance.update_agent(agent_id, agent_update)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->update_agent: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agent_id** | **String**| Unique agent identifier | 
 **agent_update** | [**AgentUpdate**](AgentUpdate.md)| Agent update request | 

### Return type

[**AgentRegistrationResponse201**](AgentRegistrationResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_agent_key**
> AddAgentKeyResponse201 update_agent_key(agent_id, key_id, key_update)

Update a key

Update key information. Updatable fields are keyName, publicKey, algorithm, and expirationDate. Raises 404 if agent or key not found, 403 if agent or key is deactivated, 409 if new keyName already exists.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

key_id = 'key_id_example' # String | Unique key identifier

key_update = CyberSource::KeyUpdate.new # KeyUpdate | Key update request


begin
  #Update a key
  result = api_instance.update_agent_key(agent_id, key_id, key_update)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->update_agent_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **agent_id** | **String**| Unique agent identifier | 
 **key_id** | **String**| Unique key identifier | 
 **key_update** | [**KeyUpdate**](KeyUpdate.md)| Key update request | 

### Return type

[**AddAgentKeyResponse201**](AddAgentKeyResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_checkout_session**
> InlineResponse20112 update_checkout_session(session_id, acp_update_checkout_session_request, opts)

Update Checkout Session ACP

Modifies an active ACP checkout session and returns the updated session state with recalculated totals.  Use this to: - Add, remove, or change quantities of cart items - Apply or remove discount codes - Update the buyer's shipping address or contact details - Trigger re-calculation of shipping costs and tax  Only fields included in the request body are updated — omitted fields retain their current values.  **Idempotency:** Supply an `Idempotency-Key` to safely retry updates without applying them twice. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

session_id = 'session_id_example' # String | The unique identifier of the ACP checkout session to update. Obtained from the `id` field in the Create Session response. 

acp_update_checkout_session_request = CyberSource::AcpUpdateCheckoutSessionRequest.new # AcpUpdateCheckoutSessionRequest | Fields to update. All fields are optional — only included fields are changed. To replace the cart entirely, provide the full `items` array. 

opts = { 
  idempotency_key: 'idempotency_key_example', # String | Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned. 
  accept_language: 'accept_language_example', # String | Preferred language for the response (e.g. `en-US`, `fr-FR`). Passed to the merchant backend for localized content. 
  user_agent: 'user_agent_example', # String | Client user agent string identifying the AI agent platform and version. 
  request_id: 'request_id_example', # String | Unique request identifier for distributed tracing and debugging. Echoed back in the response headers. 
  signature: 'signature_example', # String | Request signature for payload integrity verification. 
  timestamp: 'timestamp_example', # String | ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection. 
  api_version: 'api_version_example' # String | ACP specification version the client is targeting (e.g. `2024-01-01`). When omitted, the latest supported version is assumed. 
}

begin
  #Update Checkout Session ACP
  result = api_instance.update_checkout_session(session_id, acp_update_checkout_session_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->update_checkout_session: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **session_id** | **String**| The unique identifier of the ACP checkout session to update. Obtained from the &#x60;id&#x60; field in the Create Session response.  | 
 **acp_update_checkout_session_request** | [**AcpUpdateCheckoutSessionRequest**](AcpUpdateCheckoutSessionRequest.md)| Fields to update. All fields are optional — only included fields are changed. To replace the cart entirely, provide the full &#x60;items&#x60; array.  | 
 **idempotency_key** | **String**| Client-generated unique key to ensure this request is processed exactly once. If a request with the same key was already processed, the original response is returned.  | [optional] 
 **accept_language** | **String**| Preferred language for the response (e.g. &#x60;en-US&#x60;, &#x60;fr-FR&#x60;). Passed to the merchant backend for localized content.  | [optional] 
 **user_agent** | **String**| Client user agent string identifying the AI agent platform and version.  | [optional] 
 **request_id** | **String**| Unique request identifier for distributed tracing and debugging. Echoed back in the response headers.  | [optional] 
 **signature** | **String**| Request signature for payload integrity verification.  | [optional] 
 **timestamp** | **String**| ISO 8601 timestamp of when the request was generated. Used in conjunction with Signature for replay protection.  | [optional] 
 **api_version** | **String**| ACP specification version the client is targeting (e.g. &#x60;2024-01-01&#x60;). When omitted, the latest supported version is assumed.  | [optional] 

### Return type

[**InlineResponse20112**](InlineResponse20112.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_purchase_intent**
> AgenticCreatePurchaseIntentResponse200 update_purchase_intent(instruction_id, agentic_update_purchase_intent_request)

Update a purchase intent

Update an existing purchase intent (instruction) identified by its instructionId. The agent calls this endpoint when the consumer modifies their order — for example, changing the quantity, updating mandates, switching payment instruments, or changing shipping details. The request body has the same structure as the initiate request. Returns the same instructionId (HTTP 200) on success, or PENDING (HTTP 202) with pendingEvents if additional cardholder authentication is required for the updated intent.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentCapabilitiesApi.new

instruction_id = 'instruction_id_example' # String | Unique identifier for the purchase intent instruction.

agentic_update_purchase_intent_request = CyberSource::AgenticUpdatePurchaseIntentRequest.new # AgenticUpdatePurchaseIntentRequest | 


begin
  #Update a purchase intent
  result = api_instance.update_purchase_intent(instruction_id, agentic_update_purchase_intent_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentCapabilitiesApi->update_purchase_intent: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **instruction_id** | **String**| Unique identifier for the purchase intent instruction. | 
 **agentic_update_purchase_intent_request** | [**AgenticUpdatePurchaseIntentRequest**](AgenticUpdatePurchaseIntentRequest.md)|  | 

### Return type

[**AgenticCreatePurchaseIntentResponse200**](AgenticCreatePurchaseIntentResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



