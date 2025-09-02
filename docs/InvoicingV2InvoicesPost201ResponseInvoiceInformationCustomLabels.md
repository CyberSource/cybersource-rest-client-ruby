# CyberSource::InvoicingV2InvoicesPost201ResponseInvoiceInformationCustomLabels

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**key** | **String** | The invoice field key. Possible values:   - billTo   - invoiceNumber   - customerId   - companyName   - description   - shipping   - partialPayment   - discount   - tax  | [optional] 
**value** | **String** | The new (overridden) field name | [optional] 
**hidden** | **BOOLEAN** | Hides the specified field. This field is applicable for keys:   - customerId   - companyName   - description   - shipping   - partialPayment  | [optional] [default to false]
**hidden_for_invoice** | **BOOLEAN** | Hides the field at invoice level. This field is applicable for keys:   - discount   - tax  | [optional] [default to false]
**hidden_for_item** | **BOOLEAN** | Hides the field at invoice item level. This field is applicable for keys:   - discount   - tax  | [optional] [default to false]


