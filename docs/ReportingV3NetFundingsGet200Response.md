# CyberSource::ReportingV3NetFundingsGet200Response

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**start_time** | **DateTime** | Valid report Start Date in **ISO 8601 format**. Please refer the following link to know more about ISO 8601 format. - https://xml2rfc.tools.ietf.org/public/rfc/html/rfc3339.html#anchor14  **Example:** - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZZ  | [optional] 
**end_time** | **DateTime** | Valid report End Date in **ISO 8601 format** **Example date format:** - yyyy-MM-dd&#39;T&#39;HH:mm:ss.SSSZZ  | [optional] 
**net_funding_summaries** | [**Array&lt;ReportingV3NetFundingsGet200ResponseNetFundingSummaries&gt;**](ReportingV3NetFundingsGet200ResponseNetFundingSummaries.md) | List of Netfunding summary objects | [optional] 
**total_purchases** | [**Array&lt;ReportingV3NetFundingsGet200ResponseTotalPurchases&gt;**](ReportingV3NetFundingsGet200ResponseTotalPurchases.md) | List of total purchases currency wise | [optional] 
**total_refunds** | [**Array&lt;ReportingV3NetFundingsGet200ResponseTotalPurchases&gt;**](ReportingV3NetFundingsGet200ResponseTotalPurchases.md) | List of total refunds currency wise | [optional] 
**total_fees** | [**Array&lt;ReportingV3NetFundingsGet200ResponseTotalPurchases&gt;**](ReportingV3NetFundingsGet200ResponseTotalPurchases.md) | List of total fees currency wise | [optional] 
**total_chargebacks** | [**Array&lt;ReportingV3NetFundingsGet200ResponseTotalPurchases&gt;**](ReportingV3NetFundingsGet200ResponseTotalPurchases.md) | List of total chargebacks currency wise | [optional] 
**net_total** | [**Array&lt;ReportingV3NetFundingsGet200ResponseTotalPurchases&gt;**](ReportingV3NetFundingsGet200ResponseTotalPurchases.md) | List of new total currency wise | [optional] 


