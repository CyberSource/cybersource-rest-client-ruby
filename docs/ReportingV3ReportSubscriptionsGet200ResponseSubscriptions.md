# CyberSource::ReportingV3ReportSubscriptionsGet200ResponseSubscriptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**organization_id** | **String** | Selected Organization Id | [optional] 
**report_definition_id** | **String** | Report Definition Id | [optional] 
**report_definition_name** | **String** | Report Definition Class | [optional] 
**report_mime_type** | **String** | Report Format                          Valid values: - application/xml - text/csv  | [optional] 
**report_frequency** | **String** | &#39;Report Frequency&#39; **NOTE: Do not document USER_DEFINED Frequency field in developer center**  Valid values: - DAILY - WEEKLY - MONTHLY - USER_DEFINED  | [optional] 
**report_interval** | **String** | If the reportFrequency is User-defined, reportInterval should be in **ISO 8601 time format** Please refer the following link to know more about ISO 8601 format.[Rfc Time Format](https://en.wikipedia.org/wiki/ISO_8601#Durations)  **Example time format for 2 hours and 30 Mins:**   - PT2H30M **NOTE: Do not document reportInterval field in developer center**  | [optional] 
**report_name** | **String** | Report Name | [optional] 
**timezone** | **String** | Time Zone | [optional] 
**start_time** | **DateTime** | Start Time | [optional] 
**start_day** | **Integer** | Start Day | [optional] 
**report_fields** | **Array&lt;String&gt;** | List of all fields String values | [optional] 
**report_filters** | **Hash&lt;String, Array&lt;String&gt;&gt;** | List of filters to apply | [optional] 
**report_preferences** | [**Reportingv3reportsReportPreferences**](Reportingv3reportsReportPreferences.md) |  | [optional] 
**group_id** | **String** | Id for the selected group. | [optional] 


