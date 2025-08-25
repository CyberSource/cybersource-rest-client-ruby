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
  end