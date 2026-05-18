require 'base64'
require 'openssl'
require 'jwt'
require 'json'
require 'active_support'
require 'time'
require 'securerandom'
require_relative '../../core/ITokenGeneration.rb'
require_relative '../../util/Constants.rb'
require_relative '../../util/ExceptionHandler.rb'
require_relative '../../util/Cache.rb'
require_relative '../../util/MLEUtility.rb'
require_relative '../../authentication/payloadDigest/digest.rb'
require_relative '../../logging/log_factory.rb'

public
  class GenerateJwtToken
    @log_obj

    # JWT Token generation for JWTv2 specification
    def getToken(merchantconfig_obj, gmtDatetime, isResponseMLEForApi)
      @log_obj = Log.new merchantconfig_obj.log_config, "JwtToken"

      begin
        # Get payload claim set for JWTv2 (identical for both key types)
        payload_claim_set = getPayloadClaimSet(merchantconfig_obj, isResponseMLEForApi)
        token = ''
        if merchantconfig_obj.is_shared_secret_key_type?
          # Shared Secret (HMAC-SHA256) signing
          @log_obj.logger.debug('Generating JWT token using shared secret (HS256)')

          secret_key = merchantconfig_obj.merchantSecretKey
          begin
            secret_key_decoded = Base64.strict_decode64(secret_key)
            rescue ArgumentError => e
            raise StandardError.new("Invalid base64-encoded secret key: #{e.message}")
          end

          # Get header claim set with merchantKeyId as kid
          header_claim_set = getHeaderClaimSet(merchant_key_id: merchantconfig_obj.merchantKeyId)

          # Generate JWT token using HS256 algorithm
          token = JWT.encode(payload_claim_set, secret_key_decoded, 'HS256', header_claim_set)
        else
          # P12 Certificate (RSA-SHA256) signing — existing behavior
          @log_obj.logger.debug('Generating JWT token using P12 certificate (RS256)')

          # Get cached certificate and private key
          cache_value = Cache.new.fetchCachedP12Certificate(merchantconfig_obj)
          private_key = cache_value.private_key
          jwt_cert_obj = cache_value.cert

          # Get header claim set with certificate serial number as kid
          header_claim_set = getHeaderClaimSet(certificate: jwt_cert_obj)

          # Generate JWT token using RS256 algorithm
          token = JWT.encode(payload_claim_set, private_key, 'RS256', header_claim_set)
        end

        return token
      rescue StandardError => err
        if err.message.include? 'PKCS12_parse: mac verify failure'
          @log_obj.logger.error(ExceptionHandler.new.new_custom_error Constants::ERROR_PREFIX + Constants::INCORRECT_KEY_PASS)
        else
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        end
        raise err
      end
    end

    private

    def getPayloadClaimSet(merchantconfig_obj, isResponseMLEForApi)
      jwt_payload = {}
      request_type = merchantconfig_obj.requestType.upcase

      # Setting the JWT digest and digest Algorithm when a POST, PUT, or PATCH request is made
      if request_type == Constants::POST_REQUEST_TYPE || request_type == Constants::PUT_REQUEST_TYPE || request_type == Constants::PATCH_REQUEST_TYPE
        payload = merchantconfig_obj.requestJsonData
        digest = DigestGeneration.new.generateDigest(payload)
        jwt_payload['digest'] = digest
        jwt_payload['digestAlgorithm'] = 'SHA-256'
      end

      # Set the iat and exp claims using Unix timestamps
      current_time = Time.now.to_i
      jwt_payload['iat'] = current_time
      jwt_payload['exp'] = current_time + 120  # The exp claim is set to 2 mins more than the iat claim

      # Set the request method, host and resource path in the JWT body as per the specification for all request types
      jwt_payload['request-method'] = request_type
      jwt_payload['request-host'] = merchantconfig_obj.requestHost
      jwt_payload['request-resource-path'] = merchantconfig_obj.requestTarget

      # Choose issuer claim in the JWT body as per the use_metakey flag in the config file
      if merchantconfig_obj.useMetaKey
        issuer = merchantconfig_obj.portfolioID
      else
        issuer = merchantconfig_obj.merchantId
      end

      jwt_payload['iss'] = issuer
      jwt_payload['jti'] = SecureRandom.uuid  # Unique JWT ID
      jwt_payload['v-c-jwt-version'] = '2'
      jwt_payload['v-c-merchant-id'] = merchantconfig_obj.merchantId

      if isResponseMLEForApi
        mle_kid = MLEUtility.validate_and_auto_extract_response_mle_kid(merchantconfig_obj)
        jwt_payload['v-c-response-mle-kid'] = mle_kid
      end

      return jwt_payload
    end

    def getHeaderClaimSet(merchant_key_id: nil, certificate: nil)
      kid_value = ''
      if !certificate.nil?
        kid_value = MLEUtility.extract_serial_number_from_certificate(certificate)
      elsif !merchant_key_id.nil? && !merchant_key_id.to_s.empty?
        kid_value = merchant_key_id
      else
        raise StandardError.new("Either certificate or merchant_key_id must be provided for JWT header")
      end

      jwt_headers = {
        'kid' => kid_value,
        'typ' => 'JWT'
      }

      return jwt_headers
    end

    implements TokenInterface
  end
