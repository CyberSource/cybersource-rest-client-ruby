# CyberSource::ReplayWebhooksApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**replay_previous_webhooks**](ReplayWebhooksApi.md#replay_previous_webhooks) | **POST** /nrtf/v1/webhooks/{webhookId}/replays | Replay Previous Webhooks


# **replay_previous_webhooks**
> replay_previous_webhooks(webhook_id, opts)

Replay Previous Webhooks

Initiate a webhook replay request to replay transactions that happened in the past.  Cannot execute more than 1 replay request at a time. While one request is processing, you will not be allowed to execute another replay.  The difference between Start and End time cannot exceed a 24 hour window, and 1 month is the farthest date back that is eligible for replay. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::ReplayWebhooksApi.new

webhook_id = 'webhook_id_example' # String | The webhook uuid identifier.

opts = { 
  replay_webhooks_request: CyberSource::ReplayWebhooksRequest.new # ReplayWebhooksRequest | The request query
}

begin
  #Replay Previous Webhooks
  api_instance.replay_previous_webhooks(webhook_id, opts)
rescue CyberSource::ApiError => e
  puts "Exception when calling ReplayWebhooksApi->replay_previous_webhooks: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **webhook_id** | **String**| The webhook uuid identifier. | 
 **replay_webhooks_request** | [**ReplayWebhooksRequest**](ReplayWebhooksRequest.md)| The request query | [optional] 

### Return type

nil (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/json;charset=utf-8



