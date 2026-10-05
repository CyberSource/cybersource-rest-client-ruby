# CyberSource::AgentRegistrationResponse201

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique agent identifier (64-char SHA-256 hash of domain + email + tokenRequestorId) | 
**name** | **String** | Display name for the agent | 
**domain** | **String** | Fully-qualified HTTPS URL of the agent&#39;s home domain | 
**description** | **String** | Description of the agent&#39;s purpose or capabilities | [optional] 
**contact_email** | **String** | Contact email for the team or individual responsible for this agent | [optional] 
**token_requestor_id** | **String** | Token Requestor ID (TRID) assigned by Visa, shared with the parent trusted agent for OSAs | 
**agent_type** | **String** | Agent classification: &#39;trusted&#39; (commercially onboarded via Visa) or &#39;known&#39; (open-source/community agent, unverified)  Possible values: - trusted - known | 
**agent_metadata** | **Object** | Free-form metadata object for agent context (e.g., AI framework, language, runtime). Max 10KB. | [optional] 
**is_active** | **BOOLEAN** | Whether the agent is currently active. Deactivated agents cannot add or activate keys. | 
**created_at** | **DateTime** | ISO 8601 UTC timestamp when the agent was registered | 
**updated_at** | **DateTime** | ISO 8601 UTC timestamp when the agent was last updated | 
**keys** | [**Array&lt;AgentRegistrationResponse201Keys&gt;**](AgentRegistrationResponse201Keys.md) | List of public keys associated with the agent (both active and deactivated) | [optional] 


