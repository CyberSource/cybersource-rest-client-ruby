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
        # Get payload claim set for JWTv2
        payload_claim_set = getPayloadClaimSet(merchantconfig_obj, isResponseMLEForApi)
        
        # Get cached certificate and private key
        cache_value = Cache.new.fetchCachedP12Certificate(merchantconfig_obj)
        private_key = cache_value.private_key
        jwt_cert_obj = cache_value.cert

        # Get header claim set for JWTv2
        header_claim_set = getHeaderClaimSet(jwt_cert_obj)
        
        # Generate JWT token using RS256 algorithm
        token = JWT.encode(payload_claim_set, private_key, 'RS256', header_claim_set)
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
      jwt_payload['request-resource-path'] = extractResourcePath(merchantconfig_obj.requestTarget)

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

    def getHeaderClaimSet(jwt_cert_obj)
      # Extract serial number from certificate for kid header
      serial_number = MLEUtility.extract_serial_number_from_certificate(jwt_cert_obj)
      
      jwt_headers = {
        'kid' => serial_number,
        'typ' => 'JWT'
      }

      # Add any other future parameters to the header claim set here
      return jwt_headers
    end

    def extractResourcePath(request_target)
      return '' if request_target.nil? || request_target.empty?

      # Visa UAPI requires the full path including query string in request-resource-path.
      # The signed path must exactly match the actual request URL or the server rejects with UNAUTHORIZED_USER.
      request_target
    end

    implements TokenInterface
  end
