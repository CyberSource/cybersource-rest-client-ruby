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
            # Always validate JWT value first
            if jwt_value.nil? || jwt_value.empty?
              raise CyberSource::Authentication::Util::JWT::InvalidJwtException.new('JWT value is null or undefined')
            end
            
            # Validate verification requirements before parsing
            if verify_jwt
              raise ArgumentError, 'merchantConfig is required' unless merchant_config
              
              run_environment = merchant_config.runEnvironment
              raise ArgumentError, 'Run environment not found in merchant config' unless run_environment
            end
            
            # Parse JWT (actual operation)
            parsed_jwt = CyberSource::Authentication::Util::JWT::JWTUtility.parse(jwt_value)
            
            # Return early if no verification needed
            return parsed_jwt[:payload] unless verify_jwt
            
            # Validate kid exists in parsed JWT
            kid = parsed_jwt[:header]['kid']
            unless kid
              raise CyberSource::Authentication::Util::JWT::JwtSignatureValidationException.new(
                'JWT header missing key ID (kid) field'
              )
            end
            
            # Verify signature (actual operation)
            verify_jwt_signature(jwt_value, parsed_jwt[:payload], kid, run_environment)
          end

          private

          def verify_jwt_signature(jwt_value, payload, kid, run_environment)
            public_key = get_public_key(kid, run_environment)
            
            begin
              CyberSource::Authentication::Util::JWT::JWTUtility.verify_jwt(jwt_value, public_key)
              payload
            rescue CyberSource::Authentication::Util::JWT::JwtSignatureValidationException => e
              # If verification failed with cached key, try once more with fresh key from API
              public_key = fetch_public_key_from_api(kid, run_environment)
              cache = Cache.new
              cache.addPublicKeyToCache(run_environment, kid, public_key) rescue nil
              
              CyberSource::Authentication::Util::JWT::JWTUtility.verify_jwt(jwt_value, public_key)
              payload
            end
          end

          def get_public_key(kid, run_environment)
            cache = Cache.new
            cached_key = cache.getPublicKeyFromCache(run_environment, kid) rescue nil
            return cached_key if cached_key
            
            public_key = fetch_public_key_from_api(kid, run_environment)
            
            cache.addPublicKeyToCache(run_environment, kid, public_key) rescue nil
            
            public_key
          end

          def fetch_public_key_from_api(kid, run_environment)
            PublicKeyFetcher.fetch_public_key(kid, run_environment)
          rescue ArgumentError => e
            if e.message.include?('Invalid Runtime URL') || e.message.include?('run_environment')
              raise ArgumentError.new('Invalid Runtime URL in Merchant Config', e)
            else
              raise
            end
          rescue CyberSource::Authentication::Util::JWT::InvalidJwkException
            raise
          rescue StandardError => e
            raise StandardError.new('Error while trying to retrieve public key from server', e)
          end
        end
      end
    end
  end
end
