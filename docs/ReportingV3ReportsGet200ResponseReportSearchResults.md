# CyberSource::ReportingV3ReportsGet200ResponseReportSearchResults

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**report_definition_id** | **String** | Unique Report Identifier of each report type | [optional] 
**report_name** | **String** | Name of the report specified by merchant while creating the report | [optional] 
**report_mime_type** | **String** | Format of the report to get generated  Valid values: - application/xml - text/csv  | [optional] 
**report_frequency** | **String** | Frequency of the report to get generated  Valid values: - DAILY - WEEKLY - MONTHLY - ADHOC  | [optional] 
**status** | **String** | Status of the report  Valid values: - COMPLETED - PENDING - QUEUED - RUNNING - ERROR - NO_DATA  | [optional] 
**report_start_time** | **DateTime** | Specifies the report start time in ISO 8601 format | [optional] 
**report_end_time** | **DateTime** | Specifies the report end time in ISO 8601 format | [optional] 
**timezone** | **String** | Time Zone | [optional] 
**report_id** | **String** | Unique identifier generated for every reports | [optional] 
**organization_id** | **String** | CyberSource Merchant Id | [optional] 
**queued_time** | **DateTime** | Specifies the time of the report in queued  in ISO 8601 format | [optional] 
**report_generating_time** | **DateTime** | Specifies the time of the report started to generate  in ISO 8601 format | [optional] 
**report_completed_time** | **DateTime** | Specifies the time of the report completed the generation  in ISO 8601 format | [optional] 
**subscription_type** | **String** | Specifies whether the subscription created is either Custom, Standard or Classic  | [optional] 
**group_id** | **String** | Id for selected group. | [optional] 


