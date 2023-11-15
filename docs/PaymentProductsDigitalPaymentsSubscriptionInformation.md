# CyberSource::PaymentProductsDigitalPaymentsSubscriptionInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enabled** | **BOOLEAN** |  | [optional] 
**self_serviceability** | **String** | Indicates if the organization can enable this product using self service. | [optional] [default to &quot;NOT_SELF_SERVICEABLE&quot;]
**features** | [**Hash&lt;String, PaymentProductsCardProcessingSubscriptionInformationFeatures&gt;**](PaymentProductsCardProcessingSubscriptionInformationFeatures.md) | Allowed values are; &lt;table&gt;    &lt;tr&gt;       &lt;td&gt;visaCheckout&lt;/td&gt;    &lt;/tr&gt;    &lt;tr&gt;       &lt;td&gt;applePay&lt;/td&gt;    &lt;/tr&gt;    &lt;tr&gt;       &lt;td&gt;samsungPay&lt;/td&gt;    &lt;/tr&gt;    &lt;tr&gt;        &lt;td&gt;googlePay&lt;/td&gt;     &lt;/tr&gt; &lt;/table&gt;  | [optional] 


