require 'openssl'
require 'base64'
require 'active_support'
require 'thread'
require_relative 'CacheValue'
require_relative 'CertificateUtility'
require_relative '../util/Constants.rb'
require_relative '../logging/log_factory.rb'
require_relative '../logging/log_configuration.rb'

public
# P12 file certificate Cache
  class Cache
    @@cache_obj = ActiveSupport::Cache::MemoryStore.new
    @@mutex = Mutex.new
    @@logger

    def fetchCachedP12Certificate(merchantConfig)
      merchantId = merchantConfig.merchantId
      certificateFilePath = merchantConfig.p12KeyFilePath

      cacheKey = merchantConfig.keyFilename + "_JWT"

      @@mutex.synchronize do
        cachedCertificateInfo = @@cache_obj.read(cacheKey)
        fileModifiedTime = File.mtime(certificateFilePath)

        if !cachedCertificateInfo || cachedCertificateInfo.empty? || fileModifiedTime != cachedCertificateInfo.file_modified_time
          setupCache(cacheKey, certificateFilePath, merchantConfig)
          cachedCertificateInfo = @@cache_obj.read(cacheKey)
        end

        return cachedCertificateInfo
      end
    end

    def setupCache(cacheKey, certificateFilePath, merchantConfig)
      if !Cache.class_variable_defined?(:@@logger) || @@logger.nil?
        @@logger = Log.new merchantConfig.log_config, "Cache"
      end
      logger = @@logger.logger
      fileModifiedTime = File.mtime(certificateFilePath)

      if (cacheKey.end_with?("_JWT"))
        privateKey, certificateList = CertificateUtility.getCertificateCollectionAndPrivateKeyFromP12(certificateFilePath, merchantConfig)
        jwtCertificate = CertificateUtility.getCertificateBasedOnKeyAlias(certificateList, merchantConfig.keyAlias)

        cacheValue = CacheValue.new(privateKey, jwtCertificate, fileModifiedTime)

        @@cache_obj.write(cacheKey, cacheValue)
        return
      end

      if (cacheKey.end_with?(Constants::MLE_CACHE_IDENTIFIER_FOR_CONFIG_CERT))
        certificateList = CertificateUtility.getCertificatesFromPemFile(certificateFilePath)
        mleCertificate = CertificateUtility.getCertificateBasedOnKeyAlias(certificateList, merchantConfig.mleKeyAlias)
        if (!mleCertificate)
          fileName = File.basename(certificateFilePath)
          logger.warn("No certificate found for the specified mle_key_alias '#{merchantConfig.mleKeyAlias}'. Using the first certificate from file #{fileName} as the MLE request certificate.")
          mleCertificate = certificateList[0]
        end

        cacheValue = CacheValue.new(nil, mleCertificate, fileModifiedTime)

        @@cache_obj.write(cacheKey, cacheValue)
        return
      end

      if (cacheKey.end_with?(Constants::MLE_CACHE_IDENTIFIER_FOR_P12_CERT))
        privateKey, certificateList = CertificateUtility.getCertificateCollectionAndPrivateKeyFromP12(certificateFilePath, merchantConfig)
        mleCertificate = CertificateUtility.getCertificateBasedOnKeyAlias(certificateList, merchantConfig.mleKeyAlias)
        if (!mleCertificate)
          fileName = File.basename(certificateFilePath)
          logger.error("No certificate found for the specified mle_key_alias '#{merchantConfig.mleKeyAlias}' in file #{fileName}.")
          raise ArgumentError, "No certificate found for the specified mle_key_alias '#{merchantConfig.mleKeyAlias}' in file #{fileName}."
        end

        cacheValue = CacheValue.new(privateKey, mleCertificate, fileModifiedTime)

        @@cache_obj.write(cacheKey, cacheValue)
        return
      end
    end

    def getRequestMLECertificateFromCache(merchantConfig)
      if !Cache.class_variable_defined?(:@@logger) || @@logger.nil?
        @@logger = Log.new merchantConfig.log_config, "Cache"
      end

      logger = @@logger.logger
      merchantId = merchantConfig.merchantId
      certificate_identifier = nil
      certificate_file_path = nil

      # Priority #1: Get cert from merchantConfig.mleForRequestPublicCertPath if certPath is provided
      if merchantConfig.mleForRequestPublicCertPath && !merchantConfig.mleForRequestPublicCertPath.strip.empty?
        certificate_identifier = Constants::MLE_CACHE_IDENTIFIER_FOR_CONFIG_CERT
        certificate_file_path = merchantConfig.mleForRequestPublicCertPath
      # Priority #2: If mleForRequestPublicCertPath not provided, get mlecert from p12 if provided and jwt auth type
      elsif Constants::AUTH_TYPE_JWT.downcase == merchantConfig.authenticationType.downcase && merchantConfig.p12KeyFilePath
        certificate_identifier = Constants::MLE_CACHE_IDENTIFIER_FOR_P12_CERT
        certificate_file_path = merchantConfig.p12KeyFilePath
      # Priority #3: Get mlecert from default cert in SDK as per CAS or PROD env.
      else
        logger.debug("The certificate to use for MLE for requests is not provided in the merchant configuration. Please ensure that the certificate path is provided.")
        return nil
      end

      cache_key = "#{merchantId}_#{certificate_identifier}"
      mle_certificate = getMLECertificateBasedOnCacheKey(merchantConfig, cache_key, certificate_file_path)

      CertificateUtility.validateCertificateExpiry(mle_certificate, merchantConfig.keyAlias, certificate_identifier, merchantConfig.log_config)

      mle_certificate
    end

    def getMLECertificateBasedOnCacheKey(merchantConfig, cacheKey, certificateFilePath)
      cachedCertificateInfo = nil
      @@mutex.synchronize do
        cachedCertificateInfo = @@cache_obj.read(cacheKey)
        fileTimestamp = File.mtime(certificateFilePath)

        if cachedCertificateInfo.nil? || cachedCertificateInfo.file_modified_time != fileTimestamp
          setupCache(cacheKey, certificateFilePath, merchantConfig)
          cachedCertificateInfo = @@cache_obj.read(cacheKey)
        end
      end

      cachedCertificateInfo ? cachedCertificateInfo.cert : nil
    end

    # <b>DEPRECATED:</b> This method has been marked as Deprecated and will be removed in coming releases.
    def fetchPEMFileForNetworkTokenization(filePath)
      warn("[DEPRECATED] 'fetchPEMFileForNetworkTokenization' method is deprecated and will be removed in coming releases.")

      # Thread-safe cache access for deprecated method
      @@mutex.synchronize do
        pem_file_cache = @@cache_obj.read('privateKeyFromPEMFile')
        cached_pem_file_last_updated_time = @@cache_obj.read('cachedLastModifiedTimeOfPEMFile')

        if File.exist?(filePath)
          current_last_modified_time_of_PEM_file = File.mtime(filePath)
          if pem_file_cache.nil? || pem_file_cache.to_s.empty? || current_last_modified_time_of_PEM_file > cached_pem_file_last_updated_time
            private_key = JOSE::JWK.from_pem_file filePath
            @@cache_obj.write('privateKeyFromPEMFile', private_key)
            @@cache_obj.write('cachedLastModifiedTimeOfPEMFile', current_last_modified_time_of_PEM_file)
          end
        end

        return @@cache_obj.read('privateKeyFromPEMFile')
      end
    end

    def addPublicKeyToCache(runEnvironment, keyId, publicKey)
      cacheKey = "#{Constants::PUBLIC_KEY_CACHE_IDENTIFIER}_#{runEnvironment}_#{keyId}"
      @@mutex.synchronize do
        @@cache_obj.write(cacheKey, publicKey)
      end
    end

    def getPublicKeyFromCache(runEnvironment, keyId)
      cacheKey = "#{Constants::PUBLIC_KEY_CACHE_IDENTIFIER}_#{runEnvironment}_#{keyId}"
      @@mutex.synchronize do
        return @@cache_obj.read(cacheKey)
      end
    end
  end
