[![Generic badge](https://img.shields.io/badge/MLE-NEW-GREEN.svg)](https://shields.io/)

# Message Level Encryption (MLE) Feature

This feature provides an implementation of Message Level Encryption (MLE) for APIs provided by CyberSource, integrated within our SDK. This feature ensures secure communication by encrypting messages at the application level before they are sent over the network.

MLE supports both **Request Encryption** (encrypting outgoing request payloads) and **Response Decryption** (decrypting incoming response payloads).

<br/>

---

## Authentication Requirements

- **Request MLE**: Only supported with `JWT (JSON Web Token)` authentication type
- **Response MLE**: Only supported with `JWT (JSON Web Token)` authentication type

<br/>

---

## Configuration

### 1. Request MLE Configuration

#### 1.1. Global Request MLE Configuration

Configure global settings for request MLE using these properties in your merchant configuration:

##### (i) Primary Configuration

- **Variable**: `enableRequestMLEForOptionalApisGlobally`
- **Type**: `Boolean`
- **Default**: `false`
- **Description**: Enables request MLE globally for all APIs that have optional MLE support when set to `true`.

---

##### (ii) Deprecated Configuration (Backward Compatibility)

- **Variable**: `useMLEGlobally` ⚠️ **DEPRECATED**
- **Type**: `Boolean`
- **Default**: `false`
- **Description**: **DEPRECATED** - Use `enableRequestMLEForOptionalApisGlobally` instead. This field is maintained for backward compatibility and will be used as an alias for `enableRequestMLEForOptionalApisGlobally`.

---

##### (iii) Advanced Configuration

- **Variable**: `disableRequestMLEForMandatoryApisGlobally`
- **Type**: `Boolean`
- **Default**: `false`
- **Description**: Disables request MLE for APIs that have mandatory MLE requirement when set to `true`.

---

#### 1.2. Request MLE Certificate Configuration [Optional Params]

##### (i) Certificate File Path (Optional)

- **Variable**: `mleForRequestPublicCertPath`
- **Type**: `String`
- **Optional**: `true`
- **Description**: Path to the public certificate file used for request encryption. Supported formats: `.pem`, `.crt`. 
  - **Note**: This parameter is optional when using JWT authentication. If not provided, the request MLE certificate will be automatically fetched from the JWT authentication P12 file using the `requestMleKeyAlias`.

---

##### (ii) Key Alias Configuration (Optional)

- **Variable**: `requestMleKeyAlias`
- **Type**: `String`
- **Optional**: `true`
- **Default**: `CyberSource_SJC_US`
- **Description**: Key alias used to retrieve the MLE certificate from the certificate file. When `mleForRequestPublicCertPath` is not provided, this alias is used to fetch the certificate from the JWT authentication P12 file. If not specified, the SDK will automatically use the default value `CyberSource_SJC_US`.

---

##### (iii) Deprecated Key Alias (Backward Compatibility) (Optional)

- **Variable**: `mleKeyAlias` ⚠️ **DEPRECATED**
- **Type**: `String`
- **Optional**: `true`
- **Default**: `CyberSource_SJC_US`
- **Description**: **DEPRECATED** - Use `requestMleKeyAlias` instead. This field is maintained for backward compatibility and will be used as an alias for `requestMleKeyAlias`.

<br/>

---

### 2. Response MLE Configuration

#### 2.1 Global Response MLE Configuration

- **Variable**: `enableResponseMleGlobally`
- **Type**: `Boolean`
- **Default**: `false`
- **Description**: Enables response MLE globally for all APIs that support MLE responses when set to `true`.

----

#### 2.2 Response MLE Private Key Configuration

##### (i) Option 1: Provide Private Key Object

- **Variable**: `responseMlePrivateKey`
- **Type**: `OpenSSL::PKey` | `String`
- **Description**: Direct private key object for response decryption. If this field contains an encrypted string, the `responseMlePrivateKeyPassword` field must also be provided.

<br/>

- **Variable**: `responseMlePrivateKeyPassword`
- **Type**: `String`
- **Description**: This password is used to decrypt a password-protected key if the value of `responseMlePrivateKey` is an encrypted `String`.

---

##### (ii) Option 2: Provide Private Key File Path

- **Variable**: `responseMlePrivateKeyFilePath`
- **Type**: `String`
- **Description**: Path to the private key file. Supported formats: `.p12`, `.pfx`, `.pem`, `.key`, `.p8`. Recommendation use encrypted private Key (password protection) for MLE response.

---

##### (iii) Private Key File Password

- **Variable**: `responseMlePrivateKeyFilePassword`
- **Type**: `String`
- **Description**: Password for the private key file (required for `.p12/.pfx` files or encrypted private keys).

---

#### 2.3 Response MLE Additional Configuration

- **Variable**: `responseMleKID`
- **Type**: `String`
- **Required**: `true` (when response MLE is enabled)
- **Description**: Key ID value for the MLE response certificate (provided in merchant portal).

<br/>

---

### 3. API-level MLE Control for Request and Response MLE

#### Map Configuration

- **Variable**: `mapToControlMLEonAPI`
- **Type**: `Map<String, String>`
- **Description**: Overrides global MLE settings for specific APIs. The key is the API function name, and the value controls both request and response MLE.
- **Example**: `Map<'apiFunctionName', 'true::true'>`

#### Structure of Values in Map:

(i) **"requestMLE::responseMLE"** - Control both request and response MLE
   - `"true::true"` - Enable both request and response MLE
   - `"false::false"` - Disable both request and response MLE
   - `"true::false"` - Enable request MLE, disable response MLE
   - `"false::true"` - Disable request MLE, enable response MLE
   - `"::true"` - Use global setting for request, enable response MLE
   - `"true::"` - Enable request MLE, use global setting for response
   - `"::false"` - Use global setting for request, disable response MLE
   - `"false::"` - Disable request MLE, use global setting for response

(ii) **"requestMLE"** - Control request MLE only (response uses global setting)
   - `"true"` - Enable request MLE
   - `"false"` - Disable request MLE

<br/>

---

### 4. Example Configurations

#### (i) Minimal Request MLE Configuration

```ruby
    # Configuration in Hash - Uses defaults (most common scenario)
    merchantCustomConfiguration = {}
    merchantCustomConfiguration['enableRequestMLEForOptionalApisGlobally'] = true

    # Both mleForRequestPublicCertPath and requestMleKeyAlias are optional
    # SDK will use JWT P12 file with default alias "CyberSource_SJC_US"
```

#### (ii) Request MLE with Deprecated Parameters (Backward Compatibility)

```ruby
    # Using deprecated parameters - still supported but not recommended
    merchantCustomConfiguration = {}
    merchantCustomConfiguration['useMLEGlobally'] = true # Deprecated - use enableRequestMLEForOptionalApisGlobally
    merchantCustomConfiguration['mleKeyAlias'] = 'Custom_Key_Alias' # Deprecated - use requestMleKeyAlias
```

#### (iii) Request MLE with Custom Key Alias

```ruby
    # Configuration in Hash - With custom key alias only
    merchantCustomConfiguration = {}
    merchantCustomConfiguration['enableRequestMLEForOptionalApisGlobally'] = true
    merchantCustomConfiguration['requestMleKeyAlias'] = 'Custom_Key_Alias'
    # Will fetch from JWT P12 file using provided custom alias
```

#### (iv) Request MLE with Separate Certificate File

```ruby
    # Configuration in Hash - With separate MLE certificate file
    merchantCustomConfiguration = {}
    merchantCustomConfiguration['enableRequestMLEForOptionalApisGlobally'] = true
    merchantCustomConfiguration['mleForRequestPublicCertPath'] = 'path/to/public/cert.pem'
    merchantCustomConfiguration['requestMleKeyAlias'] = 'Custom_Key_Alias'

    # API-specific control
    mleControlMap = {
      'createPayment' => 'true', # Enable request MLE for this API
      'capturePayment' => 'false' # Disable request MLE for this API
    }
    merchantCustomConfiguration['mapToControlMLEonAPI'] = mleControlMap
```

#### (v) Response MLE Configuration with Private Key File

```ruby
    # Configuration in Hash
    merchantCustomConfiguration = {}
    merchantCustomConfiguration['enableResponseMleGlobally'] = true
    merchantCustomConfiguration['responseMlePrivateKeyFilePath'] = 'path/to/private/key.p12'
    merchantCustomConfiguration['responseMlePrivateKeyFilePassword'] = 'password'
    merchantCustomConfiguration['responseMleKID'] = 'your-key-id'

    # API-specific control
    mleControlMap = {
      'createPayment' => '::true' # Enable response MLE only for this API
    }
    merchantCustomConfiguration['mapToControlMLEonAPI'] = mleControlMap
```

#### (vi) Response MLE Configuration with Private Key Object

```ruby
    # Load private key programmatically into configuration in Hash
    merchantCustomConfiguration = {}
    merchantCustomConfiguration['enableResponseMleGlobally'] = true
    merchantCustomConfiguration['responseMleKID'] = 'your-key-id'
    merchantCustomConfiguration['responseMlePrivateKey'] = loadPrivateKeyFromSomewhere();
    # If `responseMlePrivateKey` is NOT an instance of `OpenSSL::PKey`, then uncomment the following line:
    # merchantCustomConfiguration['responseMlePrivateKeyPassword'] = 'password'
```

#### (vii) Both Request and Response MLE Configuration

```ruby
    # Configuration in Hash
    merchantCustomConfiguration = {}

    # Request MLE Settings (minimal - uses default values)
    merchantCustomConfiguration['enableRequestMLEForOptionalApisGlobally'] = true

    # Response MLE Settings
    merchantCustomConfiguration['enableResponseMleGlobally'] = true
    merchantCustomConfiguration['responseMlePrivateKeyFilePath'] = 'path/to/private/key.p12'
    merchantCustomConfiguration['responseMlePrivateKeyFilePassword'] = 'password'
    merchantCustomConfiguration['responseMleKID'] = 'your-key-id'

    # API-specific control for both request and response
    mleControlMap = {
      'createPayment' => 'true::true', # Enable both request and response MLE for this API
      'capturePayment' => 'false::true', # Disable request MLE, enable response MLE for this API
      'refundPayment' => 'true::false', # Enable request MLE, disable response MLE for this API
      'createCredit' => '::true' # Use global request settings, enable response MLE for this API
    }
    merchantCustomConfiguration['mapToControlMLEonAPI'] = mleControlMap
```

#### (viii) Mixed Configuration (New and Deprecated Parameters)

```ruby
    # Example showing both new and deprecated parameters (deprecated will be used as aliases)
    merchantCustomConfiguration = {}

    # If both are set with the same value, it works fine
    merchantCustomConfiguration['enableRequestMLEForOptionalApisGlobally'] = true
    merchantCustomConfiguration['useMLEGlobally'] = true # Deprecated but same value

    # If both are set with different values, it will throw an error
    # merchantCustomConfiguration['enableRequestMLEForOptionalApisGlobally'] = true
    # merchantCustomConfiguration['useMLEGlobally'] = false # This would cause an error

    # Key alias - new parameter takes precedence if both are provided
    merchantCustomConfiguration['requestMleKeyAlias'] = 'New_Alias'
    merchantCustomConfiguration['mleKeyAlias'] = 'Old_Alias' # This will be ignored
```

<br/>

---

### 5. Supported Private Key File Formats

For Response MLE private key files, the following formats are supported:

- **PKCS#12**: `.p12`, `.pfx` (requires password)
- **PEM**: `.pem`, `.key`, `.p8` (supports both encrypted and unencrypted)

<br/>

---

### 6. Important Notes

#### (i) Request MLE
- Both `mleForRequestPublicCertPath` and `requestMleKeyAlias` are **optional** parameters
- If `mleForRequestPublicCertPath` is not provided, the SDK will automatically fetch the MLE certificate from the JWT authentication P12 file
- If `requestMleKeyAlias` is not provided, the SDK will use the default value `CyberSource_SJC_US`
- The SDK provides flexible configuration options: you can use defaults, customize the key alias only, or provide a separate certificate file
- If `enableRequestMLEForOptionalApisGlobally` is set to `true`, it enables request MLE for all APIs that have optional MLE support
- APIs with mandatory MLE requirements are enabled by default unless `disableRequestMLEForMandatoryApisGlobally` is set to `true`
- If `mapToControlMLEonAPI` doesn't contain a specific API, the global setting applies
- For HTTP Signature authentication, request MLE will fall back to non-encrypted requests with a warning

#### (ii) Response MLE
- Response MLE requires either `responseMlePrivateKey` object OR `responseMlePrivateKeyFilePath` (not both)
- The `responseMleKID` parameter is mandatory when response MLE is enabled
- If an API expects a mandatory MLE response but the map specifies non-MLE response, the API might return an error
- Both the private key object and file path approaches are mutually exclusive

#### (iii) Backward Compatibility
- `useMLEGlobally` is **deprecated** but still supported as an alias for `enableRequestMLEForOptionalApisGlobally`
- `mleKeyAlias` is **deprecated** but still supported as an alias for `requestMleKeyAlias`
- If both new and deprecated parameters are provided with the **same value**, it works fine
- If both new and deprecated parameters are provided with **different values**, it will throw an error
- When both new and deprecated parameters are provided, the **new parameter takes precedence**

#### (iv) API-level Control Validation
- The `mapToControlMLEonAPI` values are validated for proper format
- Invalid formats (empty values, multiple separators, non-boolean values) will cause configuration errors
- Empty string before or after `::` separator will use global defaults
- The map also supports backward compatibility with `Map<String, Boolean>` format, which will be automatically converted to `Map<String, String>`

#### (v) Configuration Validation
- The SDK performs comprehensive validation of MLE configuration parameters
- Conflicting values between new and deprecated parameters will result in an error
- File path validation is performed for certificate and private key files
- Invalid boolean values in `mapToControlMLEonAPI` will cause parsing errors

<br/>

---

### 7. Error Handling

The SDK provides specific error messages for common MLE issues:
- Invalid private key for response decryption
- Missing certificates for request encryption
- Invalid file formats or paths
- Authentication type mismatches
- Configuration validation errors
- Conflicting parameter values between new and deprecated fields
- Invalid format in `mapToControlMLEonAPI` values

<br/>

---

### 8. Sample Code Repository

For comprehensive examples and sample implementations, please refer to:
[Cybersource Ruby Sample Code Repository (on GitHub)](https://github.com/CyberSource/cybersource-rest-samples-ruby)

<br/>

---

### 9. Additional Information

#### (i) API Support

- MLE is designed to support specific APIs that have been enabled for encryption
- Support can be extended to additional APIs based on requirements and updates

#### (ii) Using the SDK

To use the MLE feature in the SDK, create a custom configuration as a Ruby `Hash` as shown above and pass it to the SDK initialization. The SDK will automatically handle encryption and decryption based on your configuration.

#### (iii) Migration from Deprecated Parameters

If you're currently using deprecated parameters, here's how to migrate:

```ruby
    # OLD (DEPRECATED)
    merchantCustomConfiguration['useMLEGlobally'] = true
    merchantCustomConfiguration['mleKeyAlias'] = 'Custom_Alias'

    # NEW (RECOMMENDED)
    merchantCustomConfiguration['enableRequestMLEForOptionalApisGlobally'] = true
    merchantCustomConfiguration['requestMleKeyAlias'] = 'Custom_Alias'
```

The deprecated parameters will continue to work but are not recommended for new implementations.

<br/>

---

## 10. Contact
For any issues or further assistance, please open an issue on the GitHub repository or contact our support team.