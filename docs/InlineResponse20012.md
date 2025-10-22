# CyberSource::InlineResponse20012

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
**totals** | [**InlineResponse20010EmbeddedTotals**](InlineResponse20010EmbeddedTotals.md) |  | [optional] 
**billing** | [**InlineResponse20011Billing**](InlineResponse20011Billing.md) |  | [optional] 
**records** | [**Array&lt;InlineResponse20012Records&gt;**](InlineResponse20012Records.md) |  | [optional] 


