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
      # and run environment.
      #
      # @category Class
      # @package  CyberSource::Authentication::Util::CaptureContext
      # @author   CyberSource
      class PublicKeyFetcher
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
          #
          # @return [Hash] The raw JWK hash from the API response
          # @raise [ArgumentError] If required parameters are missing
          # @raise [StandardError] For HTTP and network errors
          #
          # @example Fetch public key
          #   jwk_hash = PublicKeyFetcher.fetch_public_key('test-kid-123', 'apitest.cybersource.com')
          def fetch_public_key(kid, run_environment)
            validate_parameters(kid, run_environment)
            fetch_from_api(kid, run_environment)
          end

          private

          # Validates required parameters
          #
          # @param kid [String] The key ID
          # @param run_environment [String] The environment domain
          # @raise [ArgumentError] If parameters are invalid
          def validate_parameters(kid, run_environment)
            if kid.nil? || kid.to_s.strip.empty?
              raise ArgumentError, 'kid parameter is required'
            end

            if run_environment.nil? || run_environment.to_s.strip.empty?
              raise ArgumentError, 'runEnvironment parameter is required'
            end
          end

          # Fetches public key from the API
          #
          # @param kid [String] The key ID
          # @param run_environment [String] The environment domain
          # @return [Hash] The raw JWK hash from the API response
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
                             format('No response received - Failed to fetch public key for kid: %s', kid)
                           else
                             format('HTTP %s: %s - Failed to fetch public key for kid: %s', response.code, response.status_message, kid)
                           end
            raise StandardError, error_message
          end

          # Parses the response and returns the raw JWK hash
          #
          # @param response [Typhoeus::Response] The HTTP response
          # @param kid [String] The key ID (for error messages)
          # @return [Hash] The raw JWK hash from the API response
          # @raise [StandardError] For parsing errors
          def parse_and_convert_response(response, kid)
            body = response.body
            raise StandardError, 'Empty response received from public key endpoint' if body.nil? || body.strip.empty?

            JSON.parse(body)
          rescue JSON::ParserError => e
            raise StandardError, format('Failed to parse JWK response: %s', e.message)
          end
        end
      end
    end
  end
end
