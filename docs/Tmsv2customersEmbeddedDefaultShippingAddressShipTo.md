# CyberSource::Tmsv2customersEmbeddedDefaultShippingAddressShipTo

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**first_name** | **String** | First name of the recipient.  | [optional] 
**last_name** | **String** | Last name of the recipient.  | [optional] 
**company** | **String** | Company associated with the shipping address.  | [optional] 
**address1** | **String** | First line of the shipping address.  | [optional] 
**address2** | **String** | Second line of the shipping address.  | [optional] 
**locality** | **String** | City of the shipping address.  | [optional] 
**administrative_area** | **String** | State or province of the shipping address. Use 2 character the State, Province, and Territory Codes for the United States and Canada.  | [optional] 
**postal_code** | **String** | Postal code for the shipping address. The postal code must consist of 5 to 9 digits.  When the billing country is the U.S., the 9-digit postal code must follow this format: [5 digits][dash][4 digits]  Example 12345-6789  When the billing country is Canada, the 6-digit postal code must follow this format: [alpha][numeric][alpha][space][numeric][alpha][numeric]  Example A1B 2C3  **American Express Direct**\\ Before sending the postal code to the processor, all nonalphanumeric characters are removed and, if the remaining value is longer than nine characters, truncates the value starting from the right side.  | [optional] 
**country** | **String** | Country of the shipping address. Use the two-character ISO Standard Country Codes.  | [optional] 
**email** | **String** | Email associated with the shipping address.  | [optional] 
**phone_number** | **String** | Phone number associated with the shipping address.  | [optional] 


