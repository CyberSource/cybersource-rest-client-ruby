require 'openssl'
require_relative '../util/Constants.rb'
require_relative '../logging/log_factory.rb'
require_relative '../logging/log_configuration.rb'

public
  class CertificateUtility
    @@logger

    def self.getCertificateCollectionAndPrivateKeyFromP12(certificateFilePath, merchantConfig)
      if !CertificateUtility.class_variable_defined?(:@@logger) || @@logger.nil?
        @@logger = Log.new merchantConfig.log_config, "CertificateUtility"
      end
      logger = @@logger.logger

      p12File = File.binread(certificateFilePath)
      p12Object = OpenSSL::PKCS12.new(p12File, merchantConfig.keyPass)

      privateKey = OpenSSL::PKey::RSA.new(p12Object.key)

      primaryX5Certificate = p12Object.certificate
      additionalX5Certificates = p12Object.ca_certs

      certificateList = [primaryX5Certificate]
      certificateList.concat(additionalX5Certificates) if additionalX5Certificates

      return [privateKey, certificateList]
    end

    def self.getCertificateBasedOnKeyAlias(certificateList, keyAlias)
      return nil if certificateList.nil?

      certificateList.find do |cert|
        cert.subject.to_a.any? { |_, value, _| value.include?(keyAlias) }
      end
    end

    def self.getCertificatesFromPemFile(certificateFilePath)
      pem_data = File.read(certificateFilePath)
      certificateList = []

      pem_data.scan(/-----BEGIN CERTIFICATE-----.*?-----END CERTIFICATE-----/m) do |certBlock|
        certificateList << OpenSSL::X509::Certificate.new(certBlock)
      end

      certificateList
    end

    def self.validateCertificateExpiry(certificate, keyAlias, certificateIdentifier, logConfig)
      if !CertificateUtility.class_variable_defined?(:@@logger) || @@logger.nil?
        @@logger = Log.new logConfig, "CertificateUtility"
      end
      logger = @@logger.logger

      warning_no_expiry_date = "Certificate does not have expiry date"
      warning_expiring_soon = "Certificate with alias #{keyAlias} is going to expire on %s. Please update the certificate before then."
      warning_expired = "Certificate with alias #{keyAlias} is expired as of %s. Please update the certificate."

      if Constants::MLE_CACHE_IDENTIFIER_FOR_CONFIG_CERT == certificateIdentifier
        warning_no_expiry_date = "Certificate for MLE Requests does not have expiry date from mleForRequestPublicCertPath in merchant configuration."
        warning_expiring_soon = "Certificate for MLE Requests with alias #{keyAlias} is going to expire on %s. Please update the certificate provided in mleForRequestPublicCertPath in merchant configuration before then."
        warning_expired = "Certificate for MLE Requests with alias #{keyAlias} is expired as of %s. Please update the certificate provided in mleForRequestPublicCertPath in merchant configuration."
      end

      if Constants::MLE_CACHE_IDENTIFIER_FOR_P12_CERT == certificateIdentifier
        warning_no_expiry_date = "Certificate for MLE Requests does not have expiry date in the P12 file."
        warning_expiring_soon = "Certificate for MLE Requests with alias #{keyAlias} is going to expire on %s. Please update the P12 file before then."
        warning_expired = "Certificate for MLE Requests with alias #{keyAlias} is expired as of %s. Please update the P12 file."
      end

      not_after = certificate.not_after # This returns a Time object in Ruby's OpenSSL
      if not_after.nil?
        logger.warn(warning_no_expiry_date)
      else
        now = Time.now.utc
        if not_after < now
          logger.warn(warning_expired % [not_after])
        else
          time_to_expire = not_after - now
          days_to_expire = (time_to_expire / 86400).to_i
          if days_to_expire < Constants::CERTIFICATE_EXPIRY_DATE_WARNING_DAYS
            logger.warn(warning_expiring_soon % [not_after])
          end
        end
      end
    end

    def self.validatePathAndFile(filePath, pathType, logConfig)
      if !CertificateUtility.class_variable_defined?(:@@logger) || @@logger.nil?
        @@logger = Log.new logConfig, "CertificateUtility"
      end
      logger = @@logger.logger

      if filePath.nil? || filePath.strip.empty?
        logger.error("#{pathType} path cannot be null or empty.")
        raise ArgumentError, "#{pathType} path cannot be null or empty."
      end

      normalized_path = filePath.dup
      if File::SEPARATOR == '\\' && normalized_path =~ %r{^/[A-Za-z]:.*}
        normalized_path = normalized_path[1..-1]
      end

      path = normalized_path

      unless File.exist?(path)
        logger.error("#{pathType} does not exist: #{path}")
        raise IOError, "#{pathType} does not exist: #{path}"
      end

      if File.directory?(path)
        logger.error("#{pathType} does not have valid file: #{path}")
        raise IOError, "#{pathType} does not have valid file: #{path}"
      end

      begin
        File.open(path, "rb") {} # Just to check readability
        return path
      rescue => e
        logger.error("#{pathType} is not readable: #{path}")
        raise IOError, "#{pathType} is not readable: #{path}"
      end
    end

    def self.read_private_key_from_p12(p12_file_path, password)
      begin
        # `password` should be a String in Ruby
        raise ArgumentError, "password must be a String" unless password.is_a?(String)

        data = File.binread(p12_file_path)
        pkcs12 = OpenSSL::PKCS12.new(data, password)

        key = pkcs12.key
        raise "No private key found in the P12 file" if key.nil?

        jwk_private_key = self.convert_key_to_JWK(key)
        return jwk_private_key
      rescue OpenSSL::PKCS12::PKCS12Error => e
        raise "Could not recover key from P12: #{e.message}"
      rescue Errno::ENOENT => e
        raise "P12 file not found: #{p12_file_path}"
      end
    end

    def self.load_private_key_from_pem_file(key_file_path, password = nil)
      begin
        pem_data = File.binread(key_file_path)

        # OpenSSL::PKey.read supports:
        # - "BEGIN RSA/EC/PRIVATE KEY" (PKCS#1), encrypted or not (Proc-Type/DEK-Info)
        # - "BEGIN PRIVATE KEY" (PKCS#8 unencrypted)
        # - "BEGIN ENCRYPTED PRIVATE KEY" (PKCS#8 encrypted)
        rsa_key = OpenSSL::PKey.read(pem_data, password)
        jwk_private_key = self.convert_key_to_JWK(rsa_key)
        return jwk_private_key
      rescue OpenSSL::PKey::PKeyError => e
        # Missing password for an encrypted PEM
        if pem_data =~ /(BEGIN ENCRYPTED PRIVATE KEY|Proc-Type:\s*4,ENCRYPTED)/ && (password.nil? || password.to_s.empty?)
          raise ArgumentError, "Private key is password protected, but no password was provided."
        end

        # Wrong password (common OpenSSL messages)
        if password && e.message =~ /(bad decrypt|bad password|mac verify failure)/i
          logger&.error("Failed to decrypt PKCS#8 private key - incorrect password provided")
          raise ArgumentError, "Password is incorrect for the encrypted private key. Error: #{e.message}"
        end

        # Unsupported/invalid PEM contents
        raise ArgumentError, "Unsupported PEM object or invalid key: #{e.message}"
      rescue Errno::ENOENT
        raise ArgumentError, "PEM file not found: #{key_file_path}"
      end
    end

    def self.convert_key_to_JWK(keyValue, password=nil)
      if !keyValue.nil?
        case keyValue
        when String
          begin
            if keyValue.encoding == Encoding::UTF_8
              # This is for PEM formatted string
              encrypted = keyValue.include?('BEGIN ENCRYPTED PRIVATE KEY')
              pkey = nil

              key = begin
                if encrypted
                  if password.nil? || password.empty?
                    raise ArgumentError, "Encrypted PEM detected, but no password was provided."
                  end
                  pkey = OpenSSL::PKey.read(keyValue, password)
                else
                  # Try without password first
                  pkey = OpenSSL::PKey.read(keyValue)
                end
              rescue OpenSSL::PKey::PKeyError
                # If initial attempt failed and a password was provided, retry with password
                if !password.nil? && !password.empty?
                  begin
                    pkey = OpenSSL::PKey.read(keyValue, password)
                  rescue OpenSSL::PKey::PKeyError => e
                    raise "Failed to load PEM private key. Incorrect password or corrupted/unsupported format. OpenSSL: #{e.message}"
                  end
                else
                  raise "Failed to load PEM private key. Invalid key format or password required."
                end
              end
              keyValue = JOSE::JWK.from_key(pkey)
            else
              # This is for P12 formatted string
              begin
                if !password.nil? && !password.empty?
                  pkey = OpenSSL::PKCS12.new(keyValue, password)
                else
                  pkey = OpenSSL::PKCS12.new(keyValue)
                end
              rescue OpenSSL::PKCS12::PKCS12Error => e
                raise "Could not recover key from P12 data: #{e.message}"
              end

              key = pkey.key
              raise "No private key found in the P12 data" if key.nil?
              keyValue = JOSE::JWK.from_key(key)
            end
          end
        when OpenSSL::PKey::RSA
          keyValue = JOSE::JWK.from_pem(keyValue.to_pem)
        else
          keyValue = JOSE::JWK.from_key(keyValue)
        end
      end
    end
  end