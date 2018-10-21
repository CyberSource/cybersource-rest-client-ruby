# CyberSource::InlineResponse2002OrderInformationAmountDetails

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**authorized_amount** | **String** | Amount that was authorized.  | [optional] 
**total_amount** | **String** | Grand total for the order. You can include a decimal point (.), but no other special characters. CyberSource truncates the amount to the correct number of decimal places.  * CTV, FDCCompass, Paymentech (&lt;&#x3D; 12)  For processor-specific information, see the grand_total_amount field in [Credit Card Services Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/CC_Svcs_SCMP_API/html)  | [optional] 
**currency** | **String** | Currency used for the order. Use the three-character ISO Standard Currency Codes.  For an authorization reversal or a capture, you must use the same currency that you used in your request for Payment API.  | [optional] 
**discount_amount** | **String** | Total discount amount applied to the order.  For processor-specific information, see the order_discount_amount field in [Level II and Level III Processing Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/Level_2_3_SCMP_API/html)  | [optional] 
**duty_amount** | **String** | Total charges for any import or export duties included in the order.  For processor-specific information, see the duty_amount field in [Level II and Level III Processing Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/Level_2_3_SCMP_API/html)  | [optional] 
**tax_amount** | **String** | Total tax amount for all the items in the order.  For processor-specific information, see the total_tax_amount field in [Level II and Level III Processing Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/Level_2_3_SCMP_API/html)  | [optional] 
**national_tax_included** | **String** | Flag that indicates whether a national tax is included in the order total.  Possible values:   - **0**: national tax not included  - **1**: national tax included  For processor-specific information, see the national_tax_indicator field in [Level II and Level III Processing Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/Level_2_3_SCMP_API/html)  | [optional] 
**freight_amount** | **String** | Total freight or shipping and handling charges for the order. When you include this field in your request, you must also include the **totalAmount** field.  For processor-specific information, see the freight_amount field in [Level II and Level III Processing Using the SCMP API.](http://apps.cybersource.com/library/documentation/dev_guides/Level_2_3_SCMP_API/html)  | [optional] 
**tax_details** | [**Array&lt;V2paymentsOrderInformationAmountDetailsTaxDetails&gt;**](V2paymentsOrderInformationAmountDetailsTaxDetails.md) |  | [optional] 


