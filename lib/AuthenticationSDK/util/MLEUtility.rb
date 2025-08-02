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

    def self.encrypt_request_payload(merchant_config, request_payload)
      return nil if request_payload.nil?
      return request_payload if request_payload == '{}'
      @log_obj ||= Log.new(merchant_config.log_config, 'MLEUtility')
      @log_obj.logger.info('Encrypting request payload')
      @log_obj.logger.debug('LOG_REQUEST_BEFORE_MLE: ' + request_payload)

      begin
        cache_value = Cache.new.fetchMLECert(merchant_config)
        if cache_value.nil? || cache_value.cert.nil?
          @log_obj.logger.error('Failed to get certificate for MLE')
          raise StandardError.new('Failed to get certificate for MLE')
        end
        mle_cert_obj = cache_value.cert

        # certificate = OpenSSL::X509::Certificate.new(Base64.decode64(cert_der))
        validate_certificate(mle_cert_obj, merchant_config.mleKeyAlias, @log_obj)
        serial_number = extract_serial_number_from_certificate(mle_cert_obj)
        if serial_number.nil?
          @log_obj.logger.error('Serial number not found in certificate for MLE')
          raise StandardError.new('Serial number not found in MLE certificate')
        end

        jwk = JOSE::JWK.from_key(mle_cert_obj.public_key)
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
        jwe = JOSE::JWE.block_encrypt(jwk, request_payload, headers)

        compact_jwe = jwe.compact
        mle_request_body = create_request_payload(compact_jwe)
        @log_obj.logger.debug('LOG_REQUEST_AFTER_MLE: ' + mle_request_body)
        return mle_request_body
      rescue StandardError => e
        @log_obj.logger.error("An error occurred during encryption: #{e.message}")
        raise e
      end
    end

    def self.validate_certificate(certificate, mle_key_alias, log_obj)
      if certificate.not_after.nil?
        log_obj.logger.warn("Certificate for MLE don't have expiry date.")
      elsif certificate.not_after < Time.now
        log_obj.logger.warn('Certificate with MLE alias ' + mle_key_alias + ' is expired as of ' + certificate.not_after.to_s + ". Please update p12 file.")
        # raise StandardError.new('Certificate required for MLE has been expired on : ' + certificate.not_after.to_s)
      else
        time_to_expire = certificate.not_after - Time.now
        if time_to_expire < Constants::CERTIFICATE_EXPIRY_DATE_WARNING_DAYS * 24 * 60 * 60
          log_obj.logger.warn('Certificate with MLE alias ' + mle_key_alias + ' is going to expired on ' + certificate.not_after.to_s + ". Please update p12 file before that.")
        end
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
