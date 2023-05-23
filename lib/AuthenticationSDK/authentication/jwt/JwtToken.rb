require 'base64'
require 'openssl'
require 'jwt'
require 'json'
require 'active_support'
require 'time'
require_relative '../../core/ITokenGeneration.rb'
require_relative '../../util/Constants.rb'
require_relative '../../util/ExceptionHandler.rb'
require_relative '../../util/Cache.rb'
require_relative '../../authentication/payloadDigest/digest.rb'
require_relative '../../logging/log_factory.rb'

public
  class GenerateJwtToken
    @log_obj

    #JWT Token-generated based  on the Request type
    def getToken(merchantconfig_obj,gmtDatetime)
      @log_obj = Log.new merchantconfig_obj.log_config, "JwtToken"

      jwtBody = ''
      request_type = merchantconfig_obj.requestType.upcase
      filePath = merchantconfig_obj.keysDirectory + '/' + merchantconfig_obj.keyFilename + '.p12'

      if (!File.exist?(filePath))
        raise Constants::ERROR_PREFIX + Constants::FILE_NOT_FOUND + File.expand_path(filePath)
      end

      p12File = File.binread(filePath)
      jwtBody=getJwtBody(request_type, gmtDatetime, merchantconfig_obj)
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
        @log_obj.logger.error(ExceptionHandler.new.new_custom_error Constants::ERROR_PREFIX + Constants::INCORRECT_KEY_PASS)
        # exit!
      else
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        # exit!
      end
      raise err
    end

    def getJwtBody(request_type, gmtDatetime, merchantconfig_obj)
      if request_type == Constants::POST_REQUEST_TYPE || request_type == Constants::PUT_REQUEST_TYPE || request_type == Constants::PATCH_REQUEST_TYPE
        payload = merchantconfig_obj.requestJsonData

        # Note: Digest is not passed for GET calls
        digest = DigestGeneration.new.generateDigest(payload)
        jwtBody = "{\n      \"digest\":\"" + digest + "\", \"digestAlgorithm\":\"SHA-256\", \"iat\":" + Time.parse(gmtDatetime).to_i.to_s + "}"
      elsif request_type == Constants::GET_REQUEST_TYPE || request_type == Constants::DELETE_REQUEST_TYPE
        jwtBody = "{\n \"iat\":" + Time.parse(gmtDatetime).to_i.to_s + "\n} \n\n"
      else
        raise StandardError.new(Constants::ERROR_PREFIX + Constants::INVALID_REQUEST_TYPE_METHOD)
      end
    end
    implements TokenInterface
  end