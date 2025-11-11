require 'typhoeus'
require 'json'
require_relative '../../../AuthenticationSDK/util/JWT/JWTUtility'
require_relative '../../../AuthenticationSDK/util/JWT/JWTExceptions'
require_relative '../../../AuthenticationSDK/util/Constants'
require_relative '../../../AuthenticationSDK/util/Cache'

module CyberSource
  module Utilities
    module CaptureContext
      # PublicKeyFetcher Class
      #
      # Fetches public keys from CyberSource Flex V2 API for the given key ID (kid)
      # and run environment. Supports caching to minimize redundant API calls.
      #
      # @category Class
      # @package  CyberSource::Authentication::Util::CaptureContext
      # @author   CyberSource
      class PublicKeyFetcher
        # Error messages constants
        ERROR_MESSAGES = {
          kid_required: 'kid parameter is required',
          run_environment_required: 'runEnvironment parameter is required',
          empty_response: 'Empty response received from public key endpoint',
          invalid_public_key: 'Invalid public key received from JWK',
          parse_error: 'Failed to parse JWK response: %s',
          http_error: 'HTTP %s: %s - Failed to fetch public key for kid: %s',
          no_response: 'No response received - Failed to fetch public key for kid: %s',
          request_error: 'Request setup error: %s',
          network_error: 'Network error occurred: %s'
        }.freeze

        # Default timeout for HTTP requests (in seconds)
        DEFAULT_TIMEOUT = 30

        # HTTP request configuration
        HTTP_REQUEST_CONFIG = {
          headers: {
            'Accept' => 'application/json'
          },
          timeout: DEFAULT_TIMEOUT
        }.freeze

        class << self
          # Fetches the public key for the given key ID (kid) from the specified run environment.
          #
          # @param kid [String] The key ID for which to fetch the public key
          # @param run_environment [String] The environment domain (e.g., 'apitest.cybersource.com')
          # @param cache_instance [Cache, nil] Optional cache instance for caching public keys
          #
          # @return [Hash] The RSA public key as a JWK hash
          # @raise [ArgumentError] If required parameters are missing
          # @raise [CyberSource::Authentication::Util::JWT::InvalidJwkException] If JWK is invalid
          # @raise [StandardError] For HTTP and network errors
          #
          # @example Fetch without caching
          #   public_key = PublicKeyFetcher.fetch_public_key('test-kid-123', 'apitest.cybersource.com')
          #
          # @example Fetch with caching
          #   cache = Cache.new
          #   public_key = PublicKeyFetcher.fetch_public_key('test-kid-123', 'apitest.cybersource.com', cache)
          def fetch_public_key(kid, run_environment, cache_instance = nil)
            validate_parameters(kid, run_environment)

            # Check cache first if cache instance is provided
            if cache_instance
              cached_key = cache_instance.getPublicKeyFromCache(run_environment, kid)
              return cached_key if cached_key
            end

            # Fetch from API
            public_key = fetch_from_api(kid, run_environment)

            # Store in cache if cache instance is provided
            if cache_instance && public_key
              cache_instance.addPublicKeyToCache(run_environment, kid, public_key)
            end

            public_key
          end

          private

          # Validates required parameters
          #
          # @param kid [String] The key ID
          # @param run_environment [String] The environment domain
          # @raise [ArgumentError] If parameters are invalid
          def validate_parameters(kid, run_environment)
            if kid.nil? || kid.to_s.strip.empty?
              raise ArgumentError, ERROR_MESSAGES[:kid_required]
            end

            if run_environment.nil? || run_environment.to_s.strip.empty?
              raise ArgumentError, ERROR_MESSAGES[:run_environment_required]
            end
          end

          # Fetches public key from the API
          #
          # @param kid [String] The key ID
          # @param run_environment [String] The environment domain
          # @return [Hash] The RSA public key as a JWK hash
          # @raise [StandardError] For HTTP and parsing errors
          def fetch_from_api(kid, run_environment)
            url = build_url(run_environment, kid)
            response = make_http_request(url)
            validate_http_response(response, kid)
            parse_and_convert_response(response, kid)
          end

          # Builds the API URL
          #
          # @param run_environment [String] The environment domain
          # @param kid [String] The key ID
          # @return [String] The complete API URL
          def build_url(run_environment, kid)
            "https://#{run_environment}/flex/v2/public-keys/#{kid}"
          end

          # Makes the HTTP GET request
          #
          # @param url [String] The API URL
          # @return [Typhoeus::Response] The HTTP response
          # @raise [StandardError] For network and HTTP errors
          def make_http_request(url)
            request = Typhoeus::Request.new(url, method: :get, **HTTP_REQUEST_CONFIG)
            request.run
          end

          # Validates HTTP response status and body
          #
          # @param response [Typhoeus::Response] The HTTP response
          # @param kid [String] The key ID (for error messages)
          # @raise [StandardError] For HTTP errors or empty responses
          def validate_http_response(response, kid)
            return if response.success?

            error_message = if response.code.zero?
                             format(ERROR_MESSAGES[:no_response], kid)
                           else
                             format(ERROR_MESSAGES[:http_error], response.code, response.status_message, kid)
                           end
            raise StandardError, error_message
          end

          # Parses the response and converts JWK to RSA public key
          #
          # @param response [Typhoeus::Response] The HTTP response
          # @param kid [String] The key ID (for error messages)
          # @return [Hash] The RSA public key as a JWK hash
          # @raise [StandardError] For parsing errors
          # @raise [CyberSource::Authentication::Util::JWT::InvalidJwkException] For invalid JWK
          def parse_and_convert_response(response, kid)
            body = response.body
            raise StandardError, ERROR_MESSAGES[:empty_response] if body.nil? || body.strip.empty?

            jwk_data = parse_json_body(body)
            public_key = convert_jwk_to_public_key(jwk_data)
            
            raise StandardError, ERROR_MESSAGES[:invalid_public_key] unless public_key
            
            public_key
          end

          # Parses JSON response body
          #
          # @param body [String] The response body
          # @return [Hash] Parsed JSON data
          # @raise [StandardError] For JSON parsing errors
          def parse_json_body(body)
            JSON.parse(body)
          rescue JSON::ParserError => e
            raise StandardError, format(ERROR_MESSAGES[:parse_error], e.message)
          end

          # Converts JWK to RSA public key
          #
          # @param jwk_data [Hash] The JWK data
          # @return [Hash, nil] The RSA public key or nil
          # @raise [CyberSource::Authentication::Util::JWT::InvalidJwkException] For invalid JWK
          def convert_jwk_to_public_key(jwk_data)
            CyberSource::Authentication::Util::JWT::JWTUtility.get_rsa_public_key_from_jwk(jwk_data)
          rescue StandardError => e
            raise unless e.is_a?(CyberSource::Authentication::Util::JWT::InvalidJwkException)
            raise
          end
        end
      end
    end
  end
end
