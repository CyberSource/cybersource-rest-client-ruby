# CyberSource::InlineResponse20012ProcessingInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**payment_solution** | **String** | Type of digital payment solution that is being used for the transaction. Possible Values:   - **visacheckout**: Visa Checkout.  - **001**: Apple Pay.  - **005**: Masterpass. Required for Masterpass transactions on OmniPay Direct.  - **006**: Android Pay.  - **008**: Samsung Pay.  | [optional] 
**commerce_indicator** | **String** | Type of transaction. Some payment card companies use this information when determining discount rates. When you omit this field for **Ingenico ePayments**, the processor uses the default transaction type they have on file for you instead of the default value listed here.  | [optional] 
**business_application_id** | **String** | The description for this field is not available. | [optional] 
**authorization_options** | [**InlineResponse20012ProcessingInformationAuthorizationOptions**](InlineResponse20012ProcessingInformationAuthorizationOptions.md) |  | [optional] 
**bank_transfer_options** | [**InlineResponse20012ProcessingInformationBankTransferOptions**](InlineResponse20012ProcessingInformationBankTransferOptions.md) |  | [optional] 


