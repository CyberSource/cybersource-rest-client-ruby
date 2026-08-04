# CyberSource::ListAgentKeysResponse200

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**agent_id** | **String** | Agent identifier (64-char SHA-256 hash) | 
**agent_name** | **String** | Agent name | 
**keys** | [**Array&lt;AgentRegistrationResponse201Keys&gt;**](AgentRegistrationResponse201Keys.md) | List of keys (without agentId/agentName/agentType since they are at parent level) | 
**pagination** | [**ListAgentKeysResponse200Pagination**](ListAgentKeysResponse200Pagination.md) |  | 


