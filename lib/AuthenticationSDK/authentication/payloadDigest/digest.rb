require 'digest'
public
# This method return Digest value which is SHA-256
# hash of payload that is BASE64 encoded
  class DigestGeneration
    def generateDigest(payload)
      puts "m here 1"
      digest = Digest::SHA256.base64digest(payload)
      puts "m here 2"
      return digest
    end
  end