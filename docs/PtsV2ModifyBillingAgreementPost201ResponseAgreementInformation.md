# CyberSource::PtsV2ModifyBillingAgreementPost201ResponseAgreementInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **String** | Identifier for the mandate.  | [optional] 
**date_signed** | **String** | Date the mandate has been signed.  Format YYYYMMdd | [optional] 
**date_created** | **String** | Date the mandate has been created.  Format YYYYMMdd | [optional] 
**date_revoked** | **String** | Date the mandate has been revoked.  Format YYYYMMdd | [optional] 
**type** | **String** | Identifies the type of schedule as either recurring, one-off, split or usage.  Possible values: - recurring - oneoff - split - usage | [optional] 
**frequency** | **String** | Regularity with which the event occurs.  Possible values: - annual - monthly - quarterly - semiannual - weekly - daily - adhoc - intraday - fortnightly | [optional] 
**encoded_html** | **String** | Base64 encoded html string | [optional] 
**encoded_html_popup** | **String** | Base64 encoded popup html string | [optional] 
**url** | **String** | URL for redirecting the customer for creating the mandate.  | [optional] 
**transaction_id** | **String** | The Billing Agreement ID returned by processor (PayPal).  | [optional] 


