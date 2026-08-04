# CyberSource::AgentRegistrationResponse201

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Unique agent identifier (64-char SHA-256 hash of domain + email + tokenRequestorId) | 
**name** | **String** | Agent name | 
**domain** | **String** | Agent domain URL | 
**description** | **String** | Agent description | [optional] 
**contact_email** | **String** | Contact email | [optional] 
**token_requestor_id** | **String** | Unique token requestor identifier | 
**agent_type** | **String** | Agent classification: &#39;trusted&#39; (commercially onboarded) or &#39;known&#39; (open-source/unverified)  Possible values: - trusted - known | 
**agent_metadata** | **Hash&lt;String, String&gt;** | Additional agent metadata | [optional] 
**is_active** | **BOOLEAN** | Whether the agent is active | 
**created_at** | **DateTime** | Creation timestamp | 
**updated_at** | **DateTime** | Last update timestamp | 
**keys** | [**Array&lt;AgentRegistrationResponse201Keys&gt;**](AgentRegistrationResponse201Keys.md) | List of keys associated with the agent | [optional] 


