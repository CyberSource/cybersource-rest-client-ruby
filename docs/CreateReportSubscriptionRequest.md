# CyberSource::CreateReportSubscriptionRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**organization_id** | **String** | Valid CyberSource organizationId | [optional] 
**report_definition_name** | **String** | Valid Report Definition Name | 
**report_fields** | **Array&lt;String&gt;** |  | 
**report_mime_type** | **String** | Valid values: - application/xml - text/csv  | 
**report_frequency** | **String** | &#39;The frequency for which subscription is created.&#39;  Valid Values:   - &#39;DAILY&#39;   - &#39;WEEKLY&#39;   - &#39;MONTHLY&#39;   - &#39;USER_DEFINED&#39;  | 
**report_interval** | **String** | If the reportFrequency is User-defined, reportInterval should be in **ISO 8601 time format** Please refer the following link to know more about ISO 8601 format.[Rfc Time Format](https://en.wikipedia.org/wiki/ISO_8601#Durations)  **Example time format for 2 hours and 30 Mins:**   - PT2H30M **NOTE: Do not document reportInterval field in developer center**  | [optional] 
**report_name** | **String** |  | 
**timezone** | **String** |  | 
**start_time** | **String** | The hour at which the report generation should start. It should be in hhmm format. | 
**start_day** | **Integer** | This is the start day if the frequency is WEEKLY or MONTHLY. The value varies from 1-7 for WEEKLY and 1-31 for MONTHLY. For WEEKLY 1 means Sunday and 7 means Saturday. By default the value is 1. | [optional] 
**report_filters** | **Hash&lt;String, Array&lt;String&gt;&gt;** | List of filters to apply | [optional] 
**report_preferences** | [**Reportingv3reportsReportPreferences**](Reportingv3reportsReportPreferences.md) |  | [optional] 
**group_name** | **String** | Valid GroupName | [optional] 


