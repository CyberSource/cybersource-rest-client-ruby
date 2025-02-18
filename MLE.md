[![Generic badge](https://img.shields.io/badge/MLE-NEW-GREEN.svg)](https://shields.io/)

# Message Level Encryption (MLE) Feature

This feature provides an implementation of Message Level Encryption (MLE) for APIs provided by CyberSource, integrated within our SDK. This feature ensures secure communication by encrypting messages at the application level before they are sent over the network.

## Configuration

### Global MLE Configuration

In the `merchantConfig` object, set the `useMLEGlobally` variable to enable or disable MLE for all supported APIs for the Rest SDK.

- **Variable**: `useMLEGlobally`
- **Type**: `Boolean`
- **Default**: `false`
- **Description**: Enables MLE globally for all APIs when set to `true`. If set to `true`, it will enable MLE for all API calls that support MLE by CyberSource, unless overridden by `mapToControlMLEonAPI`.

### API-level MLE Control

Optionally, you can control the MLE feature at the API level using the `mapToControlMLEonAPI` variable in the `merchantConfig` object.

- **Variable**: `mapToControlMLEonAPI`
- **Type**: `Hash of string to boolean`
- **Description**: Overrides the global MLE setting for specific APIs. The key is the function name of the API in the SDK, and the value is a boolean indicating whether MLE should be enabled (`true`) or disabled (`false`) for that specific API call.

### MLE Key Alias

Another optional parameter for MLE is `mleKeyAlias`, which specifies the key alias used to retrieve the MLE certificate from the JWT P12 file.

- **Variable**: `mleKeyAlias`
- **Type**: `String`
- **Default**: `CyberSource_SJC_US`
- **Description**: By default, CyberSource uses the `CyberSource_SJC_US` public certificate to encrypt the payload. However, users can override this default value by setting their own key alias.

## Notes

- If `useMLEGlobally` is set to true, it will enable MLE for all API calls that support MLE by CyberSource, unless overridden by `mapToControlMLEonAPI`.
- If `mapToControlMLEonAPI` is not provided or does not contain a specific API function name, the global `useMLEGlobally` setting will be applied.
- The `mleKeyAlias` parameter is optional and defaults to `CyberSource_SJC_US` if not specified by the user. Users can override this default value by setting their own key alias.
- Example configurations contain only properties related to MLE.

## Example Configuration

### Option 1: Enable MLE globally for all MLE supported APIs

```ruby
configuration_dictionary = {
"useMLEGlobally": true  # Globally MLE will be enabled for all MLE supported APIs
}
```

### Option 2: Enable/Disable MLE for specific APIs

```ruby
configuration_dictionary = {}
configuration_dictionary['useMLEGlobally'] = true # globally MLE will be enabled for all the MLE supported APIs by Cybs in SDK
mapToControlMLE = {
  'create_payment' => false, # only create_payment function will have MLE=false i.e. (/pts/v2/payments POST API) out of all MLE supported APIs
  'capture_payment' => true # capture_payment function will have MLE=true i.e.  (/pts/v2/payments/{id}/captures POST API), if it not in list of MLE supportedAPIs else it will already have MLE=true by global MLE parameter.
}
configuration_dictionary['mapToControlMLEonAPI'] = mapToControlMLE
# Set other properties
api_client = CyberSource::ApiClient.new
# Create API instance using the configuration dictionary
api_instance = CyberSource::PaymentsApi.new(api_client, configuration_dictionary)

```

### Option 3: Disable MLE globally and enable for specific APIs

```ruby
configuration_dictionary = {
  "useMLEGlobally": false,  # Globally MLE will be disabled for all APIs
  "mleKeyAlias": "Custom_Key_Alias" # optional if any custom value provided by Cybs
}
mapToControlMLE = {
  'apiFunctionName1' => false, # MLE will be disabled for this API
  'apiFunctionName2' => true # MLE will be enabled for this API
}
configuration_dictionary['mapToControlMLEonAPI'] = mapToControlMLE
```

In the above examples:
- MLE is enabled/disabled globally (`useMLEGlobally` is true/false).
- `apiFunctionName1` will have MLE disabled/enabled based on value provided.
- `apiFunctionName2` will have MLE enabled.
- `mleKeyAlias` is set to `Custom_Key_Alias`, overriding the default value.

Please refer to the given link for sample codes with MLE:


## Additional Information

### API Support

- MLE is initially designed to support a few APIs.
- It can be extended to support more APIs in the future based on requirements and updates.

### Authentication Type

- MLE is only supported with `JWT (JSON Web Token)` authentication type within the SDK.

### Using the SDK

To use the MLE feature in the SDK, configure the `merchantConfig` object as shown above and pass it to the SDK initialization.

## Contact

For any issues or further assistance, please open an issue on the GitHub repository or contact our support team.