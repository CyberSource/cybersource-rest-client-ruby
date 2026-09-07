# CyberSource::VpriRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**actions** | **Array&lt;String&gt;** | Actions to perform. For VPRI, specify VISA_PROTECT_RISK_INSIGHTS. Multiple actions may be included in a single request to invoke additional services simultaneously. | 
**events** | **Array&lt;String&gt;** | The events to be performed under specific actions. For VISA_PROTECT_RISK_INSIGHTS, supported values are LABELS and INSIGHTS. | 
**transaction** | [**UnifiedriskTransaction**](UnifiedriskTransaction.md) |  | 
**request_id** | **String** | Unique identifier for the risk assessment request | [optional] 
**event_time** | **DateTime** | The time that the real-world event occurred. | 
**context** | **String** | The context in which the request is made. | [optional] 
**mode** | **String** | Indicates whether the request is live or a test. | [optional] 
**request_comments** | **String** | Brief description or comments about the request | [optional] 
**schema_version** | **Integer** | Version of the request schema | [optional] 
**partner** | [**UnifiedriskPartner**](UnifiedriskPartner.md) |  | [optional] 
**payment** | [**UnifiedriskPayment**](UnifiedriskPayment.md) |  | [optional] 
**order** | [**UnifiedriskOrder**](UnifiedriskOrder.md) |  | [optional] 
**customer** | [**UnifiedriskCustomer**](UnifiedriskCustomer.md) |  | [optional] 
**risk_assessment** | [**UnifiedriskRiskAssessment**](UnifiedriskRiskAssessment.md) |  | [optional] 
**travel** | [**UnifiedriskTravel**](UnifiedriskTravel.md) |  | [optional] 
**merchant** | [**UnifiedriskMerchant**](UnifiedriskMerchant.md) |  | [optional] 
**acquirer** | [**UnifiedriskAcquirer**](UnifiedriskAcquirer.md) |  | [optional] 
**device** | [**UnifiedriskDevice**](UnifiedriskDevice.md) |  | [optional] 
**session** | [**UnifiedriskSession**](UnifiedriskSession.md) |  | [optional] 
**supplementary_data** | **String** | Free-form field for information not catered for by other components. Must not contain cardholder data or sensitive auth data. | [optional] 
**labels** | [**UnifiedriskLabels**](UnifiedriskLabels.md) |  | [optional] 
**account** | [**UnifiedriskAccount**](UnifiedriskAccount.md) |  | [optional] 
**authentication** | [**UnifiedriskAuthentication**](UnifiedriskAuthentication.md) |  | [optional] 
**authorization** | [**UnifiedriskAuthorization**](UnifiedriskAuthorization.md) |  | [optional] 
**browser** | [**UnifiedriskBrowser**](UnifiedriskBrowser.md) |  | [optional] 
**initiating_party** | [**UnifiedriskInitiatingParty**](UnifiedriskInitiatingParty.md) |  | [optional] 
**terminal** | [**UnifiedriskTerminal**](UnifiedriskTerminal.md) |  | [optional] 
**third_party_risk** | [**UnifiedriskThirdPartyRisk**](UnifiedriskThirdPartyRisk.md) |  | [optional] 


