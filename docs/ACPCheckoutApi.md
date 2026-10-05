# CyberSource::ACPCheckoutApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cancel_checkout**](ACPCheckoutApi.md#cancel_checkout) | **POST** /icc/v1/checkout_sessions/{session_id}/cancel | Cancel Checkout ACP
[**complete_checkout**](ACPCheckoutApi.md#complete_checkout) | **POST** /icc/v1/checkout_sessions/{session_id}/complete | Complete Checkout ACP
[**create_checkout_session**](ACPCheckoutApi.md#create_checkout_session) | **POST** /icc/v1/checkout_sessions | Create Checkout Session ACP
[**get_checkout_session**](ACPCheckoutApi.md#get_checkout_session) | **GET** /icc/v1/checkout_sessions/{session_id} | Get Checkout Session ACP
[**update_checkout_session**](ACPCheckoutApi.md#update_checkout_session) | **POST** /icc/v1/checkout_sessions/{session_id} | Update Checkout Session ACP


# **cancel_checkout**
> InlineResponse20018 cancel_checkout(session_id, opts)

Cancel Checkout ACP

Cancels an active ACP checkout session. No charge is made to the buyer.  This call is safe to make multiple times — cancelling an already-cancelled session returns a successful response without error.  Sessions also expire automatically after 30 minutes of inactivity, so explicit cancellation is optional but recommended to release any reserved inventory immediately. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ACPCheckoutApi.new

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
  puts "Exception when calling ACPCheckoutApi->cancel_checkout: #{e}"
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



# **complete_checkout**
> InlineResponse20017 complete_checkout(session_id, acp_complete_checkout_request, opts)

Complete Checkout ACP

**Final step of the ACP checkout flow.**  Submits payment and buyer information to place the order with the merchant. On success, the session transitions to `completed` and an `order_id` is returned confirming the merchant accepted the order.  Once completed, the session is immutable — it cannot be updated or cancelled.  **Payment token:** The `payment.token` must be a valid token from the payment provider configured for the merchant (e.g. a tokenized card from Stripe or Braintree). ACG forwards the token to the merchant's payment processor — it is never stored. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ACPCheckoutApi.new

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
  puts "Exception when calling ACPCheckoutApi->complete_checkout: #{e}"
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



# **create_checkout_session**
> InlineResponse20112 create_checkout_session(acp_create_checkout_session_request, opts)

Create Checkout Session ACP

**Step 1 of the ACP checkout flow.**  Initiates a new ACP checkout session with the buyer's cart. ACG validates item availability against the merchant's catalog, calculates initial pricing and tax, and returns a session object with a unique `id`.  **Store the `id`** — every subsequent call in this checkout flow (update, complete, cancel) requires it.  The session remains active for 30 minutes. A new session must be created after expiry.  **Idempotency:** Supply an `Idempotency-Key` header to safely retry this call without creating duplicate sessions. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ACPCheckoutApi.new

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
  puts "Exception when calling ACPCheckoutApi->create_checkout_session: #{e}"
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



# **get_checkout_session**
> InlineResponse20112 get_checkout_session(session_id, acp_get_checkout_session_request, opts)

Get Checkout Session ACP

Retrieves the current state of an ACP checkout session, including line items, buyer information,  and current totals.  Use this to: - Verify session status before presenting a checkout summary to the buyer - Resume an interrupted checkout flow - Poll for status after an async operation - Confirm a session has not expired before submitting payment 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ACPCheckoutApi.new

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
  puts "Exception when calling ACPCheckoutApi->get_checkout_session: #{e}"
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



# **update_checkout_session**
> InlineResponse20112 update_checkout_session(session_id, acp_update_checkout_session_request, opts)

Update Checkout Session ACP

Modifies an active ACP checkout session and returns the updated session state with recalculated totals.  Use this to: - Add, remove, or change quantities of cart items - Apply or remove discount codes - Update the buyer's shipping address or contact details - Trigger re-calculation of shipping costs and tax  Only fields included in the request body are updated — omitted fields retain their current values.  **Idempotency:** Supply an `Idempotency-Key` to safely retry updates without applying them twice. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ACPCheckoutApi.new

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
  puts "Exception when calling ACPCheckoutApi->update_checkout_session: #{e}"
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



