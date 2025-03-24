require 'openssl'
require 'base64'
public
# P12 file certificate Cache
  class Cache
    def fetchCachedCertificate(filePath, p12File, keyPass, keyAlias, cacheObj)
      certCache = cacheObj.read(keyAlias.to_s.upcase)
      cachedLastModifiedTimeStamp = cacheObj.read(keyAlias.to_s.upcase + '_LastModifiedTime')
      if File.exist?(filePath)
        currentFileLastModifiedTime = File.mtime(filePath)
        if certCache.to_s.empty? || cachedLastModifiedTimeStamp.to_s.empty?
          certificateFromP12File = getCertificate(p12File, keyPass, keyAlias, cacheObj, currentFileLastModifiedTime)
          return certificateFromP12File
        elsif currentFileLastModifiedTime > cachedLastModifiedTimeStamp
        # Function call to read the file and put values to new cache
          certificateFromP12File = getCertificate(p12File, keyPass, keyAlias, cacheObj, currentFileLastModifiedTime)
          return certificateFromP12File
        else
          return certCache
        end
      else
        raise Constants::ERROR_PREFIX + Constants::FILE_NOT_FOUND + filePath
      end
    end

    def getCertificate(p12File, keyPass, keyAlias, cacheObj, currentFileLastModifiedTime)
      x5CertDer = Utility.new.fetchCert(keyPass, p12File, keyAlias)
      cacheObj.write(keyAlias.to_s.upcase, x5CertDer)
      cacheObj.write(keyAlias.to_s.upcase + '_LastModifiedTime', currentFileLastModifiedTime)
      x5CertDer
    end

    # <b>DEPRECATED:</b> This method has been marked as Deprecated and will be removed in coming releases.
    def fetchPEMFileForNetworkTokenization(filePath, cacheObj)
      warn("[DEPRECATED] 'fetchPEMFileForNetworkTokenization' method is deprecated and will be removed in coming releases.")
      pem_file_cache = cacheObj.read('privateKeyFromPEMFile')
      cached_pem_file_last_updated_time = cacheObj.read('cachedLastModifiedTimeOfPEMFile')
      if File.exist?(filePath)
        current_last_modified_time_of_PEM_file = File.mtime(filePath)
        if pem_file_cache.nil? || pem_file_cache.to_s.empty? || current_last_modified_time_of_PEM_file > cached_pem_file_last_updated_time
          private_key = JOSE::JWK.from_pem_file filePath
          cacheObj.write('privateKeyFromPEMFile', private_key)
          cacheObj.write('cachedLastModifiedTimeOfPEMFile', current_last_modified_time_of_PEM_file)
        end
      end
      return cacheObj.read('privateKeyFromPEMFile')
    end
  end
