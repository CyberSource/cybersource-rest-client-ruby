# CyberSource::InlineResponse20010

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_links** | [**InlineResponse20010Links**](InlineResponse20010Links.md) |  | [optional] 
**batch_id** | **String** | Unique identification number assigned to the submitted request. | [optional] 
**batch_created_date** | **String** | ISO-8601 format: yyyy-MM-ddTHH:mm:ssZ | [optional] 
**batch_source** | **String** | Valid Values:   * SCHEDULER   * TOKEN_API   * CREDIT_CARD_FILE_UPLOAD   * AMEX_REGSITRY   * AMEX_REGISTRY_API   * AMEX_MAINTENANCE  | [optional] 
**merchant_reference** | **String** | Reference used by merchant to identify batch. | [optional] 
**batch_ca_endpoints** | **String** |  | [optional] 
**status** | **String** | Valid Values:   * REJECTED   * RECEIVED   * VALIDATED   * DECLINED   * PROCESSING   * COMPLETED  | [optional] 
**totals** | [**InlineResponse2009EmbeddedTotals**](InlineResponse2009EmbeddedTotals.md) |  | [optional] 
**billing** | [**InlineResponse20010Billing**](InlineResponse20010Billing.md) |  | [optional] 
**description** | **String** |  | [optional] 


