# CyberSource::Upv1capturecontextsDataOrderInformationBillTo

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**address1** | **String** | Payment card billing street address as it appears on the credit card issuer&#39;s records.  | [optional] 
**address2** | **String** | Used for additional address information. For example: _Attention: Accounts Payable_ Optional field.  | [optional] 
**address3** | **String** | Additional address information (third line of the billing address) | [optional] 
**address4** | **String** | Additional address information (fourth line of the billing address)  | [optional] 
**administrative_area** | **String** | State or province of the billing address. Use the [State, Province, and Territory Codes for the United States and Canada](https://developer.cybersource.com/library/documentation/sbc/quickref/states_and_provinces.pdf).  | [optional] 
**building_number** | **String** | Building number in the street address.  | [optional] 
**country** | **String** | Payment card billing country. Use the two-character [ISO Standard Country Codes](http://apps.cybersource.com/library/documentation/sbc/quickref/countries_alpha_list.pdf).  | [optional] 
**district** | **String** | Customer&#39;s neighborhood, community, or region (a barrio in Brazil) within the city or municipality  | [optional] 
**locality** | **String** | Payment card billing city.  | [optional] 
**postal_code** | **String** | Postal code for the billing address. The postal code must consist of 5 to 9 digits.  | [optional] 
**company** | [**Upv1capturecontextsDataOrderInformationBillToCompany**](Upv1capturecontextsDataOrderInformationBillToCompany.md) |  | [optional] 
**email** | **String** | Customer&#39;s email address, including the full domain name.  | [optional] 
**first_name** | **String** | Customer&#39;s first name. This name must be the same as the name on the card | [optional] 
**last_name** | **String** | Customer&#39;s last name. This name must be the same as the name on the card.  | [optional] 
**middle_name** | **String** | Customer&#39;s middle name.  | [optional] 
**name_suffix** | **String** | Customer&#39;s name suffix.  | [optional] 
**title** | **String** | Title.  | [optional] 
**phone_number** | **String** | Customer&#39;s phone number.  | [optional] 
**phone_type** | **String** | Customer&#39;s phone number type.  #### For Payouts: This field may be sent only for FDC Compass.  Possible Values: * day * home * night * work  | [optional] 


