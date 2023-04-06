# CyberSource::Rbsv1plansPlanInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**code** | **String** | Plan code is an optional field, If not provided system generates and assign one  | [optional] 
**name** | **String** | Plan name  | 
**description** | **String** | Plan description  | [optional] 
**status** | **String** | Plan Status:  - &#x60;DRAFT&#x60;  - &#x60;ACTIVE&#x60; (default)  | [optional] 
**billing_period** | [**InlineResponse200PlanInformationBillingPeriod**](InlineResponse200PlanInformationBillingPeriod.md) |  | [optional] 
**billing_cycles** | [**Rbsv1plansPlanInformationBillingCycles**](Rbsv1plansPlanInformationBillingCycles.md) |  | [optional] 


