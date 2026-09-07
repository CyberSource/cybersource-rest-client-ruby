# CyberSource::UnifiedriskPaymentBankAccount

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | **String** | Account type: CHECKING, SAVINGS, CORPORATE, etc | [optional] 
**number** | **String** | Masked or tokenized account number | [optional] 
**number_format** | **String** | Account number format: IBAN, BBAN, etc | [optional] 
**routing_number** | **String** | Bank routing/transit number | [optional] 
**iban** | **String** | International Bank Account Number | [optional] 
**swift_code** | **String** | Bank SWIFT/BIC code | [optional] 
**bank_code** | **String** | Bank code | [optional] 
**check_number** | **String** | Check number for check payments | [optional] 
**check_image_reference** | **String** | Check image reference number | [optional] 
**encoder_id** | **String** | Bank encoder identifier for encoded account numbers | [optional] 
**branch_id** | **String** | Bank branch identifier | [optional] 
**flags** | **Array&lt;String&gt;** | Account flags: VIP, COMPROMISED, etc | [optional] 
**account_holder_name** | **String** | Full name of the person or business that owns the bank account | [optional] 
**added_at_checkout** | **BOOLEAN** | Whether the bank account was newly entered during checkout | [optional] 
**financial_institution** | [**UnifiedriskPaymentBankAccountFinancialInstitution**](UnifiedriskPaymentBankAccountFinancialInstitution.md) |  | [optional] 
**balance_before** | [**UnifiedriskPaymentBankAccountBalanceBefore**](UnifiedriskPaymentBankAccountBalanceBefore.md) |  | [optional] 
**credit_limit** | [**UnifiedriskPaymentBankAccountCreditLimit**](UnifiedriskPaymentBankAccountCreditLimit.md) |  | [optional] 
**branch_address** | [**UnifiedriskPaymentBankAccountBranchAddress**](UnifiedriskPaymentBankAccountBranchAddress.md) |  | [optional] 
**sub_type** | **String** | Sub-category of the bank account type providing more specific classification (e.g., PERSONAL_CHECKING, BUSINESS_SAVINGS, CORPORATE_CURRENT). Used for risk segmentation within account types | [optional] 
**account_open_date** | **String** | Date when the bank account was originally opened, in ISO 8601 format (YYYY-MM-DD). Account tenure is a key risk factor - newer accounts carry higher fraud risk | [optional] 


