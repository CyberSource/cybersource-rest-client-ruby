# CyberSource::Ptsv2paymentreferencesProcessingInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**session_type** | **String** | Will have 2 values, &#39;U&#39; (Update) , &#39;N&#39; (New). Any other values will be rejected. Default will be &#39;N&#39;  | [optional] 
**payment_flow_mode** | **String** | Whether merchant wants to pass the flow Inline or want to invoke Klarna Hosted Page  | [optional] 
**action_list** | **Array&lt;String&gt;** | Possible values are one or more of follows:   - &#x60;AP_SESSIONS&#x60;: Use this when Alternative Payment Sessions service is requested.  | [optional] 


