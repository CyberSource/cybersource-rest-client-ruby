require 'base64'
require 'openssl'
require 'jwt'
require 'json'
require 'active_support'
require_relative '../../core/ITokenGeneration.rb'
require_relative '../../util/Constants.rb'
require_relative '../../util/ApiException.rb'
require_relative '../../util/Cache.rb'
require_relative '../../authentication/payloadDigest/digest.rb'
public
#JWT Token-generated based  on the Request type
class GenerateJwtToken
  def getToken(merchantconfig_obj,gmtDatetime,log_obj)
    jwtBody = ''
    request_type = merchantconfig_obj.requestType.upcase
    filePath = merchantconfig_obj.keysDirectory + '/' + merchantconfig_obj.keyFilename + '.p12'
    if (!File.exist?(filePath))
      raise Constants::ERROR_PREFIX + Constants::FILE_NOT_FOUND + File.expand_path(filePath)
    end
    p12File = File.binread(filePath)
    jwtBody=getJwtBody(request_type, gmtDatetime, merchantconfig_obj, log_obj)
    claimSet = JSON.parse(jwtBody)
    p12FilePath = OpenSSL::PKCS12.new(p12File, merchantconfig_obj.keyPass)
    # Generating certificate.
    cacheObj = ActiveSupport::Cache::MemoryStore.new
    x5Cert = Cache.new.fetchCachedCertificate(filePath, p12File, merchantconfig_obj.keyPass, cacheObj)
    # Generating Public key.
    publicKey = OpenSSL::PKey::RSA.new(p12FilePath.key.public_key)
    #Generating Private Key
    privateKey = OpenSSL::PKey::RSA.new(p12FilePath.key)
    # JWT token-Generates using RS256 algorithm only
    x5clist = [x5Cert]
    customHeaders = {}
    customHeaders['v-c-merchant-id'] = merchantconfig_obj.keyAlias
    customHeaders['x5c'] = x5clist
    # Generating JWT token
    token = JWT.encode(claimSet, privateKey, 'RS256', customHeaders)
    return token
  rescue StandardError => err
    if err.message.include? 'PKCS12_parse: mac verify failure'
      ApiException.new.customerror(Constants::ERROR_PREFIX + Constants::INCORRECT_KEY_PASS,log_obj)
      puts 'Check log for more details.'
      exit!
    else
      ApiException.new.apiexception(err,log_obj)
      exit!
    end
  end
  def getJwtBody(request_type, gmtDatetime, merchantconfig_obj,log_obj)
    if request_type == Constants::POST_REQUEST_TYPE || request_type == Constants::PUT_REQUEST_TYPE || request_type == Constants::PATCH_REQUEST_TYPE
      payload = merchantconfig_obj.requestJsonData
      # Note: Digest is not passed for GET calls
      digest = DigestGeneration.new.generateDigest(payload, log_obj)
      jwtBody = "{\n      \"digest\":\"" + digest + "\", \"digestAlgorithm\":\"SHA-256\", \"iat\":\"" + gmtDatetime + "\"}"
    elsif request_type == Constants::GET_REQUEST_TYPE || request_type == Constants::DELETE_REQUEST_TYPE
      jwtBody = "{\n \"iat\":\"" + gmtDatetime + "\"\n} \n\n"
    else 
      raise StandardError.new(Constants::ERROR_PREFIX + Constants::INVALID_REQUEST_TYPE_METHOD)
    end
  end
  implements TokenInterface
end
