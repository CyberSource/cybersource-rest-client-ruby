# CyberSource::RequestBody1

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**organization_id** | **String** | Valid CyberSource Organization Id | [optional] 
**report_definition_name** | **String** |  | [optional] 
**report_fields** | **Array&lt;String&gt;** | List of fields which needs to get included in a report | [optional] 
**report_mime_type** | **String** |  Format of the report | [optional] 
**report_name** | **String** | Name of the report | [optional] 
**timezone** | **String** | Timezone of the report | [optional] 
**report_start_time** | **DateTime** | Start time of the report | [optional] 
**report_end_time** | **DateTime** | End time of the report | [optional] 
**report_filters** | **Hash&lt;String, Array&lt;String&gt;&gt;** |  | [optional] 
**report_preferences** | [**ReportingV3ReportSubscriptionsGet200ResponseReportPreferences**](ReportingV3ReportSubscriptionsGet200ResponseReportPreferences.md) |  | [optional] 
**selected_merchant_group_name** | **String** | Specifies the group name | [optional] 


