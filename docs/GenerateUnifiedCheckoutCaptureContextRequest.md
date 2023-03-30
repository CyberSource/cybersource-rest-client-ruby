# CyberSource::GenerateUnifiedCheckoutCaptureContextRequest

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**target_origins** | **Array&lt;String&gt;** |  | [optional] 
**client_version** | **String** | version number of Unified Checkout being used | [optional] 
**allowed_card_networks** | **Array&lt;String&gt;** |  | [optional] 
**allowed_payment_types** | **Array&lt;String&gt;** |  | [optional] 
**country** | **String** | Country the purchase is originating from (e.g. country of the merchant). Use the two- character ISO Standard | [optional] 
**locale** | **String** | Localization of the User experience conforming to the ISO 639-1 language standards and two-character ISO Standard Country Code | [optional] 
**capture_mandate** | [**Upv1capturecontextsCaptureMandate**](Upv1capturecontextsCaptureMandate.md) |  | [optional] 
**order_information** | [**Upv1capturecontextsOrderInformation**](Upv1capturecontextsOrderInformation.md) |  | [optional] 
**checkout_api_initialization** | [**Upv1capturecontextsCheckoutApiInitialization**](Upv1capturecontextsCheckoutApiInitialization.md) |  | [optional] 


