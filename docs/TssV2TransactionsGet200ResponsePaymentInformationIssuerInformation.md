# CyberSource::TssV2TransactionsGet200ResponsePaymentInformationIssuerInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**name** | **String** | This field contains the issuer name.  | [optional] 
**country** | **String** | This field contains [2-character ISO Country Codes](http://apps.cybersource.com/library/documentation/sbc/quickref/countries_alpha_list.pdf) for the issuer.  | [optional] 
**bin_length** | **String** | This field contains the length of the BIN.  | [optional] 
**phone_number** | **String** | This field contains the customer service phone number for the issuer.  | [optional] 
**transaction_information** | **String** | In a Mastercard Transaction, this field contains the unique identifier (Transaction Link ID) for the first transaction in a transaction life cycle.  This ID is crucial for maintaining continuity and linking subsequent operations to the original transaction.  | [optional] 


