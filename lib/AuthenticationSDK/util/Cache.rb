require 'openssl'
require 'base64'
require 'active_support'
require 'thread'
require_relative 'CacheValue'
require_relative 'CachedMLEKId'
require_relative 'CertificateUtility'
require_relative 'Utility'
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

      if cacheKey.end_with?(Constants::MLE_CACHE_KEY_IDENTIFIER_FOR_RESPONSE_PRIVATE_KEY)
        password = merchantConfig.responseMlePrivateKeyFilePassword
        mlePrivateKey = nil

        begin
          fileExtension = File.extname(certificateFilePath).delete_prefix('.').downcase

          if fileExtension == 'p12' || fileExtension == 'pfx'
            mlePrivateKey = CertificateUtility.read_private_key_from_p12(certificateFilePath, password)
          elsif fileExtension == 'pem' || fileExtension == 'key' || fileExtension == 'p8'
            mlePrivateKey = CertificateUtility.load_private_key_from_pem_file(certificateFilePath, password)
          else
            err = StandardError.new(Constants::ERROR_PREFIX + "Unsupported Response MLE Private Key file format: `" + fileExtension + "`. Supported formats are: .p12, .pfx, .pem, .key, .p8")
            logger.error(ExceptionHandler.new.new_api_exception err)
            raise err
          end

          cacheValue = CacheValue.new(mlePrivateKey, nil, fileModifiedTime)

          @@cache_obj.write(cacheKey, cacheValue)
        rescue StandardError => e
          err = StandardError.new(Constants::ERROR_PREFIX + "Error loading MLE response private key from: " + certificateFilePath + ". Error: " + e.message)
          logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        end
        return
      end

      if (cacheKey.end_with?("_JWT"))
        privateKey, certificateList = Utility.getCertificateCollectionAndPrivateKeyFromP12(certificateFilePath, merchantConfig.keyPass)
        jwtCertificate = Utility.getCertificateBasedOnKeyAlias(certificateList, merchantConfig.keyAlias)

        cacheValue = CacheValue.new(privateKey, jwtCertificate, fileModifiedTime)

        @@cache_obj.write(cacheKey, cacheValue)
        return
      end

      if (cacheKey.end_with?(Constants::MLE_CACHE_IDENTIFIER_FOR_CONFIG_CERT))
        certificateList = CertificateUtility.getCertificatesFromPemFile(certificateFilePath)
        mleCertificate = Utility.getCertificateBasedOnKeyAlias(certificateList, merchantConfig.requestMleKeyAlias)
        if (!mleCertificate)
          fileName = File.basename(certificateFilePath)
          logger.warn("No certificate found for the specified mle_key_alias '#{merchantConfig.requestMleKeyAlias}'. Using the first certificate from file #{fileName} as the MLE request certificate.")
          mleCertificate = certificateList[0]
        end

        cacheValue = CacheValue.new(nil, mleCertificate, fileModifiedTime)

        @@cache_obj.write(cacheKey, cacheValue)
        return
      end

      if (cacheKey.end_with?(Constants::MLE_CACHE_IDENTIFIER_FOR_P12_CERT))
        privateKey, certificateList = Utility.getCertificateCollectionAndPrivateKeyFromP12(certificateFilePath, merchantConfig.keyPass)
        mleCertificate = Utility.getCertificateBasedOnKeyAlias(certificateList, merchantConfig.requestMleKeyAlias)
        if (!mleCertificate)
          fileName = File.basename(certificateFilePath)
          logger.error("No certificate found for the specified mle_key_alias '#{merchantConfig.requestMleKeyAlias}' in file #{fileName}.")
          raise ArgumentError, "No certificate found for the specified mle_key_alias '#{merchantConfig.requestMleKeyAlias}' in file #{fileName}."
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

    def getMLEResponsePrivateKeyFromFilePath(merchantConfig)
      merchantId = merchantConfig.merchantId
      keyIdentifier = Constants::MLE_CACHE_KEY_IDENTIFIER_FOR_RESPONSE_PRIVATE_KEY
      cacheIdentifier = "#{merchantId}_#{keyIdentifier}"
      mleResponsePrivateKeyFilePath = merchantConfig.responseMlePrivateKeyFilePath
      cachedCertificateInfo = nil

      @@mutex.synchronize do
        cachedCertificateInfo = @@cache_obj.read(cacheIdentifier)

        if cachedCertificateInfo.nil? || cachedCertificateInfo.file_modified_time != File.mtime(mleResponsePrivateKeyFilePath)
          setupCache(cacheIdentifier, mleResponsePrivateKeyFilePath, merchantConfig)
          cachedCertificateInfo = @@cache_obj.read(cacheIdentifier)
        end
      end

      cachedCertificateInfo ? cachedCertificateInfo.private_key : nil
    end

    def get_mle_kid_data_from_cache(merchant_config)
      cache_key = merchant_config.responseMlePrivateKeyFilePath + Constants::RESPONSE_MLE_P12_PFX_CACHE_IDENTIFIER
      file_path = merchant_config.responseMlePrivateKeyFilePath

      @@mutex.synchronize do
        if !@@cache_obj.exist?(cache_key)
          setup_mle_kid_cache(merchant_config)
        else
          cached_mle_kid = @@cache_obj.read(cache_key)
          file_modified_time = File.mtime(file_path).to_i

          if cached_mle_kid.nil? || cached_mle_kid.last_modified_timestamp != file_modified_time
            if !Cache.class_variable_defined?(:@@logger) || @@logger.nil?
              @@logger = Log.new merchant_config.log_config, "Cache"
            end
            logger = @@logger.logger
            logger.info("MLE KID cache outdated or file modified. Refreshing cache for: #{file_path}")
            setup_mle_kid_cache(merchant_config)
          end
        end

        return @@cache_obj.read(cache_key)
      end
    end

    private

    def setup_mle_kid_cache(merchant_config)
      file_path = nil
      cache_key = nil

      begin
        if !Cache.class_variable_defined?(:@@logger) || @@logger.nil?
          @@logger = Log.new merchant_config.log_config, "Cache"
        end
        logger = @@logger.logger

        file_path = merchant_config.responseMlePrivateKeyFilePath
        cache_key = merchant_config.responseMlePrivateKeyFilePath + Constants::RESPONSE_MLE_P12_PFX_CACHE_IDENTIFIER

        # Get certificate from P12 file
        _, certificate_list = Utility.getCertificateCollectionAndPrivateKeyFromP12(
          file_path,
          merchant_config.responseMlePrivateKeyFilePassword
        )

        merchant_cert = Utility.getCertificateBasedOnKeyAlias(certificate_list, merchant_config.merchantId)

        if merchant_cert.nil?
          raise StandardError.new("No certificate found for Response MLE Private Key file with merchant ID alias #{merchant_config.merchantId}")
        end

        # Check if this is a CyberSource-generated P12 file
        is_cybersource_p12 = Utility.isP12GeneratedByCyberSource(
          file_path,
          merchant_config.responseMlePrivateKeyFilePassword,
          logger
        )

        cached_mle_kid = CachedMLEKId.new
        cached_mle_kid.last_modified_timestamp = File.mtime(file_path).to_i

        if is_cybersource_p12
          begin
            mle_kid = MLEUtility.extract_serial_number_from_certificate(merchant_cert)
            cached_mle_kid.kid = mle_kid
          rescue ArgumentError => e
            raise StandardError.new("Failed to extract serial number from certificate for Response MLE: #{e.message}")
          end
        end

        @@cache_obj.write(cache_key, cached_mle_kid)

      rescue StandardError => e
        logger.error("Failed to load MLE KID from Response MLE Private Key file: #{file_path}. Error: #{e.message}")

        if !cache_key.nil?
          failure_marker = CachedMLEKId.new
          failure_marker.kid = nil
          failure_marker.last_modified_timestamp = 0
          @@cache_obj.write(cache_key, failure_marker)
        end
      end
    end

    public

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
  end
