# CyberSource::V2paymentsProcessingInformationAuthorizationOptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**auth_type** | **String** | Authorization type. Possible values:   - **AUTOCAPTURE**: automatic capture.  - **STANDARDCAPTURE**: standard capture.  - **VERBAL**: forced capture. Include it in the payment request for a forced capture. Include it in the capture  request for a verbal payment.  For processor-specific information, see the auth_type field in [Credit Card Services Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html)  | [optional] 
**verbal_auth_code** | **String** | Authorization code.  **Forced Capture**  Use this field to send the authorization code you received from a payment that you authorized outside the CyberSource system.  **Verbal Authorization**  Use this field in CAPTURE API to send the verbally received authorization code.  For processor-specific information, see the auth_code field in [Credit Card Services Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html)  | [optional] 
**verbal_auth_transaction_id** | **String** | Transaction ID (TID). | [optional] 
**auth_indicator** | **String** | Flag that specifies the purpose of the authorization.  Possible values:  - **0**: Preauthorization  - **1**: Final authorization  For processor-specific information, see the auth_indicator field in [Credit Card Services Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html)  | [optional] 
**partial_auth_indicator** | **BOOLEAN** | Flag that indicates whether the transaction is enabled for partial authorization or not. When your request includes this field, this value overrides the information in your CyberSource account.  For processor-specific information, see the auth_partial_auth_indicator field in [Credit Card Services Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html)  | [optional] 
**balance_inquiry** | **BOOLEAN** | Flag that indicates whether to return balance information. | [optional] 
**ignore_avs_result** | **BOOLEAN** | Flag that indicates whether to allow the capture service to run even when the payment receives an AVS decline.  | [optional] [default to false]
**decline_avs_flags** | **Array&lt;String&gt;** | An array of AVS flags that cause the reply flag to be returned.  &#x60;Important&#x60; To receive declines for the AVS code N, include the value N in the array.  | [optional] 
**ignore_cv_result** | **BOOLEAN** | Flag that indicates whether to allow the capture service to run even when the payment receives a CVN decline.  | [optional] [default to false]
**initiator** | [**V2paymentsProcessingInformationAuthorizationOptionsInitiator**](V2paymentsProcessingInformationAuthorizationOptionsInitiator.md) |  | [optional] 


