# CyberSource::InlineResponse20010

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**version** | **String** |  | [optional] 
**report_created_date** | **String** | ISO-8601 format: yyyy-MM-ddTHH:mm:ssZ | [optional] 
**batch_id** | **String** | Unique identification number assigned to the submitted request. | [optional] 
**batch_source** | **String** | Valid Values:   * SCHEDULER   * TOKEN_API   * CREDIT_CARD_FILE_UPLOAD   * AMEX_REGSITRY   * AMEX_REGISTRY_API   * AMEX_MAINTENANCE  | [optional] 
**batch_ca_endpoints** | **String** |  | [optional] 
**batch_created_date** | **String** | ISO-8601 format: yyyy-MM-ddTHH:mm:ssZ | [optional] 
**merchant_reference** | **String** | Reference used by merchant to identify batch. | [optional] 
**totals** | [**InlineResponse2008EmbeddedTotals**](InlineResponse2008EmbeddedTotals.md) |  | [optional] 
**billing** | [**InlineResponse2009Billing**](InlineResponse2009Billing.md) |  | [optional] 
**records** | [**Array&lt;InlineResponse20010Records&gt;**](InlineResponse20010Records.md) |  | [optional] 


