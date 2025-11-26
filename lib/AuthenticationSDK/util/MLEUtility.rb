require_relative '../logging/log_factory.rb'
require 'jose'
require 'json'
require_relative './Cache'
require_relative './Constants'
require_relative './ExceptionHandler'
require_relative './AuthJWEUtility'

public
  class MLEUtility
    @log_obj = nil
    def self.check_is_mle_for_API(merchant_config, inbound_mle_status, operation_ids)
      is_mle_for_api = false

      if inbound_mle_status&.casecmp('optional') == 0 && merchant_config.enableRequestMLEForOptionalApisGlobally
        is_mle_for_api = true
      end
    
      if inbound_mle_status&.casecmp('mandatory') == 0
        is_mle_for_api = !merchant_config.disableRequestMLEForMandatoryApisGlobally
      end

      if !merchant_config.internalMapToControlRequestMLEonAPI.nil? && !merchant_config.internalMapToControlRequestMLEonAPI.empty? && operation_ids
        operation_ids.each do |operation_id|
          if merchant_config.internalMapToControlRequestMLEonAPI.key?(operation_id)
            is_mle_for_api = merchant_config.internalMapToControlRequestMLEonAPI[operation_id]
            break
          end
        end
      end
      is_mle_for_api
    end

    def self.encrypt_request_payload(merchantConfig, requestBody)
      return nil if requestBody.nil?
      return requestBody if requestBody == '{}'

      @log_obj ||= Log.new(merchantConfig.log_config, 'MLEUtility')

      @log_obj.logger.info('Encrypting request payload')
      @log_obj.logger.debug('LOG_REQUEST_BEFORE_MLE: ' + requestBody)

      mleCertificate = Cache.new.getRequestMLECertificateFromCache(merchantConfig)

      if mleCertificate.nil? && Constants::AUTH_TYPE_HTTP.downcase == merchantConfig.authenticationType.downcase
        @log_obj.logger.debug("The certificate to use for MLE for requests is not provided in the merchant configuration. Please ensure that the certificate path is provided.")
        @log_obj.logger.debug("Currently, MLE for requests using HTTP Signature as authentication is not supported by Cybersource. By default, the SDK will fall back to non-encrypted requests.")
        return requestBody
      end

      begin
        serial_number = self.extract_serial_number_from_certificate(mleCertificate)

        jwk = JOSE::JWK.from_key(mleCertificate.public_key)
        if jwk.nil?
          @log_obj.logger.error('Failed to create JWK object from public key')
          raise StandardError.new('Failed to create JWK object from public key')
        end
        headers = {
          'alg' => 'RSA-OAEP-256',
          'enc'  => 'A256GCM',
          'typ' => 'JWT',
          'kid' => serial_number,
          'iat' => Time.now.to_i
        }
        jwe = JOSE::JWE.block_encrypt(jwk, requestBody, headers)

        compact_jwe = jwe.compact
        mle_request_body = self.create_request_payload(compact_jwe)
        @log_obj.logger.debug('LOG_REQUEST_AFTER_MLE: ' + mle_request_body)
        return mle_request_body
      rescue StandardError => e
        @log_obj.logger.error("An error occurred during encryption: #{e.message}")
        raise e
      end
    end

    def self.extract_serial_number_from_certificate(certificate)
      raise StandardError.new('Certificate cannot be nil') if certificate.nil?
      raise StandardError.new('Certificate subject and issuer cannot both be empty') if certificate.subject.to_s.empty? && certificate.issuer.to_s.empty?
      certificate.subject.to_a.each do |attribute|
        return attribute[1] if attribute[0].include?('serialNumber')
      end
      raise StandardError.new('Serial number not found in certificate subject')
    end

    def self.create_request_payload(compact_jwe)
      "{ \"encryptedRequest\": \"#{compact_jwe}\" }"
    end

    def self.check_is_response_mle_for_api(merchant_config, operation_ids)
      isResponseMLEForApi = false

      if merchant_config.enableResponseMleGlobally
        isResponseMLEForApi = true
      end

      # operation_ids is an array of the multiple public function for apiCallFunction such as apiCall, apiCallAsync
      # Control the Response MLE only from map
      # Special Note: If API expect MLE Response mandatory and map is saying to receive non MLE response then API might throw an error from CyberSource
      if merchant_config.internalMapToControlResponseMLEonAPI
        operation_ids.each do |operation_id|
          if merchant_config.internalMapToControlResponseMLEonAPI.key?(operation_id)
            isResponseMLEForApi = merchant_config.internalMapToControlResponseMLEonAPI[operation_id]
            break
          end
        end
      end

      isResponseMLEForApi
    end

    def self.check_is_mle_encrypted_response(responseBody)
      return false if responseBody.nil? || responseBody.strip.empty?

      begin
        jsonObject = JSON.parse(responseBody)
        return false unless jsonObject.is_a?(Hash) && jsonObject.size == 1

        jsonObject.key?('encryptedResponse') && jsonObject['encryptedResponse'].is_a?(String)
      rescue JSON::ParserError, TypeError
        false
      end
    end

    def self.decrypt_mle_response_payload(merchantConfig, responseBody)
      @log_obj ||= Log.new(merchantConfig.log_config, 'MLEUtility')

      if !self.check_is_mle_encrypted_response(responseBody)
        raise StandardError.new('Response body is not MLE encrypted.')
      end

      mlePrivateKey = self.get_mle_response_private_key(merchantConfig)
      jweResponseToken = self.get_response_mle_token(responseBody)

      # When mle token is empty or null then fall back to non mle encrypted response
      if jweResponseToken.nil? || jweResponseToken.strip.empty?
        return responseBody
      end

      begin
        @log_obj.logger.info("LOG_NETWORK_RESPONSE_BEFORE_MLE_DECRYPTION: #{responseBody}")

        decryptedResponse = AuthJWEUtility.decrypt_jwe_using_private_key(mlePrivateKey, jweResponseToken)

        @log_obj.logger.info("LOG_NETWORK_RESPONSE_AFTER_MLE_DECRYPTION: #{decryptedResponse}")

        return decryptedResponse
      rescue => e
        raise StandardError.new(Constants::ERROR_PREFIX + "An error occurred during MLE decryption: #{e.message}")
      end
    end

    def self.get_response_mle_token(responseBody)
      @log_obj ||= Log.new(merchantConfig.log_config, 'MLEUtility')

      begin
        jsonObject = JSON.parse(responseBody)
        token = jsonObject['encryptedResponse']
        token.is_a?(String) ? token : nil
      rescue JSON::ParserError, TypeError => e
        err = StandardError.new(Constants::ERROR_PREFIX + "Failed to extract Response MLE token: #{e.message}")
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end
    end

    private_class_method :get_response_mle_token

    def self.get_mle_response_private_key(merchantConfig)
      @log_obj ||= Log.new(merchantConfig.log_config, 'MLEUtility')

      # First priority - Return private key provided in merchant config, if any
      if !merchantConfig.responseMlePrivateKey.nil? && !merchantConfig.responseMlePrivateKey.to_s.strip.empty?
        return merchantConfig.responseMlePrivateKey
      end

      # Second priority - Return private key loaded from merchantConfig.responseMlePrivateKeyFilePath
      responseMlePrivateKey = Cache.new.getMLEResponsePrivateKeyFromFilePath(merchantConfig)
      return responseMlePrivateKey
    end

    private_class_method :get_mle_response_private_key

    def self.validate_and_auto_extract_response_mle_kid(merchant_config)
      @log_obj ||= Log.new(merchant_config.log_config, 'MLEUtility')

      if !merchant_config.responseMlePrivateKey.nil? && !merchant_config.responseMlePrivateKey.to_s.strip.empty?
        @log_obj.logger.debug('responseMlePrivateKey is provided directly, using configured responseMleKID')
        return merchant_config.responseMleKID
      end

      @log_obj.logger.debug('Validating responseMleKID for JWT token generation')
      cybs_kid = nil
      p12_file = false

      # File path validity
      begin
        CertificateUtility.validatePathAndFile(merchant_config.responseMlePrivateKeyFilePath, 'responseMlePrivateKeyFilePath', merchant_config.log_config)
        extension = File.extname(merchant_config.responseMlePrivateKeyFilePath).delete_prefix('.').downcase
        if extension == 'p12' || extension == 'pfx'
          p12_file = true
        end
      rescue IOError => e
        @log_obj.logger.debug('No valid private key file path provided, skipping auto-extraction')
      end

      if p12_file
        @log_obj.logger.debug('P12/PFX file detected, checking if it is a CyberSource certificate')
        cached_data = Cache.new.get_mle_kid_data_from_cache(merchant_config)
        if !cached_data.nil?
          if !cached_data.kid.nil?
            # KID present means it's a CyberSource P12, use it
            cybs_kid = cached_data.kid
          else
            # KID is null means either non-CyberSource P12 or extraction failed
            @log_obj.logger.debug('Private key file is not a CyberSource generated P12/PFX file, skipping auto-extraction')
          end
        end
      else
        @log_obj.logger.debug('Private key file is not a P12/PFX file, skipping auto-extraction')
      end

      if !cybs_kid.nil?
        @log_obj.logger.debug('Successfully auto-extracted responseMleKID from CyberSource P12 certificate')
      end

      configured_kid = merchant_config.responseMleKID
      if cybs_kid.nil? && configured_kid.nil?
        raise StandardError.new('responseMleKID is required when response MLE is enabled. ' +
                        'Could not auto-extract from certificate and no manual configuration provided. ' +
                        'Please provide responseMleKID explicitly in your configuration.'
        )
      elsif cybs_kid.nil?
        @log_obj.logger.debug('Using manually configured responseMleKID')
        return configured_kid
      elsif configured_kid.nil?
        @log_obj.logger.debug('Using auto-extracted responseMleKID from CyberSource certificate')
        return cybs_kid
      elsif cybs_kid != configured_kid
        @log_obj.logger.warn('Auto-extracted responseMleKID does not match manually configured responseMleKID. Using configured value as preference')
      end
      return configured_kid
    end
  end
