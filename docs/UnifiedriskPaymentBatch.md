# CyberSource::UnifiedriskPaymentBatch

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**batch_number** | **String** | Unique sequential identifier for this batch within the batch file, used for tracking and reconciliation of ACH or BACS batch submissions | [optional] 
**category_purpose_description** | **String** | Human-readable description of the business purpose for the batch (e.g., \&quot;Payroll\&quot;, \&quot;Vendor Payments\&quot;). Corresponds to the ISO 20022 CategoryPurpose code | [optional] 
**end_of_batch_indicator** | **BOOLEAN** | Indicates this entry is the last record in the current batch. Used to signal batch boundary during file processing | [optional] 
**end_of_file_indicator** | **BOOLEAN** | Indicates this entry is the last record in the entire batch file. Used to trigger final file validation and processing | [optional] 
**entry_detail_rec_num** | **Float** | Sequential record number of the entry detail record within the batch, used for file integrity checks and record-level reconciliation | [optional] 
**file_id_modifier** | **String** | Single character modifier (A-Z) used to distinguish multiple batch files submitted on the same day for the same originator | [optional] 
**number_of_addenda_records** | **Float** | Count of addenda records associated with this batch entry, used for validating batch completeness during file processing | [optional] 
**service_class_code** | **String** | ACH service class code indicating the type of entries in the batch. Values - \&quot;200\&quot; (mixed), \&quot;220\&quot; (credits only), \&quot;225\&quot; (debits only), \&quot;280\&quot; (automated accounting) | [optional] 
**total_batch_count_in_file** | **Float** | Total number of batches contained in this file, used for file-level control validation and balancing | [optional] 
**total_batch_entries** | **Float** | Total count of entry detail records within this batch, used for batch-level balancing and reconciliation | [optional] 
**total_entry_count_in_file** | **Float** | Total count of all entry detail records across all batches in the file, used for file-level reconciliation | [optional] 
**total_entry_hash** | **Float** | Arithmetic sum of all routing transit numbers within the batch/file, used as a checksum for routing number validation | [optional] 
**total_transit_count_in_file** | **Float** | Total count of distinct routing transit numbers in the file, used for clearing house validation and routing verification | [optional] 


