# CyberSource::Ptsv2payoutsSenderInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**reference_number** | **String** | Reference number generated by you that uniquely identifies the sender. | [optional] 
**account** | [**Ptsv2payoutsSenderInformationAccount**](Ptsv2payoutsSenderInformationAccount.md) |  | [optional] 
**first_name** | **String** | First name of the sender. This field is applicable for AFT and OCT transactions.   Only alpha numeric values are supported.Special characters not in the standard ASCII character set, are not supported and will be stripped before being sent to the processor.  | [optional] 
**middle_initial** | **String** | Recipient middle initial (Optional).  | [optional] 
**middle_name** | **String** | Middle name of the sender. This field is applicable for AFT and OCT transactions.   Only alpha numeric values are supported. Special characters not in the standard ASCII character set, are not supported and will be stripped before being sent to sent to the processor.  | [optional] 
**last_name** | **String** | Last name of the sender. This field is applicable for AFT and OCT transactions.  Only alpha numeric values are supported. Special characters not in the standard ASCII character set, are not supported and will be stripped before being sent to sent to the processor.  | [optional] 
**name** | **String** | Name of sender.  **Funds Disbursement**  This value is the name of the originator sending the funds disbursement. * CTV, Paymentech (30)  | [optional] 
**address1** | **String** | Street address of sender.  **Funds Disbursement**  This value is the address of the originator sending the funds disbursement.  | [optional] 
**locality** | **String** | City of sender.  **Funds Disbursement**  This value is the city of the originator sending the funds disbursement.  | [optional] 
**administrative_area** | **String** | Sender&#39;s state. Use the [State, Province, and Territory Codes for the United States and Canada](https://developer.cybersource.com/library/documentation/sbc/quickref/states_and_provinces.pdf).  | [optional] 
**country_code** | **String** | Country of sender. Use the [ISO Standard Country Codes](https://developer.cybersource.com/library/documentation/sbc/quickref/countries_alpha_list.pdf). * CTV (3)  | [optional] 
**postal_code** | **String** | Sender&#39;s postal code. Required only for FDCCompass. | [optional] 
**phone_number** | **String** | Sender&#39;s phone number. Required only for FDCCompass. | [optional] 
**date_of_birth** | **String** | Sender&#39;s date of birth in YYYYMMDD format. Required only for FDCCompass. | [optional] 
**vat_registration_number** | **String** | Customer&#39;s government-assigned tax identification number.  | [optional] 
**personal_id_type** | **String** | #### Visa Platform Connect This tag will contain the type of sender identification. The valid values are: • BTHD (Date of birth) • CUID (Customer identification (unspecified)) • NTID (National identification) • PASN (Passport number) • DRLN (Driver license) • TXIN (Tax identification) • CPNY (Company registration number) • PRXY (Proxy identification) • SSNB (Social security number) • ARNB (Alien registration number) • LAWE (Law enforcement identification) • MILI (Military identification) • TRVL (Travel identification (non-passport)) • EMAL (Email) • PHON (Phone number)  | [optional] 
**type** | **String** | #### Visa Platform Connect This tag will denote whether the tax ID is a business or individual tax ID when personal ID Type contains the value of TXIN (Tax identification).  The valid values are: • B (Business) • I (Individual)  | [optional] 
**identification_number** | **String** | #### Visa Platform Connect This tag will contain an acquirer-populated value associated with the API : senderInformation.personalIdType which will identify the personal ID type of the sender.  | [optional] 
**alias_name** | **String** | Sender&#39;s alias name. | [optional] 


