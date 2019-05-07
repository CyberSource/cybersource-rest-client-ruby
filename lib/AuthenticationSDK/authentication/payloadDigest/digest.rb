require 'digest'
public
# This method return Digest value which is SHA-256 
# hash of payload that is BASE64 encoded
  class DigestGeneration
    def generateDigest(payload, log_obj)
      digest = Digest::SHA256.base64digest(payload)
      return digest
    end
  end