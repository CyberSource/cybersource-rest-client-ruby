# CyberSource::Ptsv2paymentsidcapturesProcessingInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**payment_solution** | **String** | Type of digital payment solution for the transaction. Possible Values:   - **visacheckout**: Visa Checkout. This value is required for Visa Checkout transactions. See Visa Checkout Using the SCMP API.  - **005**: Masterpass. This value is required for Masterpass transactions on OmniPay Direct. See \&quot;Masterpass,\&quot; page 153.  | [optional] 
**reconciliation_id** | **String** | Please check with Cybersource customer support to see if your merchant account is configured correctly so you can include this field in your request. * For Payouts: max length for FDCCompass is String (22).  | [optional] 
**link_id** | **String** | Value that links the current authorization request to the original authorization request. Set this value to the ID that was returned in the reply message from the original authorization request.  This value is used for:   - Partial authorizations: See \&quot;Partial Authorizations,\&quot; page 88.  - Split shipments: See \&quot;Split Shipments,\&quot; page 210.  | [optional] 
**report_group** | **String** | Attribute that lets you define custom grouping for your processor reports. This field is supported only for **Worldpay VAP**.  See \&quot;Report Groups,\&quot; page 234.  | [optional] 
**visa_checkout_id** | **String** | Identifier for the **Visa Checkout** order. Visa Checkout provides a unique order ID for every transaction in the Visa Checkout **callID** field.  For more details, see Visa Checkout Using the SCMP API.  | [optional] 
**purchase_level** | **String** | Set this field to 3 to indicate that the request includes Level III data. | [optional] 
**issuer** | [**Ptsv2paymentsIssuerInformation**](Ptsv2paymentsIssuerInformation.md) |  | [optional] 
**authorization_options** | [**Ptsv2paymentsidcapturesProcessingInformationAuthorizationOptions**](Ptsv2paymentsidcapturesProcessingInformationAuthorizationOptions.md) |  | [optional] 
**capture_options** | [**Ptsv2paymentsidcapturesProcessingInformationCaptureOptions**](Ptsv2paymentsidcapturesProcessingInformationCaptureOptions.md) |  | [optional] 


