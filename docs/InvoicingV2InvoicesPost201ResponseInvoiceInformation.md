# CyberSource::InvoicingV2InvoicesPost201ResponseInvoiceInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**invoice_number** | **String** | Invoice Number. | [optional] 
**description** | **String** | The description included in the invoice. | [optional] 
**due_date** | **Date** | The invoice due date. This field is required for creating an invoice. Format: &#x60;YYYY-MM-DD&#x60;, where &#x60;YYYY&#x60; &#x3D; year, &#x60;MM&#x60; &#x3D; month, and &#x60;DD&#x60; &#x3D; day  | [optional] 
**expiration_date** | **Date** | Define an expiration date for the link.  Format: &#x60;YYYY-MM-DD&#x60;, where &#x60;YYYY&#x60; &#x3D; year, &#x60;MM&#x60; &#x3D; month, and &#x60;DD&#x60; &#x3D; day  | [optional] 
**allow_partial_payments** | **BOOLEAN** | If set to &#x60;true&#x60;, the payer can make a partial invoice payment. | [optional] [default to false]
**payment_link** | **String** | Returns the payment link to an invoice when the invoice status is &#x60;SENT&#x60;, &#x60;CREATED&#x60;, &#x60;PARTIAL&#x60;, or &#x60;PAID&#x60;. | [optional] 
**delivery_mode** | **String** | If this field is set to &#39;None&#39;, an invoice will be generated with the status &#39;CREATED&#39;, but no email will be dispatched.    Possible values:        - &#x60;None&#x60;   - &#x60;Email&#x60;     | [optional] 


