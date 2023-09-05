require 'openssl'
require 'base64'
public
# P12 file certificate Cache
  class Cache
    def fetchCachedCertificate(filePath, p12File, keyPass, cacheObj)
      certCache = cacheObj.read('certiFromP12File')
      cachedLastModifiedTimeStamp = cacheObj.read('certificateLastModifiedTimeStamp')
      if File.exist?(filePath)
        currentFileLastModifiedTime = File.mtime(filePath)
        if certCache.to_s.empty? || cachedLastModifiedTimeStamp.to_s.empty?
        certificateFromP12File = getCertificate(p12File, keyPass, cacheObj, currentFileLastModifiedTime)
        return certificateFromP12File
        elsif currentFileLastModifiedTime > cachedLastModifiedTimeStamp
        # Function call to read the file and put values to new cache
        certificateFromP12File = getCertificate(p12File, keyPass, cacheObj, currentFileLastModifiedTime)
        return certificateFromP12File
      else
        return certCache
      end
      else
        raise Constants::ERROR_PREFIX + Constants::FILE_NOT_FOUND + filePath
      end
    end

    def getCertificate(p12File, keyPass, cacheObj, currentFileLastModifiedTime)
      p12FilePath = OpenSSL::PKCS12.new(p12File, keyPass)
      # Generating certificate from p12File.
      x5CertPem = OpenSSL::X509::Certificate.new(p12FilePath.certificate)
      # Converting Certificate format from PEM TO DER to remove header and footer of the certificate.
      x5CertDer = Base64.strict_encode64(x5CertPem.to_der)
      cacheObj.write('certiFromP12File', x5CertDer)
      cacheObj.write('certificateLastModifiedTimeStamp', currentFileLastModifiedTime)
      return x5CertDer
    end

    def fetchPEMFileForNetworkTokenization(filePath, cacheObj)
      pem_file_cache = cacheObj.read('privateKeyFromPEMFile')
      if pem_file_cache.nil? || pem_file_cache.to_s.empty?
        pem_file_cache = JOSE::JWK.from_pem_file filePath
        cacheObj.write('privateKeyFromPEMFile', pem_file_cache)
      end
      return cacheObj.read('privateKeyFromPEMFile')
    end
  end
