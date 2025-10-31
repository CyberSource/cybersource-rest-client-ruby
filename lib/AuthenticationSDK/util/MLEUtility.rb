require_relative '../logging/log_factory.rb'
require 'jose'
require 'json'
require_relative './Cache'
require_relative './Constants'
require_relative './ExceptionHandler'
require_relative './JWEUtility'

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
        if serial_number.nil?
          @log_obj.logger.error('Serial number not found in certificate for MLE')
          raise StandardError.new('Serial number not found in MLE certificate')
        end

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
      return nil if certificate.subject.to_s.empty? && certificate.issuer.to_s.empty?
      certificate.subject.to_a.each do |attribute|
        return attribute[1] if attribute[0].include?('serialNumber')
      end
      certificate.serial.nil? ? nil : certificate.serial.to_s
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

        decryptedResponse = JWEUtility.decrypt_jwe_using_private_key(mlePrivateKey, jweResponseToken)

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
  end
