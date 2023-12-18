# CyberSource::PtsV2PaymentsPost201ResponseRiskInformationInfoCodes

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**velocity** | **Array&lt;String&gt;** | List of information codes triggered by the order. These information codes were generated when you created the order and product velocity rules and are returned so that you can associate them with the rules.  | [optional] 
**address** | **Array&lt;String&gt;** | Indicates a mismatch between the customer&#39;s billing and shipping addresses.  | [optional] 
**customer_list** | **Array&lt;String&gt;** | Indicates that customer information is associated with transactions that are either on the negative or the positive list.  | [optional] 
**device_behavior** | **Array&lt;String&gt;** | Indicates the device behavior information code(s) returned from device fingerprinting.  | [optional] 
**identity_change** | **Array&lt;String&gt;** | Indicates excessive identity changes. The threshold is variable depending on the identity elements being compared.  | [optional] 
**internet** | **Array&lt;String&gt;** | Indicates a problem with the customer&#39;s email address, IP address, or billing address.  | [optional] 
**phone** | **Array&lt;String&gt;** | Indicates a problem with the customer&#39;s phone number.  | [optional] 
**suspicious** | **Array&lt;String&gt;** | Indicates that the customer provided potentially suspicious information.  | [optional] 
**global_velocity** | **Array&lt;String&gt;** | Indicates that the customer has a high purchase frequency.  | [optional] 


