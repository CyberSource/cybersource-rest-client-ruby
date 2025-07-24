require 'openssl'
require 'base64'
require 'active_support'
require_relative 'CacheValue'

public
# P12 file certificate Cache
  class Cache
    @@cache_obj = ActiveSupport::Cache::MemoryStore.new


    def fetchJwtCertsAndKeys(merchantConfig)
      merchantId = merchantConfig.merchantId
      filePath = merchantConfig.keysDirectory + '/' + merchantConfig.keyFilename + '.p12'
      if (!File.exist?(filePath))
        raise Constants::ERROR_PREFIX + Constants::FILE_NOT_FOUND + File.expand_path(filePath)
      end

      cacheKey = merchantId.to_s + '_JWT'
      certCache = @@cache_obj.read(cacheKey)

      if !certCache || certCache.empty?
        setupCache(cacheKey, filePath, merchantConfig)
        certCache = @@cache_obj.read(cacheKey)
      elsif certCache.file_modified_time !=  File.mtime(filePath)
        setupCache(cacheKey, filePath, merchantConfig)
        certCache = @@cache_obj.read(cacheKey)
      end
      
      return certCache
    end

    def fetchMLECert(merchantConfig)
      merchantId = merchantConfig.merchantId
      filePath = merchantConfig.keysDirectory + '/' + merchantConfig.keyFilename + '.p12'
      if (!File.exist?(filePath))
        raise Constants::ERROR_PREFIX + Constants::FILE_NOT_FOUND + File.expand_path(filePath)
      end

      cacheKey = merchantId.to_s + '_MLE'
      certCache = @@cache_obj.read(cacheKey)

      if !certCache || certCache.empty?
        setupCache(cacheKey, filePath, merchantConfig)
        certCache = @@cache_obj.read(cacheKey)
      elsif certCache.file_modified_time !=  File.mtime(filePath)
        setupCache(cacheKey, filePath, merchantConfig)
        certCache = @@cache_obj.read(cacheKey)
      end
      
      return certCache
    end

    def setupCache(cacheKey, filePath, merchantConfig)
      if(cacheKey.end_with?("_JWT"))
        private_key, certs = getCertsAndKeysFromP12(filePath, merchantConfig)
        jwt_cert = Utility.getCertBasedOnKeyAlias(certs, merchantConfig.keyAlias)
        currentFileLastModifiedTime = File.mtime(filePath)
        
        # Create CacheValue object with all 3 parameters
        cache_value = CacheValue.new(private_key, jwt_cert, currentFileLastModifiedTime)
        
        # Store the cache value object in cache
        @@cache_obj.write(cacheKey, cache_value)
      end
      if(cacheKey.end_with?("_MLE"))
        puts "MLE cache setup"
        private_key, certs = getCertsAndKeysFromP12(filePath, merchantConfig)
        mle_cert = Utility.getCertBasedOnKeyAlias(certs, merchantConfig.mleKeyAlias)
        currentFileLastModifiedTime = File.mtime(filePath)
        
        # Create CacheValue object with all 3 parameters
        cache_value = CacheValue.new(nil, mle_cert, currentFileLastModifiedTime)
        
        # Store the cache value object in cache
        @@cache_obj.write(cacheKey, cache_value)
      end

    end

    def getCertsAndKeysFromP12(filePath, merchantConfig)
      p12File = File.binread(filePath)
      p12Object = OpenSSL::PKCS12.new(p12File, merchantConfig.keyPass)
      #Generating Private Key
      private_key = OpenSSL::PKey::RSA.new(p12Object.key)
      # Generating Public key.
      # publicKey = OpenSSL::PKey::RSA.new(p12Object.key.public_key)

      # Get all certs from p12
      x5_cert_primary = p12Object.certificate
      x5_certs_others = p12Object.ca_certs
      certs = [x5_cert_primary]
      certs.concat(x5_certs_others) if x5_certs_others
      return [private_key, certs]
    end

    # <b>DEPRECATED:</b> This method has been marked as Deprecated and will be removed in coming releases.
    def fetchPEMFileForNetworkTokenization(filePath)
      warn("[DEPRECATED] 'fetchPEMFileForNetworkTokenization' method is deprecated and will be removed in coming releases.")
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
