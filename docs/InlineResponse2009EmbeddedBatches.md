# CyberSource::InlineResponse2009EmbeddedBatches

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**_links** | [**InlineResponse2009EmbeddedLinks**](InlineResponse2009EmbeddedLinks.md) |  | [optional] 
**batch_id** | **String** | Unique identification number assigned to the submitted request. | [optional] 
**batch_created_date** | **String** | ISO-8601 format: yyyy-MM-ddTHH:mm:ssZ | [optional] 
**batch_modified_date** | **String** | ISO-8601 format: yyyy-MM-ddTHH:mm:ssZ | [optional] 
**batch_source** | **String** | Valid Values:   * SCHEDULER   * TOKEN_API   * CREDIT_CARD_FILE_UPLOAD   * AMEX_REGSITRY   * AMEX_REGISTRY_API   * AMEX_REGISTRY_API_SYNC   * AMEX_MAINTENANCE  | [optional] 
**token_source** | **String** | Valid Values:   * SECURE_STORAGE   * TMS   * CYBERSOURCE  | [optional] 
**merchant_reference** | **String** | Reference used by merchant to identify batch. | [optional] 
**batch_ca_endpoints** | **Array&lt;String&gt;** | Valid Values:   * VISA   * MASTERCARD   * AMEX  | [optional] 
**status** | **String** | Valid Values:   * REJECTED   * RECEIVED   * VALIDATED   * DECLINED   * PROCESSING   * COMPLETE  | [optional] 
**totals** | [**InlineResponse2009EmbeddedTotals**](InlineResponse2009EmbeddedTotals.md) |  | [optional] 


