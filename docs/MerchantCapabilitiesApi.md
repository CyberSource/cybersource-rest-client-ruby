# CyberSource::MerchantCapabilitiesApi

All URIs are relative to *https://apitest.cybersource.com*

Method | HTTP request | Description
------------- | ------------- | -------------
[**activate_merchant_key**](MerchantCapabilitiesApi.md#activate_merchant_key) | **POST** /icc/v1/merchants/{merchantId}/keys/{keyId}/activate | Activate a merchant key
[**add_merchant_key**](MerchantCapabilitiesApi.md#add_merchant_key) | **POST** /icc/v1/merchants/{merchantId}/keys | Add a key to a merchant
[**deactivate_merchant_key**](MerchantCapabilitiesApi.md#deactivate_merchant_key) | **DELETE** /icc/v1/merchants/{merchantId}/keys/{keyId} | Deactivate a merchant key
[**get_all_products**](MerchantCapabilitiesApi.md#get_all_products) | **GET** /icc/v1/products | Get All Products
[**get_merchant**](MerchantCapabilitiesApi.md#get_merchant) | **GET** /icc/v1/merchants/{merchantId} | Get a merchant
[**get_merchant_key**](MerchantCapabilitiesApi.md#get_merchant_key) | **GET** /icc/v1/merchants/{merchantId}/keys/{keyId} | Get a key by merchant and key ID
[**get_product**](MerchantCapabilitiesApi.md#get_product) | **GET** /icc/v1/products/{product_id} | Get Product by ID
[**ingest_product_feed_json**](MerchantCapabilitiesApi.md#ingest_product_feed_json) | **POST** /icc/v1/products/feed | Ingest Product Feed
[**list_merchant_keys**](MerchantCapabilitiesApi.md#list_merchant_keys) | **GET** /icc/v1/merchants/{merchantId}/keys | List keys for a merchant
[**register_merchant**](MerchantCapabilitiesApi.md#register_merchant) | **POST** /icc/v1/merchants | Register a merchant
[**update_merchant**](MerchantCapabilitiesApi.md#update_merchant) | **PUT** /icc/v1/merchants/{merchantId} | Update a merchant
[**update_merchant_key**](MerchantCapabilitiesApi.md#update_merchant_key) | **PUT** /icc/v1/merchants/{merchantId}/keys/{keyId} | Update a merchant key


# **activate_merchant_key**
> ActivateMerchantKeyResponse200 activate_merchant_key(merchant_id, key_id)

Activate a merchant key

Activate a deactivated key. Raises 403 if merchant is deactivated, 404 if merchant or key not found, 409 if key is already active.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

merchant_id = 'merchant_id_example' # String | Unique merchant identifier (UUID)

key_id = 'key_id_example' # String | Unique key identifier (UUID)


begin
  #Activate a merchant key
  result = api_instance.activate_merchant_key(merchant_id, key_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->activate_merchant_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **String**| Unique merchant identifier (UUID) | 
 **key_id** | **String**| Unique key identifier (UUID) | 

### Return type

[**ActivateMerchantKeyResponse200**](ActivateMerchantKeyResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **add_merchant_key**
> ActivateMerchantKeyResponse200 add_merchant_key(merchant_id, key_request)

Add a key to a merchant

Add a new encryption key for a merchant. Raises 401 if not authenticated, 403 if caller does not own the merchant, 404 if merchant not found.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

merchant_id = 'merchant_id_example' # String | Unique merchant identifier (UUID)

key_request = CyberSource::KeyRequest1.new # KeyRequest1 | Key creation request


begin
  #Add a key to a merchant
  result = api_instance.add_merchant_key(merchant_id, key_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->add_merchant_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **String**| Unique merchant identifier (UUID) | 
 **key_request** | [**KeyRequest1**](KeyRequest1.md)| Key creation request | 

### Return type

[**ActivateMerchantKeyResponse200**](ActivateMerchantKeyResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **deactivate_merchant_key**
> DeactivateMerchantKeyResponse200 deactivate_merchant_key(merchant_id, key_id)

Deactivate a merchant key

Deactivate a key (soft delete). Raises 401 if not authenticated, 403 if caller does not own the merchant, 404 if key not found.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

merchant_id = 'merchant_id_example' # String | Unique merchant identifier (UUID)

key_id = 'key_id_example' # String | Unique key identifier (UUID)


begin
  #Deactivate a merchant key
  result = api_instance.deactivate_merchant_key(merchant_id, key_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->deactivate_merchant_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **String**| Unique merchant identifier (UUID) | 
 **key_id** | **String**| Unique key identifier (UUID) | 

### Return type

[**DeactivateMerchantKeyResponse200**](DeactivateMerchantKeyResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_all_products**
> InlineResponse20020 get_all_products(get_all_products_request, opts)

Get All Products

Returns the full product catalog stored in ACG.  **Note:** This endpoint is intended for catalog verification and merchant tooling. It is not a real-time product discovery API for end buyers. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

get_all_products_request = nil # Object | Empty request body.

opts = { 
  page: 0, # Integer | Page number to retrieve (0-based). Defaults to 0.
  size: 300 # Integer | Number of products per page. Defaults to 300. Server enforces a maximum of 1000; values above 1000 are capped. 
}

begin
  #Get All Products
  result = api_instance.get_all_products(get_all_products_request, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->get_all_products: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **get_all_products_request** | **Object**| Empty request body. | 
 **page** | **Integer**| Page number to retrieve (0-based). Defaults to 0. | [optional] [default to 0]
 **size** | **Integer**| Number of products per page. Defaults to 300. Server enforces a maximum of 1000; values above 1000 are capped.  | [optional] [default to 300]

### Return type

[**InlineResponse20020**](InlineResponse20020.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_merchant**
> MerchantRegistrationResponse201 get_merchant(merchant_id)

Get a merchant

Get merchant by ID with all associated keys. Raises 404 if merchant not found.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

merchant_id = 'merchant_id_example' # String | Unique merchant identifier (UUID)


begin
  #Get a merchant
  result = api_instance.get_merchant(merchant_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->get_merchant: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **String**| Unique merchant identifier (UUID) | 

### Return type

[**MerchantRegistrationResponse201**](MerchantRegistrationResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_merchant_key**
> ActivateMerchantKeyResponse200 get_merchant_key(merchant_id, key_id)

Get a key by merchant and key ID

Get a specific key by merchant ID and key ID. Raises 401 if not authenticated, 404 if key not found.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

merchant_id = 'merchant_id_example' # String | Unique merchant identifier (UUID)

key_id = 'key_id_example' # String | Unique key identifier (UUID)


begin
  #Get a key by merchant and key ID
  result = api_instance.get_merchant_key(merchant_id, key_id)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->get_merchant_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **String**| Unique merchant identifier (UUID) | 
 **key_id** | **String**| Unique key identifier (UUID) | 

### Return type

[**ActivateMerchantKeyResponse200**](ActivateMerchantKeyResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **get_product**
> InlineResponse20021 get_product(product_id, get_product_request)

Get Product by ID

Retrieves a single product from the ACG catalog by its unique product identifier (SKU).  Use this to verify that a product was ingested correctly, inspect its current field values, or check its syndication-eligibility flags (`is_eligible_search`, `is_eligible_checkout`). 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

product_id = 'product_id_example' # String | The unique product identifier (SKU) assigned by the merchant and provided during feed ingestion. Example: `SKU-1001`. 

get_product_request = nil # Object | Empty request body.


begin
  #Get Product by ID
  result = api_instance.get_product(product_id, get_product_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->get_product: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **product_id** | **String**| The unique product identifier (SKU) assigned by the merchant and provided during feed ingestion. Example: &#x60;SKU-1001&#x60;.  | 
 **get_product_request** | **Object**| Empty request body. | 

### Return type

[**InlineResponse20021**](InlineResponse20021.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **ingest_product_feed_json**
> InlineResponse20019 ingest_product_feed_json(product_feed_request)

Ingest Product Feed

Uploads a merchant product catalog to ACG and triggers asynchronous syndication to all configured protocol backends (e.g. Google Merchant Center).  **Processing pipeline:** 1. Each product is validated against UCP/ACP schema requirements (required fields, format rules) 2. Valid products are saved to the ACG catalog 3. An async syndication job is triggered to push the catalog to configured backends 4. A `feed_id` is returned — use this with the Syndication Status endpoint to monitor progress  **Supported content types:** `application/json` (this endpoint). CSV and JSONL uploads are also supported via file upload endpoints.  **Partial success:** If some products fail validation, the response status is `PARTIAL_SUCCESS` and the `errors` array lists the per-product validation failures. Successfully validated products are still ingested and syndicated. 

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

product_feed_request = CyberSource::ProductFeedRequest.new # ProductFeedRequest | Product feed payload. The `products` array is required and must contain at least one product. See `ProductInput` for the full list of required fields. 


begin
  #Ingest Product Feed
  result = api_instance.ingest_product_feed_json(product_feed_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->ingest_product_feed_json: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **product_feed_request** | [**ProductFeedRequest**](ProductFeedRequest.md)| Product feed payload. The &#x60;products&#x60; array is required and must contain at least one product. See &#x60;ProductInput&#x60; for the full list of required fields.  | 

### Return type

[**InlineResponse20019**](InlineResponse20019.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **list_merchant_keys**
> ListMerchantKeysResponse200 list_merchant_keys(merchant_id, opts)

List keys for a merchant

List all keys for a specific merchant with optional filtering by status. Raises 404 if merchant not found.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

merchant_id = 'merchant_id_example' # String | Unique merchant identifier (UUID)

opts = { 
  status: 'status_example' # String | Filter by key status: 'active', 'deactivated', or 'expired'. Omit to return all keys.
}

begin
  #List keys for a merchant
  result = api_instance.list_merchant_keys(merchant_id, opts)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->list_merchant_keys: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **String**| Unique merchant identifier (UUID) | 
 **status** | **String**| Filter by key status: &#39;active&#39;, &#39;deactivated&#39;, or &#39;expired&#39;. Omit to return all keys. | [optional] 

### Return type

[**ListMerchantKeysResponse200**](ListMerchantKeysResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **register_merchant**
> MerchantRegistrationResponse201 register_merchant(merchant_request)

Register a merchant

Onboard a new merchant into the VMRS. The merchant declares how they want payment data delivered: cryptogram type (TAVV or DAVV), transaction indicator (TAP, ACG, or Both), whether credentials should be encrypted, and their public encryption key if encryption is enabled. Raises 409 if merchantUrl or vmid already exists.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

merchant_request = CyberSource::MerchantRequest.new # MerchantRequest | Merchant registration request


begin
  #Register a merchant
  result = api_instance.register_merchant(merchant_request)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->register_merchant: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_request** | [**MerchantRequest**](MerchantRequest.md)| Merchant registration request | 

### Return type

[**MerchantRegistrationResponse201**](MerchantRegistrationResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_merchant**
> MerchantRegistrationResponse201 update_merchant(merchant_id, merchant_update)

Update a merchant

Update merchant configuration. Updatable fields: merchantName, merchantUrl, cryptogramType, acceptanceRelationships, protocolInteractions, webIntegrations, apiIntegrations. Partial updates are supported — only provided fields are changed. The vmid, indicator, and paymentPayloadType fields are not updatable here; use the enable/disable-payment-encryption endpoints for encryption changes. Raises 404 if merchant not found, 403 if merchant is deactivated, 409 if new merchantUrl already exists.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

merchant_id = 'merchant_id_example' # String | Unique merchant identifier (UUID)

merchant_update = CyberSource::MerchantUpdate.new # MerchantUpdate | Merchant update request


begin
  #Update a merchant
  result = api_instance.update_merchant(merchant_id, merchant_update)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->update_merchant: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **String**| Unique merchant identifier (UUID) | 
 **merchant_update** | [**MerchantUpdate**](MerchantUpdate.md)| Merchant update request | 

### Return type

[**MerchantRegistrationResponse201**](MerchantRegistrationResponse201.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



# **update_merchant_key**
> ActivateMerchantKeyResponse200 update_merchant_key(merchant_id, key_id, key_update)

Update a merchant key

Update key information. Updatable fields are keyName, encryptionKey, algorithm, encryptionType, and expirationDate. Raises 401 if not authenticated, 403 if caller does not own the merchant or if merchant/key is deactivated, 404 if merchant or key not found, 409 if new keyName already exists.

### Example
```ruby
# load the gem
require 'cybersource_rest_client'

api_instance = CyberSource::MerchantCapabilitiesApi.new

merchant_id = 'merchant_id_example' # String | Unique merchant identifier (UUID)

key_id = 'key_id_example' # String | Unique key identifier (UUID)

key_update = CyberSource::KeyUpdate1.new # KeyUpdate1 | Key update request


begin
  #Update a merchant key
  result = api_instance.update_merchant_key(merchant_id, key_id, key_update)
  p result
rescue CyberSource::ApiError => e
  puts "Exception when calling MerchantCapabilitiesApi->update_merchant_key: #{e}"
end
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **merchant_id** | **String**| Unique merchant identifier (UUID) | 
 **key_id** | **String**| Unique key identifier (UUID) | 
 **key_update** | [**KeyUpdate1**](KeyUpdate1.md)| Key update request | 

### Return type

[**ActivateMerchantKeyResponse200**](ActivateMerchantKeyResponse200.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json;charset=utf-8
 - **Accept**: application/hal+json;charset=utf-8



