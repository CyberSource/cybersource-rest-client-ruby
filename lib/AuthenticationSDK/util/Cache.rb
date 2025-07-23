require 'openssl'
require 'base64'
require 'active_support'

public
# P12 file certificate Cache
  class Cache
    @@cache_obj = ActiveSupport::Cache::MemoryStore.new

    def fetchCachedCertificate(filePath, p12File, keyPass, keyAlias)
      certCache = @@cache_obj.read(keyAlias.to_s.upcase)
      cachedLastModifiedTimeStamp = @@cache_obj.read(keyAlias.to_s.upcase + '_LastModifiedTime')
      if File.exist?(filePath)
        currentFileLastModifiedTime = File.mtime(filePath)
        if certCache.to_s.empty? || cachedLastModifiedTimeStamp.to_s.empty?
          certificateFromP12File = getCertificate(p12File, keyPass, keyAlias, currentFileLastModifiedTime)
          return certificateFromP12File
        elsif currentFileLastModifiedTime > cachedLastModifiedTimeStamp
        # Function call to read the file and put values to new cache
          certificateFromP12File = getCertificate(p12File, keyPass, keyAlias, currentFileLastModifiedTime)
          return certificateFromP12File
        else
          return certCache
        end
      else
        raise Constants::ERROR_PREFIX + Constants::FILE_NOT_FOUND + filePath
      end
    end

    def getCertificate(p12File, keyPass, keyAlias, currentFileLastModifiedTime)
      x5CertDer = Utility.new.fetchCert(keyPass, p12File, keyAlias)
      @@cache_obj.write(keyAlias.to_s.upcase, x5CertDer)
      @@cache_obj.write(keyAlias.to_s.upcase + '_LastModifiedTime', currentFileLastModifiedTime)
      x5CertDer
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
