require_relative '../logging/log_factory.rb'
require 'jose'
public
  class MLEUtility
    @log_obj
    def check_is_mle_for_API(merchant_config, is_mle_supported_by_cybs_for_api, operation_ids)
      is_mle_for_api = false
      if is_mle_supported_by_cybs_for_api && merchant_config.useMLEGlobally
        is_mle_for_api = true
      end
      if merchant_config.mapToControlMLEonAPI.nil? && merchant_config.mapToControlMLEonAPI.nil?
        operation_ids.each do |operation_id|
          if merchant_config.mapToControlMLEonAPI.key?(operation_id)
            is_mle_for_api = merchant_config.mapToControlMLEonAPI[operation_id]
            break
          end
        end
      end
      is_mle_for_api
    end

    def encrypt_request_payload(merchant_config, request_payload)
      if request_payload.nil?
        return nil
      end
      @log_obj = Log.new(merchant_config.log_config, 'MLEUtility')
      @log_obj.logger.info('Encrypting request payload')
      @log_obj.logger.debug('LOG_REQUEST_BEFORE_MLE: ' + request_payload)


      begin
        certificate = get_certificate(merchant_config, @log_obj)
        validate_certificate(certificate, merchant_config, @log_obj)
        serial_number = extract_serial_number_from_certificate(certificate)
        if serial_number.nil?
          @log_obj.logger.error('Serial number not found in certificate for MLE')
          raise StandardError.new('Serial number not found in MLE certificate')
        end

        jwk = JOSE::JWK.from_key(certificate.public_key)
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
        @log_obj.logger.debug('LOG_REQUEST_AFTER_MLE: ' + compact_jwe)
        return create_request_payload compact_jwe
      rescue StandardError => e
        @log_obj.logger.error("An error occurred during encryption: #{e.message}")
        raise e
      end
    end


    def get_certificate(merchant_config, log_obj)
      begin
        p12_file_path = File.join(merchant_config.keysDirectory, merchant_config.keyFilename + '.p12')
        file = File.binread(p12_file_path)
        p12_file = OpenSSL::PKCS12.new(file, merchant_config.keyPass)
        x5_cert_pem = OpenSSL::X509::Certificate.new(p12_file.certificate)
        x5_cert_pem.subject.to_a.each do |attribute|
          return x5_cert_pem if attribute[1].include?(merchant_config.mleKeyAlias)
        end
        p12_file.ca_certs.each do |cert|
          cert.subject.to_a.each do |attribute|
            return cert if attribute[1].include?(merchant_config.mleKeyAlias)
          end
        end
      rescue OpenSSL::PKCS12::PKCS12Error => e
        log_obj.logger.error("Failed to load PKCS12 file: #{e.message}")
        raise e
      rescue OpenSSL::X509::CertificateError => e
        log_obj.logger.error("Failed to create X509 certificate: #{e.message}")
        raise e
      rescue StandardError => e
        log_obj.logger.error("An error occurred while getting the certificate: #{e.message}")
        raise e
      end
    end

    def validate_certificate(certificate, merchant_config, log_obj)
      if certificate.not_after.nil?
        log_obj.logger.warn("Certificate for MLE don't have expiry date.")
      end
      if certificate.not_after < Time.now
        log_obj.logger.error('Certificate with MLE alias ' + merchant_config.mleKeyAlias + ' is expired as of ' + certificate.not_after.to_s + ". Please update p12 file.")
      else
        time_to_expire = certificate.not_after - Time.now
        if time_to_expire < Constants::CERTIFICATE_EXPIRY_DATE_WARNING_DAYS * 24 * 60 * 60
          log_obj.logger.warn('Certificate with MLE alias ' + merchant_config.mleKeyAlias + ' is going to expired on ' + certificate.not_after.to_s + ". Please update p12 file before that.")
        end
      end
    end

    def extract_serial_number_from_certificate(certificate)
      return nil if certificate.subject.to_s.empty? && certificate.issuer.to_s.empty?
      certificate.subject.to_a.each do |attribute|
        return attribute[1] if attribute[0].include?('serialNumber')
      end
      nil
    end

    def create_request_payload(compact_jwe)
      "{ \"encryptedRequest\": \"#{compact_jwe}\" }"
    end
  end
