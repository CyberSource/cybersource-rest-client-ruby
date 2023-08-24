# CyberSource::BillingAgreementsApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**billing_agreements_de_registration**](BillingAgreementsApi.md#billing_agreements_de_registration) | **PATCH** /pts/v2/billing-agreements/{id} | Standing Instruction Cancellation or Modification
[**billing_agreements_intimation**](BillingAgreementsApi.md#billing_agreements_intimation) | **POST** /pts/v2/billing-agreements/{id}/intimations | Standing Instruction intimation
[**billing_agreements_registration**](BillingAgreementsApi.md#billing_agreements_registration) | **POST** /pts/v2/billing-agreements | Standing Instruction completion registration


# **billing_agreements_de_registration**
> PtsV2CreditsPost201Response1 billing_agreements_de_registration(modify_billing_agreement, id)

Standing Instruction Cancellation or Modification

Standing Instruction with or without Token

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::BillingAgreementsApi.new

modify_billing_agreement = CyberSource::ModifyBillingAgreement.new # ModifyBillingAgreement | 

id = "id_example" # String | ID for de-registration or cancellation of Billing Agreement


begin
  #Standing Instruction Cancellation or Modification
  result = api_instance.billing_agreements_de_registration(modify_billing_agreement, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling BillingAgreementsApi->billing_agreements_de_registration: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **modify_billing_agreement** | [**ModifyBillingAgreement**](ModifyBillingAgreement.md)|  | 
 **id** | **String**| ID for de-registration or cancellation of Billing Agreement | 

### Return type

[**PtsV2CreditsPost201Response1**](PtsV2CreditsPost201Response1.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **billing_agreements_intimation**
> PtsV2CreditsPost201Response1 billing_agreements_intimation(intimate_billing_agreement, id)

Standing Instruction intimation

Standing Instruction with or without Token.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::BillingAgreementsApi.new

intimate_billing_agreement = CyberSource::IntimateBillingAgreement.new # IntimateBillingAgreement | 

id = "id_example" # String | ID for intimation of Billing Agreement


begin
  #Standing Instruction intimation
  result = api_instance.billing_agreements_intimation(intimate_billing_agreement, id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling BillingAgreementsApi->billing_agreements_intimation: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **intimate_billing_agreement** | [**IntimateBillingAgreement**](IntimateBillingAgreement.md)|  | 
 **id** | **String**| ID for intimation of Billing Agreement | 

### Return type

[**PtsV2CreditsPost201Response1**](PtsV2CreditsPost201Response1.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **billing_agreements_registration**
> PtsV2CreditsPost201Response1 billing_agreements_registration(create_billing_agreement)

Standing Instruction completion registration

Standing Instruction with or without Token. Transaction amount in case First payment is coming along with registration. Only 2 decimal places allowed

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::BillingAgreementsApi.new

create_billing_agreement = CyberSource::CreateBillingAgreement.new # CreateBillingAgreement | 


begin
  #Standing Instruction completion registration
  result = api_instance.billing_agreements_registration(create_billing_agreement)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling BillingAgreementsApi->billing_agreements_registration: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **create_billing_agreement** | [**CreateBillingAgreement**](CreateBillingAgreement.md)|  | 

### Return type

[**PtsV2CreditsPost201Response1**](PtsV2CreditsPost201Response1.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



