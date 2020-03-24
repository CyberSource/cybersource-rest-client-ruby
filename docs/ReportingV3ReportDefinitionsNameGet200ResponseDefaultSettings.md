# CyberSource::ReportingV3ReportDefinitionsNameGet200ResponseDefaultSettings

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**report_mime_type** | **String** | Report Format Valid values:   - application/xml   - text/csv  | [optional] 
**report_frequency** | **String** | Report Frequency Value Valid Values:   - DAILY   - WEEKLY   - MONTHLY   - ADHOC  | [optional] 
**report_name** | **String** | Report Name | [optional] 
**timezone** | **String** | Time Zone | [optional] 
**start_time** | **String** | Start Time | [optional] 
**start_day** | **Integer** | Start Day | [optional] 
**report_filters** | **Hash&lt;String, Array&lt;String&gt;&gt;** | List of filters to apply | [optional] 
**report_preferences** | [**Reportingv3reportsReportPreferences**](Reportingv3reportsReportPreferences.md) |  | [optional] 


