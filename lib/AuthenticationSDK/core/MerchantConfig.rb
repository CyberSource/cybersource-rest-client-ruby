require_relative '../util/Constants.rb'
require_relative '../util/ExceptionHandler.rb'
require_relative '../logging/log_factory.rb'
require_relative '../logging/log_configuration.rb'
require_relative '../util/CertificateUtility.rb'

public
# This fuction has all the merchantConfig properties getters and setters methods
  class Merchantconfig
    def initialize(cybsPropertyObj, responseMlePrivateKeyValue = nil, responseMlePrivateKeyPasswordValue = nil)
      # Common Parameters
      @merchantId = cybsPropertyObj['merchantID']
      @runEnvironment = cybsPropertyObj['runEnvironment']
      @intermediateHost = cybsPropertyObj['intermediateHost']
      @defaultDeveloperId = cybsPropertyObj['defaultDeveloperId']
      @authenticationType = cybsPropertyObj['authenticationType']
      @proxyAddress = cybsPropertyObj['proxyAddress']
      @proxyPort = cybsPropertyObj['proxyPort']
      @getId = ''
      @requestHost = ''
      @requestTarget = ''
      @requestJsonData = ''
      # HTTP Parameters
      @merchantSecretKey = cybsPropertyObj['merchantsecretKey']
      @merchantKeyId = cybsPropertyObj['merchantKeyId']
      # JWT Parameters
      @keysDirectory = cybsPropertyObj['keysDirectory']
      @keyAlias = cybsPropertyObj['keyAlias']
      @keyPass = cybsPropertyObj['keyPass']
      @keyFilename = cybsPropertyObj['keyFilename']
      @useMetaKey = cybsPropertyObj['useMetaKey']
      @portfolioID = cybsPropertyObj['portfolioID']
      @solutionId = cybsPropertyObj['solutionId']
      @p12KeyFilePath = nil
      # MutualAuth & OAuth Parameters
      @enableClientCert = cybsPropertyObj['enableClientCert']
      @clientCertDirectory = cybsPropertyObj['clientCertDirectory']
      @sslClientCert = cybsPropertyObj['sslClientCert']
      @privateKey = cybsPropertyObj['privateKey']
      @sslKeyPassword = cybsPropertyObj['sslKeyPassword']
      @clientId = cybsPropertyObj['clientId']
      @clientSecret = cybsPropertyObj['clientSecret']
      @accessToken = cybsPropertyObj['accessToken']
      @refreshToken = cybsPropertyObj['refreshToken']
      # LogConfiguration
      @log_config = LogConfiguration.new(cybsPropertyObj['logConfiguration'])
      # Custom Default Headers
      @defaultCustomHeaders = cybsPropertyObj['defaultCustomHeaders']
      # Keep Alive Time for Connection Pooling
      @keepAliveTime = cybsPropertyObj['keepAliveTime'] || 118 # Default to 118 seconds as same as default of libcurl
      # Path to client JWE pem file directory
      @pemFileDirectory = cybsPropertyObj['pemFileDirectory']

      # Optional parameter. User can pass a custom requestMleKeyAlias to fetch from the certificate.
      # Older flag "mleKeyAlias" is deprecated and will be used as alias/another name for requestMleKeyAlias.
      if cybsPropertyObj.has_key?('mleKeyAlias')
        @requestMleKeyAlias = cybsPropertyObj['mleKeyAlias']
      elsif cybsPropertyObj.has_key?('requestMleKeyAlias')
        @requestMleKeyAlias = cybsPropertyObj['requestMleKeyAlias']
      end

      # Deprecated flag to enable MLE for request. This flag is now known as "enableRequestMLEForOptionalApisGlobally"
      @useMLEGlobally = cybsPropertyObj['useMLEGlobally']

      # Flag to enable MLE (Message Level Encryption) for request body to all APIs in SDK which have optional support for MLE.
      # This means the API can send both non-encrypted and encrypted requests.
      # Older flag "useMLEGlobally" is deprecated and will be used as alias/another name for enableRequestMLEForOptionalApisGlobally.
      @enableRequestMLEForOptionalApisGlobally = !!(cybsPropertyObj['enableRequestMLEForOptionalApisGlobally'] || cybsPropertyObj['useMLEGlobally'])
      # Flag to disable MLE (Message Level Encryption) for request body to APIs in SDK which have mandatory MLE requirement when sending calls.
      @disableRequestMLEForMandatoryApisGlobally = cybsPropertyObj['disableRequestMLEForMandatoryApisGlobally']

      # Parameter to pass the request MLE public certificate path.
      if !cybsPropertyObj['mleForRequestPublicCertPath'].nil? && !cybsPropertyObj['mleForRequestPublicCertPath'].to_s.strip.empty?
          @mleForRequestPublicCertPath = cybsPropertyObj['mleForRequestPublicCertPath'].to_s.strip
      end

      # Map to control MLE (Message Level Encryption) settings for individual API functions. This overrides global MLE configuration for specific APIs.
      # The key is the function name of the API in the SDK, and the value is a String in the format "requestMLE::responseMLE" separated by "::",
      # where the first boolean value controls MLE for the request and the second boolean value controls MLE for the response.
      # Use "true" to enable or "false" to disable MLE for that specific component.

      # Valid Examples:
      # mapToControlMLEonAPI.put("apiFunctionName1", "true::true") - enables MLE for both request and response for apiFunctionName1
      # mapToControlMLEonAPI.put("apiFunctionName2", "false::false") - disables MLE for both request and response for apiFunctionName2
      # mapToControlMLEonAPI.put("apiFunctionName3", "true::false") - enables request MLE only, disables response MLE for apiFunctionName3
      # mapToControlMLEonAPI.put("apiFunctionName4", "false::true") - disables request MLE, enables response MLE only for apiFunctionName4
      # mapToControlMLEonAPI.put("apiFunctionName5", "false") - disables request MLE only. Since the "::" separator is not included, mleForResponse will use the default value set by the global flag
      # mapToControlMLEonAPI.put("apiFunctionName6", "true") - enables request MLE only. Since the "::" separator is not included, mleForResponse will use the default value set by the global flag
      # mapToControlMLEonAPI.put("apiFunctionName7", "::true") - enables response MLE only. Because the value before "::" is missing, the SDK will use the default request MLE value from the global flag
      # mapToControlMLEonAPI.put("apiFunctionName8", "true::") - enables request MLE only. Since the value after the "::" separator is missing, mleForResponse will use the default value

      # Invalid Examples (will be ignored or cause errors):
      # mapToControlMLEonAPI.put("apiFunctionName9", "::") - both values empty, will use global defaults
      # mapToControlMLEonAPI.put("apiFunctionName10", "invalid::true") - invalid first value, may cause parsing error
      # mapToControlMLEonAPI.put("apiFunctionName11", "true::invalid") - invalid second value, may cause parsing error
      # mapToControlMLEonAPI.put("apiFunctionName12", "true::true::false") - multiple separators not allowed
      # mapToControlMLEonAPI.put("apiFunctionName13", "") - empty string not allowed
      @mapToControlMLEonAPI = cybsPropertyObj['mapToControlMLEonAPI']

      # Initialize internal maps before validation
      # Both fields used for internal purpose only not exposed for merchants to set
      @internalMapToControlRequestMLEonAPI = {}
      @internalMapToControlResponseMLEonAPI = {}

      # Set up MLE configuration first since validation depends on it
      if @mapToControlMLEonAPI
        begin
          @mapToControlMLEonAPI = convertBooleanToStringMapType(@mapToControlMLEonAPI)
          setMapToControlMLEOnAPI(@mapToControlMLEonAPI)
        rescue => err
          error = StandardError.new(Constants::WARNING_PREFIX + "Unable to initialise MLE control Map from config: #{err.message}")
          raise error
        end
      end

      if responseMlePrivateKeyPasswordValue.nil?
        responseMlePrivateKeyPasswordValue = cybsPropertyObj['responseMlePrivateKeyPassword']
      end

      responseMlePrivateKeyPassword = responseMlePrivateKeyPasswordValue

      if !responseMlePrivateKeyValue.nil? && !cybsPropertyObj['responseMlePrivateKey'].nil?
        raise StandardError.new(Constants::ERROR_PREFIX + "The value for `responseMlePrivateKey` is provided in both the configuration object and the constructor for MerchantConfig. Please provide only one of them for response mle private key.")
      end

      if responseMlePrivateKeyValue.nil?
        responseMlePrivateKeyValue = cybsPropertyObj['responseMlePrivateKey']
      end

      responseMlePrivateKeyValue = CertificateUtility.convert_key_to_JWK(responseMlePrivateKeyValue, responseMlePrivateKeyPassword)

      @responseMlePrivateKey = responseMlePrivateKeyValue

      @enableResponseMleGlobally = false
      if !cybsPropertyObj['enableResponseMleGlobally'].nil?
        @enableResponseMleGlobally = cybsPropertyObj['enableResponseMleGlobally']
      end

      @responseMleKID = cybsPropertyObj['responseMleKID']
      @responseMlePrivateKeyFilePath = cybsPropertyObj['responseMlePrivateKeyFilePath']
      @responseMlePrivateKeyFilePassword = cybsPropertyObj['responseMlePrivateKeyFilePassword']

      validateMerchantDetails()
      validateMLEConfiguration(cybsPropertyObj)
      @p12KeyFilePath = File.join(@keysDirectory, @keyFilename + ".p12")
      logAllProperties(cybsPropertyObj)
    end

    #fall back logic
    def validateMerchantDetails()
      if !@keepAliveTime.is_a?(Integer)
        err = StandardError.new(Constants::ERROR_PREFIX + "keepAliveTime must be an integer and in seconds")
        raise err
      end
      
      logmessage = ''
      @log_config.validate(logmessage)
      @log_obj = Log.new @log_config, "MerchantConfig"
      @log_obj.logger.info('START> =======================================')
      if !logmessage.to_s.empty?
        @log_obj.logger.warn(ExceptionHandler.new.new_api_warning logmessage)
      end
      if @authenticationType.to_s.empty?
        err = StandardError.new(Constants::ERROR_PREFIX + Constants::AUTH_TYPE_MANDATORY)
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end
      if !@authenticationType.instance_of? String
        err = StandardError.new(Constants::ERROR_PREFIX+ Constants::AUTH_ERROR)
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end
      if !@runEnvironment.to_s.empty?
        if !@runEnvironment.instance_of? String
          @requestHost = @runEnvironment.to_s
        end

        if Constants::OLD_RUN_ENVIRONMENT_CONSTANTS.include?(@runEnvironment.upcase)
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::DEPRECATED_ENVIRONMENT)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        else
          @requestHost = @runEnvironment
        end
      elsif @runEnvironment.to_s.empty?
        err = StandardError.new(Constants::ERROR_PREFIX + Constants::RUN_ENVIRONMENT)
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end

      if !@enableClientCert.nil? && @enableClientCert
        if @sslClientCert.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::SSL_CLIENT_CERT_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@sslClientCert.instance_of? String
          @sslClientCert=@sslClientCert.to_s
        end
        if @privateKey.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::PRIVATE_KEY_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@privateKey.instance_of? String
          @privateKey=@privateKey.to_s
        end
        if @sslKeyPassword.to_s.empty?
          err = Constants::WARNING_PREFIX + Constants::SSL_KEY_PASSWORD_EMPTY
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning err)
          raise err
        elsif !@sslKeyPassword.instance_of? String
          @sslKeyPassword=@sslKeyPassword.to_s
        end
        if @clientCertDirectory.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::CLIENT_CERT_DIR_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@clientCertDirectory.instance_of? String
          @clientCertDirectory=@clientCertDirectory.to_s
        end
      end

      if @authenticationType.upcase == Constants::AUTH_TYPE_JWT
        if @merchantId.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::MERCHANT_ID_NULL)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@merchantId.instance_of? String
          @merchantId=@merchantId.to_s
        end
        if @keyAlias.to_s.empty?
          @keyAlias = @merchantId
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::KEY_ALIAS_NULL_EMPTY)
        elsif !@keyAlias.instance_of? String
          @keyAlias=@keyAlias.to_s
        elsif @keyAlias != @merchantId
          @keyAlias = @merchantId
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::INCORRECT_KEY_ALIAS)
        end
        if @keyPass.to_s.empty?
          @keyPass = @merchantId
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::KEY_PASS_NULL)
        elsif !@keyPass.instance_of? String
          @keyPass=@keyPass.to_s
        end
        if @keysDirectory.to_s.empty?
          @keysDirectory = Constants::DEFAULT_KEY_DIRECTORY
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::KEY_DIRECTORY_EMPTY + @keysDirectory)
        elsif !@keysDirectory.instance_of? String
          @keysDirectory=@keysDirectory.to_s
        end
        if @keyFilename.to_s.empty?
          @keyFilename = @merchantId
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::KEY_FILE_NAME_NULL_EMPTY)
        elsif !@keyFilename.instance_of? String
          @keyFilename=@keyFilename.to_s
        end
        if !check_key_file
          @log_obj.logger.error(ExceptionHandler.new.new_custom_error "Error finding or accessing the Key Directory or Key File. Please review the values in the merchant configuration.")
        end
      end
      if @authenticationType.upcase == Constants::AUTH_TYPE_MUTUAL_AUTH
        if @clientId.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::CLIENT_ID_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@clientId.instance_of? String
          @clientId=@clientId.to_s
        end
        if @clientSecret.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::CLIENT_SECRET_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@clientSecret.instance_of? String
          @clientSecret=@clientSecret.to_s
        end
      end
      if @authenticationType.upcase == Constants::AUTH_TYPE_OAUTH
        if @accessToken.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::ACCESS_TOKEN_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@accessToken.instance_of? String
          @accessToken=@accessToken.to_s
        end
        if @refreshToken.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::REFRESH_TOKEN_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@refreshToken.instance_of? String
          @refreshToken=@refreshToken.to_s
        end
      end
      if @authenticationType.upcase == Constants::AUTH_TYPE_HTTP
        if @merchantId.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::MERCHANT_ID_NULL)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@merchantId.instance_of? String
          @merchantId=@merchantId.to_s
        end
        if @merchantKeyId.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX+ Constants::MERCHANT_KEY_ID_MANDATORY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@merchantKeyId.instance_of? String
          @merchantKeyId=@merchantKeyId.to_s
        end
        if @merchantSecretKey.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX+ Constants::MERCHANT_SECRET_KEY_MANDATORY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@merchantSecretKey.instance_of? String
          @merchantSecretKey=@merchantSecretKey.to_s
        end
      end
      if @useMetaKey && @portfolioID.to_s.empty?
        err = StandardError.new(Constants::ERROR_PREFIX+ Constants::PORTFOLIO_ID_MANDATORY)
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end

      if !@proxyAddress.instance_of? String
        @proxyAddress=@proxyAddress.to_s
      end
      if !@proxyPort.instance_of? String
        @proxyPort=@proxyPort.to_s
      end
      unless @pemFileDirectory.instance_of? String
        @pemFileDirectory = @pemFileDirectory.to_s
      end
    end

    def validateMLEConfiguration(cybsPropertyObj)
      if !@useMLEGlobally.nil? && !cybsPropertyObj['enableRequestMLEForOptionalApisGlobally'].nil?
        if @useMLEGlobally != cybsPropertyObj['enableRequestMLEForOptionalApisGlobally']
          raise StandardError.new(Constants::ERROR_PREFIX + "useMLEGlobally and enableRequestMLEForOptionalApisGlobally must have the same value if both are set")
        end
      end

      if @disableRequestMLEForMandatoryApisGlobally.nil?
        @disableRequestMLEForMandatoryApisGlobally = false
      end

      unless [true, false].include?(@disableRequestMLEForMandatoryApisGlobally)
        err = StandardError.new(Constants::ERROR_PREFIX + "disableRequestMLEForMandatoryApisGlobally must be a boolean")
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end

      unless [true, false].include?(@enableRequestMLEForOptionalApisGlobally)
        err = StandardError.new(Constants::ERROR_PREFIX + "enableRequestMLEForOptionalApisGlobally must be a boolean")
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end

        # unless @mapToControlMLEonAPI.is_a?(Hash) && @mapToControlMLEonAPI.keys.all? {|k| k.is_a?(String)} && @mapToControlMLEonAPI.values.all? { |v| [true, false].include?(v) }
        #   err = StandardError.new(Constants::ERROR_PREFIX + "mapToControlMLEonAPI must be a map with boolean values")
        #   @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        #   raise err
        # end

      !@requestMleKeyAlias.nil? && unless @requestMleKeyAlias.instance_of? String
        err = StandardError.new(Constants::ERROR_PREFIX + "requestMleKeyAlias must be a string")
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end
      if @requestMleKeyAlias.to_s.empty?
        @requestMleKeyAlias = Constants::DEFAULT_ALIAS_FOR_MLE_CERT
      end

      if @mleForRequestPublicCertPath && !@mleForRequestPublicCertPath.to_s.strip.empty?
        begin
          CertificateUtility.validatePathAndFile(@mleForRequestPublicCertPath, "mleForRequestPublicCertPath", @log_config)
        rescue => err
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        end
      end

      request_mle_configured = @enableRequestMLEForOptionalApisGlobally
      if !@internalMapToControlRequestMLEonAPI.nil? && !@internalMapToControlRequestMLEonAPI.empty?
        @internalMapToControlRequestMLEonAPI.each do |_, value|
          if value
            request_mle_configured = true
            break
          end
        end
      end

      if request_mle_configured && !Constants::AUTH_TYPE_JWT.eql?(@authenticationType.upcase)
        err = StandardError.new(Constants::ERROR_PREFIX + "Request MLE can only be used with JWT authentication")
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end

      is_response_mle_configured = @enableResponseMleGlobally

      if !@internalMapToControlResponseMLEonAPI.nil? && !@internalMapToControlResponseMLEonAPI.empty?
        @internalMapToControlResponseMLEonAPI.values.each do |value|
          if value == true
            is_response_mle_configured = true
            break
          end
        end
      end

      if is_response_mle_configured
        # Validate for Auth type- Currently responseMLE feature will be enabled for JWT auth type only
        if !Constants::AUTH_TYPE_JWT.eql?(@authenticationType.upcase)
          err = StandardError.new(Constants::ERROR_PREFIX + "Response MLE can only be used with JWT authentication type")
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        end

        # Check if either private key object or private key file path is provided
        if @responseMlePrivateKey.nil? || @responseMlePrivateKey.to_s.strip.empty?
          if @responseMlePrivateKeyFilePath.nil? || @responseMlePrivateKeyFilePath.to_s.strip.empty?
            err = StandardError.new(Constants::ERROR_PREFIX + "Response MLE is enabled but no private key provided. Either set responseMlePrivateKey object or provide responseMlePrivateKeyFilePath.")
            @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
            raise err
          end
        end

        # Check that both private key object or private key file path should not be provided
        if !@responseMlePrivateKey.nil? && !@responseMlePrivateKey.to_s.strip.empty? && !@responseMlePrivateKeyFilePath.nil? && !@responseMlePrivateKeyFilePath.to_s.strip.empty?
            err = StandardError.new(Constants::ERROR_PREFIX + "Both responseMlePrivateKey object and responseMlePrivateKeyFilePath are provided. Please provide only one of them for response mle private key.")
            @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
            raise err
        end

        # If private key file path is provided, validate the file exists
        if !@responseMlePrivateKeyFilePath.nil? && !@responseMlePrivateKeyFilePath.to_s.strip.empty?
          begin
            CertificateUtility.validatePathAndFile(@responseMlePrivateKeyFilePath, "responseMlePrivateKeyFilePath", @log_config)
          rescue => err
            error = StandardError.new(Constants::ERROR_PREFIX + "Invalid responseMlePrivateKeyFilePath : #{err.message}")
            @log_obj.logger.error(ExceptionHandler.new.new_api_exception error)
            raise error
          end
        end

        # Validate responseMleKID is provided when response MLE is enabled
        if @responseMleKID.nil? || @responseMleKID.to_s.strip.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + "Response MLE is enabled but responseMleKID is not provided.")
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        end
      end
    end

    def setMapToControlMLEOnAPI(inputMap)
      # validate the map value format
      validateMapToControlMLEonAPIValues(inputMap) if inputMap

      # @mapToControlMLEonAPI = inputMap

      if inputMap
        internalRequest = {}
        internalResponse = {}

        inputMap.each do |apiName, rawValue|
          value = rawValue.to_s

          if value.include?("::")
            # Format: "requestMLE::responseMLE"
            requestMLE, responseMLE = value.split("::", 2)

            # Set request MLE value when present
            unless requestMLE.nil? || requestMLE.empty?
              internalRequest[apiName] = requestMLE.to_s.strip.casecmp?("true")
            end

            # Set response MLE value when present
            unless responseMLE.nil? || responseMLE.empty?
              internalResponse[apiName] = responseMLE.to_s.strip.casecmp?("true")
            end
          else
            # Format: "true" or "false" - applies to request MLE only
            internalRequest[apiName] = value.to_s.strip.casecmp?("true")
          end
        end

        @internalMapToControlRequestMLEonAPI = internalRequest
        @internalMapToControlResponseMLEonAPI = internalResponse
      end
    end

    # Validates the map values for MLE control API configuration.
    # Allowed formats: "true::true", "false::false", "::true", "true::", "::false", "false::", "true", "false"
    def validateMapToControlMLEonAPIValues(inputMap)
      inputMap.each do |key, value|
        if value.nil? || value == ""
          err = StandardError.new(Constants::ERROR_PREFIX + "Invalid MLE control map value for key '#{key}'. Value cannot be null or empty.")
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        end

        str = value.to_s
        if str.include?("::")
          parts = str.split("::", -1)

          unless parts.length == 2
            err = StandardError.new(Constants::ERROR_PREFIX + "Invalid MLE control map value format for key '#{key}'. Expected format: true/false for 'requestMLE::responseMLE' but got: '#{str}'")
            @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
            raise err
          end

          requestMLE, responseMLE = parts

          if !requestMLE.empty? && !isValidBooleanString?(requestMLE)
            err = StandardError.new(Constants::ERROR_PREFIX + "Invalid request MLE value for key '#{key}'. Expected 'true', 'false', or empty but got: '#{requestMLE}'")
            @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
            raise err
          end

          if !responseMLE.empty? && !isValidBooleanString?(responseMLE)
            err = StandardError.new(Constants::ERROR_PREFIX + "Invalid response MLE value for key '#{key}'. Expected 'true', 'false', or empty but got: '#{responseMLE}'")
            @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
            raise err
          end
        else
          unless isValidBooleanString?(str)
            err = StandardError.new(Constants::ERROR_PREFIX + "Invalid MLE control map value for key '#{key}'. Expected 'true' or 'false' for requestMLE but got: '#{str}'")
            @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
            raise err
          end
        end
      end
    end

    def isValidBooleanString?(s)
      s.casecmp?("true") || s.casecmp?("false")
    end

    def convertBooleanToStringMapType(inputMap)
      if inputMap.nil? || inputMap.empty?
        raise StandardError.new(Constants::ERROR_PREFIX + "Unsupported null value to mapToControlMLEonAPI in merchantConfig. Expected Map<String, String> which corresponds to <'apiFunctionName','flagForRequestMLE::flagForResponseMLE'> as dataType for field.")
      end

      unless inputMap.is_a?(Hash)
        raise TypeError.new(Constants::ERROR_PREFIX + "Unsupported datatype for field mapToControlMLEonAPI. Expected Hash<String, String> which corresponds to <'apiFunctionName','flagForRequestMLE::flagForResponseMLE'> as dataType for field but got: #{inputMap.class}")
      end

      keys_all_strings   = inputMap.keys.all? { |k| k.is_a?(String) }
      values_all_strings = inputMap.values.all? { |v| v.is_a?(String) }
      values_all_bools   = inputMap.values.all? { |v| v.is_a?(TrueClass) || v.is_a?(FalseClass) }

      if keys_all_strings && values_all_strings
        # Already Hash<String, String>
        inputMap
      elsif keys_all_strings && values_all_bools
        # Convert Hash<String, Boolean> -> Hash<String, String>
        inputMap.transform_values { |v| v.to_s }
      else
        err = StandardError.new("Unsupported map type combination for mapToControlMLEonAPI in merchantConfig. Expected Hash<String, String> which corresponds to <'apiFunctionName','flagForRequestMLE::flagForResponseMLE'> as dataType for field.")
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end
    end

    def logAllProperties(merchantPropertyObj)
      propertyObj = Marshal.load(Marshal.dump(merchantPropertyObj))
      merchantConfig = ''
      hiddenProperties = (Constants::HIDDEN_MERCHANT_PROPERTIES).split(',')
      hiddenPropArray = Array.new
      hiddenProperties.each do |value|
        hiddenPropArray << value.strip
      end
      hiddenPropArray.each do |prop|
        propertyObj.each do |key, value|
          if key == prop
            propertyObj.delete(key)
          end
        end
      end
      @log_obj.logger.info('Merchant Configuration :\n' + propertyObj.to_s)
    end

    def check_key_file
      # Directory exists?
      unless Dir.exist?(@keysDirectory)
        @log_obj.logger.error("Keys Directory not found. Entered directory : #{@keysDirectory}")
        return false
      end

      key_file_pathname = File.join(@keysDirectory, @keyFilename + ".p12")

      # File exists?
      unless File.exist?(key_file_pathname)
        @log_obj.logger.error("Key File not found. Check path/filename entered. Entered path/filename : #{key_file_pathname}")
        return false
      end

      @log_obj.logger.info("Entered value for Key File Path : #{key_file_pathname}")

      # Can file be opened for reading?
      begin
        File.open(key_file_pathname, 'rb') do |f|
          # Just open and close
        end
        return true
      rescue => e
        @log_obj.logger.info("File cannot be accessed. Permission denied : #{key_file_pathname}")
        return false
      end
    end

    # getter and setter methods
    attr_accessor :merchantId
    attr_accessor :merchantSecretKey
    attr_accessor :merchantKeyId
    attr_accessor :authenticationType
    attr_accessor :keysDirectory
    attr_accessor :requestHost
    attr_accessor :intermediateHost
    attr_accessor :defaultDeveloperId
    attr_accessor :keyAlias
    attr_accessor :keyPass
    attr_accessor :keyFilename
    attr_accessor :useMetaKey
    attr_accessor :portfolioID
    attr_accessor :keepAliveTime
    attr_accessor :enableClientCert
    attr_accessor :clientCertDirectory
    attr_accessor :sslClientCert
    attr_accessor :sslKeyPassword
    attr_accessor :privateKey
    attr_accessor :clientId
    attr_accessor :clientSecret
    attr_accessor :accessToken
    attr_accessor :refreshToken
    attr_accessor :requestJsonData
    attr_accessor :requestUrl
    attr_accessor :requestType
    attr_accessor :getId
    attr_accessor :logger
    attr_accessor :log_config
    attr_accessor :proxyAddress
    attr_accessor :proxyPort
    attr_accessor :requestTarget
    attr_accessor :log_obj
    attr_accessor :solutionId
    attr_accessor :defaultCustomHeaders
    attr_accessor :pemFileDirectory
    attr_accessor :useMLEGlobally
    attr_accessor :enableRequestMLEForOptionalApisGlobally
    attr_accessor :disableRequestMLEForMandatoryApisGlobally
    attr_accessor :mleForRequestPublicCertPath
    attr_accessor :mapToControlMLEonAPI
    attr_accessor :requestMleKeyAlias
    attr_accessor :p12KeyFilePath
    attr_accessor :enableResponseMleGlobally
    attr_accessor :responseMleKID
    attr_accessor :responseMlePrivateKeyFilePath
    attr_accessor :responseMlePrivateKeyFilePassword
    attr_accessor :responseMlePrivateKey
    attr_accessor :responseMlePrivateKeyPassword
    attr_accessor :internalMapToControlRequestMLEonAPI
    attr_accessor :internalMapToControlResponseMLEonAPI
  end
