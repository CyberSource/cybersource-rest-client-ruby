# CyberSource::Acpv1tokensDeviceInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**user_agent** | **String** | Base64 Encoded userAgent string of the connecting client application, with no padding.   User agent string of the connecting client application.   Conditionality:   - Required for browsers - Optional for non-browsers  | [optional] 
**application_name** | **String** | Name of the connecting client application. | 
**fingerprint_session_id** | **String** | Device Fingerprinting Session identifier. | 
**country** | **String** | ISO 3166-1 alpha-2 country code. The country where the Consumer is accessing the service from. | [optional] 
**device_data** | [**Acpv1tokensDeviceInformationDeviceData**](Acpv1tokensDeviceInformationDeviceData.md) |  | 
**ip_address** | **String** | IP address of the consumer&#39;s device. | 
**client_device_id** | **String** | Unique identifier of the consumer&#39;s device. | [optional] 


