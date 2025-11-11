require_relative '../../../AuthenticationSDK/util/JWT/JWTUtility'
require_relative '../../../AuthenticationSDK/util/JWT/JWTExceptions'
require_relative '../../../AuthenticationSDK/util/Cache'
require_relative 'public_key_fetcher'

module CyberSource
  module Utilities
    module CaptureContext
      # CaptureContextParser Class
      #
      # Parses and validates capture context JWT responses from CyberSource.
      # Provides functionality to parse JWT tokens and optionally verify their
      # signatures using public keys fetched from the CyberSource API.
      #
      # @category Class
      # @package  CyberSource::Authentication::Util::CaptureContext
      # @author   CyberSource
      class CaptureContextParser
        # Error messages constants
        ERROR_MESSAGES = {
          jwt_null: 'JWT value is null or undefined',
          merchant_config_required: 'merchantConfig is required',
          kid_missing: 'JWT header missing key ID (kid) field',
          run_environment_missing: 'Run environment not found in merchant config',
          jwt_validation_failed: 'JWT validation failed',
          invalid_runtime_url: 'Invalid Runtime URL in Merchant Config',
          network_error: 'Error while trying to retrieve public key from server'
        }.freeze

        class << self
          # Parses a capture context JWT response and optionally verifies its signature
          #
          # @param jwt_value [String] The JWT token to parse
          # @param merchant_config [Object] The merchant configuration object
          # @param verify_jwt [Boolean] Whether to verify the JWT signature (default: true)
          #
          # @return [Hash] The parsed JWT payload
          # @raise [CyberSource::Authentication::Util::JWT::InvalidJwtException] If JWT is invalid
          # @raise [CyberSource::Authentication::Util::JWT::JwtSignatureValidationException] If signature verification fails
          # @raise [ArgumentError] If required parameters are missing
          # @raise [StandardError] For other errors during processing
          #
          # @example Parse without verification
          #   payload = CaptureContextParser.parse_capture_context_response(jwt_token, config, false)
          #
          # @example Parse with verification (default)
          #   payload = CaptureContextParser.parse_capture_context_response(jwt_token, config)
          def parse_capture_context_response(jwt_value, merchant_config, verify_jwt = true)
            validate_jwt_input(jwt_value, merchant_config)
            parsed_jwt = parse_jwt(jwt_value)
            
            return parsed_jwt[:payload] unless verify_jwt
            
            kid = extract_kid_from_header(parsed_jwt[:header])
            run_environment = extract_run_environment(merchant_config)
            
            verify_jwt_signature(jwt_value, parsed_jwt[:payload], kid, run_environment)
          end

          private

          def validate_jwt_input(jwt_value, merchant_config)
            if jwt_value.nil? || jwt_value.empty?
              raise CyberSource::Authentication::Util::JWT::InvalidJwtException.new(ERROR_MESSAGES[:jwt_null])
            end

            raise ArgumentError, ERROR_MESSAGES[:merchant_config_required] unless merchant_config
          end

          def parse_jwt(jwt_value)
            CyberSource::Authentication::Util::JWT::JWTUtility.parse(jwt_value)
          end

          def extract_kid_from_header(header)
            kid = header['kid']
            
            unless kid
              raise CyberSource::Authentication::Util::JWT::JwtSignatureValidationException.new(
                ERROR_MESSAGES[:kid_missing]
              )
            end
            
            kid
          end

          def extract_run_environment(merchant_config)
            run_environment = merchant_config.runEnvironment
            raise ArgumentError, ERROR_MESSAGES[:run_environment_missing] unless run_environment
            
            run_environment
          end

          def verify_jwt_signature(jwt_value, payload, kid, run_environment)
            cache = Cache.new
            public_key = get_public_key(kid, run_environment, cache)
            
            verify_jwt_with_key(jwt_value, public_key)
            payload
          end

          def get_public_key(kid, run_environment, cache)
            cached_key = get_cached_public_key(cache, run_environment, kid)
            return cached_key if cached_key && verify_cached_key_works?(cached_key)
            
            fetch_and_cache_public_key(kid, run_environment, cache)
          end

          def get_cached_public_key(cache, run_environment, kid)
            cache.getPublicKeyFromCache(run_environment, kid)
          rescue StandardError
            nil
          end

          def verify_cached_key_works?(cached_key)
            !cached_key.nil?
          end

          def fetch_and_cache_public_key(kid, run_environment, cache)
            public_key = fetch_public_key_from_api(kid, run_environment)
            cache_public_key(cache, run_environment, kid, public_key)
            public_key
          end

          def fetch_public_key_from_api(kid, run_environment)
            PublicKeyFetcher.fetch_public_key(kid, run_environment)
          rescue ArgumentError => e
            handle_argument_error(e)
          rescue CyberSource::Authentication::Util::JWT::InvalidJwkException
            raise
          rescue StandardError
            raise StandardError, ERROR_MESSAGES[:network_error]
          end

          def handle_argument_error(error)
            if error.message.include?('Invalid Runtime URL') || error.message.include?('run_environment')
              raise ArgumentError, ERROR_MESSAGES[:invalid_runtime_url]
            else
              raise
            end
          end

          def cache_public_key(cache, run_environment, kid, public_key)
            cache.addPublicKeyToCache(run_environment, kid, public_key)
          rescue StandardError
            # Ignore cache errors
          end

          def verify_jwt_with_key(jwt_value, public_key)
            CyberSource::Authentication::Util::JWT::JWTUtility.verify_jwt(jwt_value, public_key)
          rescue StandardError => e
            raise CyberSource::Authentication::Util::JWT::JwtSignatureValidationException.new(
              ERROR_MESSAGES[:jwt_validation_failed],
              e
            )
          end
        end
      end
    end
  end
end
