# CyberSource::AgentRegistrationApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activate_agent_key**](AgentRegistrationApi.md#activate_agent_key) | **POST** /icc/v1/agents/{agentId}/keys/{keyId}/activate | Activate a key
[**add_agent_key**](AgentRegistrationApi.md#add_agent_key) | **POST** /icc/v1/agents/{agentId}/keys | Add a key to an agent
[**get_agent**](AgentRegistrationApi.md#get_agent) | **GET** /icc/v1/agents/{agentId} | Get an agent
[**get_agent_key**](AgentRegistrationApi.md#get_agent_key) | **GET** /icc/v1/agents/{agentId}/keys/{keyId} | Get a key by agent and key ID
[**list_agent_keys**](AgentRegistrationApi.md#list_agent_keys) | **GET** /icc/v1/agents/{agentId}/keys | List keys for an agent
[**register_agent**](AgentRegistrationApi.md#register_agent) | **POST** /icc/v1/agents | Register an agent
[**update_agent**](AgentRegistrationApi.md#update_agent) | **PUT** /icc/v1/agents/{agentId} | Update an agent
[**update_agent_key**](AgentRegistrationApi.md#update_agent_key) | **PUT** /icc/v1/agents/{agentId}/keys/{keyId} | Update a key


# **activate_agent_key**
> AddAgentKeyResponse201 activate_agent_key(agent_id, key_id)

Activate a key

**Activate a Key**<br>Activates a deactivated public key, making it available for signature verification.<br><br> Returns **404** if the agent or key is not found, **403** if the agent is deactivated. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentRegistrationApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

key_id = 'key_id_example' # String | Unique key identifier


begin
  #Activate a key
  result = api_instance.activate_agent_key(agent_id, key_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentRegistrationApi->activate_agent_key: #{e}"
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

**Add a Key to an Agent**<br>Uploads a new public key for the specified agent. The key is created in ***deactivated*** state and must be explicitly activated via `POST /agents/{agentId}/keys/{keyId}/activate` before it can be used.<br><br> Returns **404** if the agent is not found, **403** if the agent is deactivated. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentRegistrationApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

key_request = CyberSource::KeyRequest.new # KeyRequest | Key creation request


begin
  #Add a key to an agent
  result = api_instance.add_agent_key(agent_id, key_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentRegistrationApi->add_agent_key: #{e}"
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



# **get_agent**
> AgentRegistrationResponse201 get_agent(agent_id)

Get an agent

**Get an Agent**<br>Retrieves a single agent by its unique identifier, including all associated public keys.<br><br> Returns **404** if the agent is not found. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentRegistrationApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier


begin
  #Get an agent
  result = api_instance.get_agent(agent_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentRegistrationApi->get_agent: #{e}"
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

**Get a Key**<br>Retrieves a specific public key by agent ID and key ID.<br><br> Returns **404** if the agent or key is not found. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentRegistrationApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

key_id = 'key_id_example' # String | Unique key identifier


begin
  #Get a key by agent and key ID
  result = api_instance.get_agent_key(agent_id, key_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentRegistrationApi->get_agent_key: #{e}"
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



# **list_agent_keys**
> ListAgentKeysResponse200 list_agent_keys(agent_id, opts)

List keys for an agent

**List Keys for an Agent**<br>Returns a paginated list of all public keys associated with the specified agent.<br><br> Returns **404** if the agent is not found. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentRegistrationApi.new

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
  puts "Exception when calling AgentRegistrationApi->list_agent_keys: #{e}"
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

**Register an Agent**<br>Registers a new AI agent in the Visa Agent Registry Service (VARS). Once registered, the agent can upload public keys that merchants and Visa services use to verify request signatures.<br><br> **Key Behavior**<br>If an optional `keys` array is included in the request, those keys are created alongside the agent registration in a single operation.<br> Returns **409 Conflict** if an agent with the same domain already exists. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentRegistrationApi.new

agent_request = CyberSource::AgentRequest.new # AgentRequest | Agent registration request


begin
  #Register an agent
  result = api_instance.register_agent(agent_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentRegistrationApi->register_agent: #{e}"
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



# **update_agent**
> AgentRegistrationResponse201 update_agent(agent_id, agent_update)

Update an agent

**Update an Agent**<br>Updates agent information. Only the following fields can be modified: `name`, `domain`, `description`, `contactEmail`, and `agentMetadata`.<br><br> Submitting any other field (e.g., `tokenRequestorId`, `keys`) returns **422 Validation Error**.<br> Returns **404** if the agent is not found, **403** if the agent is deactivated, **409** if the new domain is already registered. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentRegistrationApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

agent_update = CyberSource::AgentUpdate.new # AgentUpdate | Agent update request


begin
  #Update an agent
  result = api_instance.update_agent(agent_id, agent_update)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentRegistrationApi->update_agent: #{e}"
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

**Update a Key**<br>Updates key information. The following fields can be modified: `keyName`, `publicKey`, `algorithm`, and `expirationDate`.<br><br> **Note:** `publicKey` and `algorithm` must always be updated together.<br> Returns **404** if the agent or key is not found, **403** if the agent or key is deactivated, **409** if the new `keyName` already exists. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::AgentRegistrationApi.new

agent_id = 'agent_id_example' # String | Unique agent identifier

key_id = 'key_id_example' # String | Unique key identifier

key_update = CyberSource::KeyUpdate.new # KeyUpdate | Key update request


begin
  #Update a key
  result = api_instance.update_agent_key(agent_id, key_id, key_update)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling AgentRegistrationApi->update_agent_key: #{e}"
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



