# CyberSource::ReportingV3ReportsIdGet200Response

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**organization_id** | **String** | CyberSource merchant id | [optional] 
**report_id** | **String** | Report ID Value | [optional] 
**report_definition_id** | **String** | Report definition Id | [optional] 
**report_name** | **String** | Report Name | [optional] 
**report_mime_type** | **String** | Report Format  Valid values: - application/xml - text/csv  | [optional] 
**report_frequency** | **String** | Report Frequency Value  Valid values: - DAILY - WEEKLY - MONTHLY - ADHOC  | [optional] 
**report_fields** | **Array&lt;String&gt;** | List of Integer Values | [optional] 
**report_status** | **String** | Report Status Value  Valid values: - COMPLETED - PENDING - QUEUED - RUNNING - ERROR - NO_DATA - RERUN  | [optional] 
**report_start_time** | **DateTime** | Report Start Time Value | [optional] 
**report_end_time** | **DateTime** | Report End Time Value | [optional] 
**timezone** | **String** | Time Zone Value | [optional] 
**report_filters** | **Hash&lt;String, Array&lt;String&gt;&gt;** | List of filters to apply | [optional] 
**report_preferences** | [**Reportingv3reportsReportPreferences**](Reportingv3reportsReportPreferences.md) |  | [optional] 
**group_id** | **String** | Id for selected group. | [optional] 


