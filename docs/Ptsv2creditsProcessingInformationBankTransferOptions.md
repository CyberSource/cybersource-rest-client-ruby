# CyberSource::Ptsv2creditsProcessingInformationBankTransferOptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**customer_memo** | **String** | Payment related information.  This information is included on the customer’s statement.  | [optional] 
**sec_code** | **String** | Authorization method used for the transaction. See \&quot;SEC Codes,\&quot; page 89.  TeleCheck Accepts only the following values: - **PPD** - **TEL** - **WEB**  | [optional] 
**terminal_city** | **String** | City in which the terminal is located. If more than four alphanumeric characters are submitted, the transaction will be declined.  You cannot include any special characters.  | [optional] 
**terminal_state** | **String** | State in which the terminal is located. If more than two alphanumeric characters are submitted, the transaction will be declined.  You cannot include any special characters.  | [optional] 
**effective_date** | **String** | Effective date for the transaction. The effective date must be within 45 days of the current day. If you do not include this value, CyberSource sets the effective date to the next business day.  Format: &#x60;MMDDYYYY&#x60;  Supported only for the CyberSource ACH Service.  | [optional] 
**partial_payment_id** | **String** | Identifier for a partial payment or partial credit.  The value for each debit request or credit request must be unique within the scope of the order. See \&quot;Multiple Partial Credits,\&quot; page 41.  | [optional] 
**settlement_method** | **String** | Method used for settlement.  Possible values: - **A**: Automated Clearing House (default for credits and for transactions using Canadian dollars) - **F**: Facsimile draft (U.S. dollars only) - **B**: Best possible (U.S. dollars only) (default if the field has not already been configured for your merchant ID)  See \&quot;Settlement Delivery Methods,\&quot; page 44.  | [optional] 


