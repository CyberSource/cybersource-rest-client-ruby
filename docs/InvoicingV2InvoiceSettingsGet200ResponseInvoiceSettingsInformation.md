# CyberSource::InvoicingV2InvoiceSettingsGet200ResponseInvoiceSettingsInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**merchant_logo** | **String** | The image file, which must be encoded in Base64 format. Supported file formats are &#x60;png&#x60;, &#x60;jpg&#x60;, and &#x60;gif&#x60;. The image file size restriction is 1 MB. | [optional] 
**merchant_display_name** | **String** | The merchant&#39;s display name shown on the invoice. | [optional] 
**custom_email_message** | **String** | The content of the email message that we send to your customers. | [optional] 
**enable_reminders** | **BOOLEAN** | Whether you would like us to send an auto-generated reminder email to your invoice recipients. Currently, this reminder email is sent five days before the invoice is due and one day after it is past due. | [optional] 
**header_style** | [**InvoicingV2InvoiceSettingsGet200ResponseInvoiceSettingsInformationHeaderStyle**](InvoicingV2InvoiceSettingsGet200ResponseInvoiceSettingsInformationHeaderStyle.md) |  | [optional] 
**delivery_language** | **String** | The language of the email that we send to your customers. Possible values are &#x60;zh-CN&#x60;, &#x60;zh-TW&#x60;, &#x60;en-US&#x60;, &#x60;fr-FR&#x60;, &#x60;de-DE&#x60;, &#x60;ja-JP&#x60;, &#x60;pt-BR&#x60;, &#x60;ru-RU&#x60; and &#x60;es-419&#x60;. | [optional] 
**default_currency_code** | **String** | Currency used for the order. Use the three-character [ISO Standard Currency Codes.](http://apps.cybersource.com/library/documentation/sbc/quickref/currencies.pdf)  #### Used by **Authorization** Required field.  **Authorization Reversal** For an authorization reversal (&#x60;reversalInformation&#x60;) or a capture (&#x60;processingOptions.capture&#x60; is set to &#x60;true&#x60;), you must use the same currency that you used in your payment authorization request.  #### PIN Debit Currency for the amount you requested for the PIN debit purchase. This value is returned for partial authorizations. The issuing bank can approve a partial amount if the balance on the debit card is less than the requested transaction amount. For the possible values, see the [ISO Standard Currency Codes](https://developer.cybersource.com/library/documentation/sbc/quickref/currencies.pdf). Returned by PIN debit purchase.  For PIN debit reversal requests, you must use the same currency that was used for the PIN debit purchase or PIN debit credit that you are reversing. For the possible values, see the [ISO Standard Currency Codes](https://developer.cybersource.com/library/documentation/sbc/quickref/currencies.pdf).  Required field for PIN Debit purchase and PIN Debit credit requests. Optional field for PIN Debit reversal requests.  #### GPX This field is optional for reversing an authorization or credit.  #### DCC for First Data Your local currency.  #### Tax Calculation Required for international tax and value added tax only. Optional for U.S. and Canadian taxes. Your local currency.  | [optional] 
**payer_authentication3_ds_version** | **BOOLEAN** | The 3D Secure payer authentication status for a merchant&#39;s invoice payments. | [optional] [default to false]
**show_vat_number** | **BOOLEAN** | Display VAT number on Invoice. | [optional] [default to false]
**vat_registration_number** | **String** | Your government-assigned tax identification number.  #### Tax Calculation Required field for value added tax only. Not applicable to U.S. and Canadian taxes.   | [optional] 
**ship_to** | **BOOLEAN** | Collect the payers shipping address. | [optional] [default to false]
**phone_number** | **BOOLEAN** | Collect the payers phone number. | [optional] [default to false]
**email** | **BOOLEAN** | Collect the payers email address when the email address is not known or confirm it if it is known at the time of invoice creation. | [optional] [default to false]
**enable_merchant_email_notifications** | **BOOLEAN** | Whether you would like to receive payment notification for successful transaction | [optional] [default to false]


