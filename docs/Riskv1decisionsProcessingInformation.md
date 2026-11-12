# CyberSource::Riskv1decisionsProcessingInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**action_list** | **Array&lt;String&gt;** | - Use &#x60;CONSUMER_AUTHENTICATION&#x60; to use Payer Authentication along with Decision Manager. For any other value, only Decision Manager will run. - Use &#x60;WATCHLIST_SCREENING&#x60;  when you want to call Watchlist Screening service.  | [optional] 
**business_application_id** | **String** | Required for AFT and OCT transactions.  Given below is a list of all the BAI values available. However, the processors may support only few specific BAI values.  - AA : Account-to-account  - BB : Supplier Payments - BI : Bank-Initiated P2P Money Transfer - BP : Non-Card Bill Pay/Bill Pay - CD : Cash Deposit - CP : Credit card Bill Payment - FD : Funds disbursement  - FT : Funds transfer - GD : Government Disbursement - GP : Gambling payout (non-online gambling) - LO : Loyalty credits and rebates - MD : Merchant Settlement - OG : Online Gambling Payout - PD : Payroll and pension disbursement - PP : Person-to-Person or Peer-to-Peer - TU : Top up, prepaid load - WT : Digital wallet   | [optional] 
**purpose_of_payment** | **String** | This field is applicable for AFT and OCT transactions. For list of supported values, please refer to Developer Guide.  | [optional] 
**pre_auth_status** | **String** | Outcome of a pre-authorization process. Used when processing payment outside of CyberSource and sent to Decision Manager post-authorisation. Possible values: Approved, Rejected, Hold.  | [optional] 
**pre_auth_response_code** | **String** | Alphanumeric code returned by the issuer or payment gateway during the pre-authorization stage of a transaction.  | [optional] 
**authorization_options** | [**Riskv1decisionsProcessingInformationAuthorizationOptions**](Riskv1decisionsProcessingInformationAuthorizationOptions.md) |  | [optional] 


