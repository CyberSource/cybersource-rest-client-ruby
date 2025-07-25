require_relative '../logging/log_factory.rb'
require 'jose'
require_relative './Cache'

public
  class MLEUtility
    @log_obj = nil
    def self.check_is_mle_for_API(merchant_config, is_mle_supported_by_cybs_for_api, operation_ids)
      is_mle_for_api = false
      if is_mle_supported_by_cybs_for_api && merchant_config.useMLEGlobally
        is_mle_for_api = true
      end
      if merchant_config.mapToControlMLEonAPI && operation_ids
        operation_ids.each do |operation_id|
          if merchant_config.mapToControlMLEonAPI.key?(operation_id)
            is_mle_for_api = merchant_config.mapToControlMLEonAPI[operation_id]
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
        serial_number = extract_serial_number_from_certificate(mleCertificate)
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
        mle_request_body = create_request_payload(compact_jwe)
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
  end
