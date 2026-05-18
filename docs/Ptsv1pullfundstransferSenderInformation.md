# CyberSource::Ptsv1pullfundstransferSenderInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**postal_code** | **String** | Sender&#39;s postal code. This field is conditional: it is required if using neither a Customer nor Payment Instrument token.  | [optional] 
**first_name** | **String** | First name of sender. This field is conditional: it is required if using neither a Customer nor Payment Instrument token.  | [optional] 
**middle_initial** | **String** | Middle Initial of sender  | [optional] 
**middle_name** | **String** | This field contains the middle name of the entity funding the transaction.  | [optional] 
**last_name** | **String** | Last name of sender. This field is conditional: it is required if using neither a Customer nor Payment Instrument token.  | [optional] 
**address1** | **String** | Street address of sender. This field is conditional: it is required if using neither a Customer nor Payment Instrument token.  | [optional] 
**address2** | **String** | Second line of the sender&#39;s address.  | [optional] 
**locality** | **String** | City of sender. This field is conditional: it is required if using neither a Customer nor Payment Instrument token.  | [optional] 
**administrative_area** | **String** | Sender&#39;s state. Use the **State, Province, and Territory Codes for the United States and Canada**. This field is conditional: it is required if in the United States or Canada, and transaction is using neither a Customer nor Payment Instrument token.   Value must be an ISO Standard State Code: [https://developer.cybersource.com/library/documentation/sbc/quickref/states_and_provinces.pdf](https://developer.cybersource.com/library/documentation/sbc/quickref/states_and_provinces.pdf)  | [optional] 
**country** | **String** | Country of sender. Check that this field contains 2 character alpha ISO 3166-1 standard values. This field is conditional: it is required if using neither a Customer nor Payment Instrument token.  | [optional] 
**payment_information** | [**Ptsv1pullfundstransferSenderInformationPaymentInformation**](Ptsv1pullfundstransferSenderInformationPaymentInformation.md) |  | [optional] 
**consumer_authentication** | [**Ptsv1pullfundstransferSenderInformationConsumerAuthentication**](Ptsv1pullfundstransferSenderInformationConsumerAuthentication.md) |  | [optional] 
**personal_identification** | [**Ptsv1pullfundstransferSenderInformationPersonalIdentification**](Ptsv1pullfundstransferSenderInformationPersonalIdentification.md) |  | [optional] 
**reference_number** | **String** | Visa Direct(16 characters)   If the transaction is a money transfer, pre-paid load, or credit card bill pay, and if the sender intends to fund the transaction with a non-financial instrument (for example, cash), a reference number unique to the sender is required.   If the transaction is a funds disbursement, the field is required.  | [optional] 
**account** | [**Ptsv1pullfundstransferSenderInformationAccount**](Ptsv1pullfundstransferSenderInformationAccount.md) |  | [optional] 
**alias_name** | **String** | Sender&#39;s alias name.  | [optional] 
**country_of_birth** | **String** | Account Owner Country of Birth.  | [optional] 
**date_of_birth** | **String** | Sender&#39;s date of birth. Format: YYYYMMDD.  | [optional] 
**email** | **String** | Account Owner email address  | [optional] 
**name** | **String** | Name of sender. Use this field if the sender is a business.  | [optional] 
**nationality** | **String** | Account Owner Nationality  | [optional] 
**occupation** | **String** | Account Owner Occupation.  | [optional] 
**phone_number** | **String** | Sender&#39;s phone number.  | [optional] 
**type** | **String** | This field identifies if the sender is a business or an individual.   The valid values are:   • &#x60;B&#x60; (Business)   • &#x60;I&#x60; (Individual)  | [optional] 


