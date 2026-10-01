# CyberSource::AgentUpdate

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | Display name for the agent | [optional] 
**domain** | **String** | Fully-qualified HTTPS URL of the agent&#39;s home domain. Must be unique — raises 409 if already registered. | [optional] 
**description** | **String** | Description of the agent&#39;s purpose or capabilities | [optional] 
**contact_email** | **String** | Contact email for the team or individual responsible for this agent | [optional] 
**agent_metadata** | **Object** | Free-form metadata object for agent context (e.g., AI framework, language, runtime). Max 10KB. | [optional] 


