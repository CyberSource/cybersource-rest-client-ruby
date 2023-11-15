# CyberSource::InlineResponse2006

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_links** | [**InlineResponse2006Links**](InlineResponse2006Links.md) |  | [optional] 
**batch_id** | **String** | Unique identification number assigned to the submitted request. | [optional] 
**batch_created_date** | **String** | ISO-8601 format: yyyy-MM-ddTHH:mm:ssZ | [optional] 
**batch_source** | **String** | Valid Values:   * SCHEDULER   * TOKEN_API   * CREDIT_CARD_FILE_UPLOAD   * AMEX_REGSITRY   * AMEX_REGISTRY_API   * AMEX_MAINTENANCE  | [optional] 
**merchant_reference** | **String** | Reference used by merchant to identify batch. | [optional] 
**batch_ca_endpoints** | **String** |  | [optional] 
**status** | **String** | Valid Values:   * REJECTED   * RECEIVED   * VALIDATED   * DECLINED   * PROCESSING   * COMPLETED  | [optional] 
**totals** | [**InlineResponse2005EmbeddedTotals**](InlineResponse2005EmbeddedTotals.md) |  | [optional] 
**billing** | [**InlineResponse2006Billing**](InlineResponse2006Billing.md) |  | [optional] 
**description** | **String** |  | [optional] 


