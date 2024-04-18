# CyberSource::PaymentsProductsCardProcessingSubscriptionInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**enabled** | **BOOLEAN** |  | [optional] 
**self_serviceability** | **String** | Indicates if the organization can enable this product using self service. | [optional] [default to &#39;NOT_SELF_SERVICEABLE&#39;]
**features** | [**Hash&lt;String, PaymentsProductsCardProcessingSubscriptionInformationFeatures&gt;**](PaymentsProductsCardProcessingSubscriptionInformationFeatures.md) | This is a map. The allowed keys are below. Value should be an object containing a sole boolean property - enabled. &lt;table&gt;    &lt;tr&gt;       &lt;td&gt;cardPresent&lt;/td&gt;    &lt;/tr&gt;    &lt;tr&gt;       &lt;td&gt;cardNotPresent&lt;/td&gt;    &lt;/tr&gt; &lt;/table&gt;  | [optional] 


