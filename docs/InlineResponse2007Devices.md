# CyberSource::InlineResponse2007Devices

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reader_id** | **String** |  | [optional] 
**serial_number** | **String** |  | [optional] 
**model** | **String** |  | [optional] 
**make** | **String** |  | [optional] 
**hardware_revision** | **String** |  | [optional] 
**status** | **String** | Status of the device. Possible Values:   - &#39;ACTIVE&#39;   - &#39;INACTIVE&#39;  | [optional] 
**status_change_reason** | **String** | Reason for change in status. | [optional] 
**merchant_id** | **String** | ID of the merchant to whom this device is assigned. | [optional] 
**account_id** | **String** | ID of the account to whom the device assigned. | [optional] 
**terminal_creation_date** | **DateTime** | Timestamp in which the device was created. | [optional] 
**terminal_updation_date** | **DateTime** | Timestamp in which the device was updated/modified. | [optional] 
**payment_processor_to_terminal_map** | [**InlineResponse2007PaymentProcessorToTerminalMap**](InlineResponse2007PaymentProcessorToTerminalMap.md) |  | [optional] 


