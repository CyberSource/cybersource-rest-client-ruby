# frozen_string_literal: true

require 'jwt'
require 'json'
require_relative 'JWTExceptions'

module CyberSource
  module Authentication
    module Util
      module JWT
        # JWT Utility Class
        #
        # Provides JWT parsing, verification, and JWK handling functionality.
        #
        # @category Class
        # @package  CyberSource::Authentication::Util::JWT
        # @author   CyberSource
        class JWTUtility
          # Supported JWT algorithms
          SUPPORTED_ALGORITHMS = %w[RS256 RS384 RS512].freeze

          # Error messages constants
          ERROR_MESSAGES = {
            unsupported_algorithm: 'Unsupported JWT algorithm: %s. Supported algorithms: %s',
            missing_algorithm: 'JWT header missing algorithm (alg) field',
            no_public_key: 'No public key found',
            invalid_public_key_format: 'Invalid public key format. Expected JWK object or JSON string.',
            invalid_rsa_key: 'Public key must be an RSA key (kty: RSA)',
            missing_rsa_params: 'Invalid RSA JWK: missing required parameters (n, e)'
          }.freeze

          class << self
            # Parses a JWT token and extracts its header, payload, and signature components
            #
            # @param jwt_token [String] The JWT token to parse
            #
            # @return [Hash] Hash containing header, payload, signature, and raw parts
            # @raise [InvalidJwtException] If the JWT token is invalid or malformed
            def parse(jwt_token)
              raise InvalidJwtException.new('JWT token is null or undefined') if jwt_token.to_s.empty?

              token_parts = jwt_token.split('.')
              unless token_parts.length == 3
                raise InvalidJwtException.new('Invalid JWT token format: expected 3 parts separated by dots')
              end

              if token_parts.any?(&:empty?)
                raise InvalidJwtException.new('Invalid JWT token: one or more parts are empty')
              end

              begin
                header = JSON.parse(::JWT::Base64.url_decode(token_parts[0]))
                payload = JSON.parse(::JWT::Base64.url_decode(token_parts[1]))
                signature = token_parts[2]

                {
                  header: header,
                  payload: payload,
                  signature: signature,
                  raw_header: token_parts[0],
                  raw_payload: token_parts[1]
                }
              rescue StandardError => e
                raise InvalidJwtException.new("Malformed JWT cannot be parsed: #{e.message}", e)
              end
            end

            # Verifies a JWT token using an RSA public key
            #
            # @param jwt_token [String] The JWT token to verify
            # @param public_key [String, Hash] The RSA public key (JWK Hash or JSON string)
            #
            # @return [void]
            # @raise [InvalidJwtException] If JWT parsing fails
            # @raise [JwtSignatureValidationException] If signature verification fails
            # @raise [InvalidJwkException] If the public key is invalid
            # @raise [JSON::ParserError] If JSON parsing fails
            def verify_jwt(jwt_token, public_key)
              raise JwtSignatureValidationException.new(ERROR_MESSAGES[:no_public_key]) if public_key.to_s.empty?
              raise JwtSignatureValidationException.new('JWT token is null or undefined') if jwt_token.to_s.empty?

              parsed_token = parse(jwt_token)
              header = parsed_token[:header]

              unless header['alg']
                raise JwtSignatureValidationException.new(ERROR_MESSAGES[:missing_algorithm])
              end

              algorithm = header['alg']
              unless SUPPORTED_ALGORITHMS.include?(algorithm)
                supported_algs = SUPPORTED_ALGORITHMS.join(', ')
                raise JwtSignatureValidationException.new(
                  format(ERROR_MESSAGES[:unsupported_algorithm], algorithm, supported_algs)
                )
              end

              jwk_key = validate_and_parse_jwk(public_key)
              jwk_key['alg'] ||= algorithm

              begin
                rsa_key = jwk_to_rsa_key(jwk_key)
                ::JWT.decode(jwt_token, rsa_key, true, { algorithm: algorithm })

              rescue ::JWT::VerificationError => e
                raise JwtSignatureValidationException.new('JWT signature verification failed', e)
              rescue ::JWT::ExpiredSignature => e
                raise JwtSignatureValidationException.new('JWT has expired (exp claim)', e)
              rescue ::JWT::ImmatureSignature => e
                raise JwtSignatureValidationException.new('JWT not yet valid (nbf claim)', e)
              rescue ::JWT::DecodeError => e
                raise JwtSignatureValidationException.new("JWT verification failed: #{e.message}", e)
              rescue JwtSignatureValidationException, InvalidJwtException
                raise
              rescue StandardError => e
                raise JwtSignatureValidationException.new("JWT verification failed: #{e.message}", e)
              end
            end

            # Extracts an RSA public key from a JWK JSON string
            #
            # @param jwk_json_string [String] The JWK JSON string containing the RSA key
            #
            # @return [Hash] The RSA public key hash
            # @raise [InvalidJwkException] If the JWK is invalid or not an RSA key
            # @raise [JSON::ParserError] If JSON parsing fails
            def get_rsa_public_key_from_jwk(jwk_json_string)
              validate_and_parse_jwk(jwk_json_string)
            end

            private

            # Validates and parses a JWK (JSON Web Key)
            #
            # @param public_key [String, Hash] The public key to validate (JWK Hash or JSON string)
            #
            # @return [Hash] The parsed and validated JWK
            # @raise [InvalidJwkException] If the JWK is invalid or not an RSA key
            def validate_and_parse_jwk(public_key)
              return public_key if public_key.is_a?(Hash) && public_key.key?('kty')

              jwk_hash = if public_key.is_a?(String)
                           begin
                             JSON.parse(public_key)
                           rescue JSON::ParserError => e
                             raise InvalidJwkException.new('Invalid public key JSON format', e)
                           end
                         else
                           raise InvalidJwkException.new(ERROR_MESSAGES[:invalid_public_key_format])
                         end

              raise InvalidJwkException.new(ERROR_MESSAGES[:invalid_rsa_key]) unless jwk_hash['kty'] == 'RSA'
              raise InvalidJwkException.new(ERROR_MESSAGES[:missing_rsa_params]) unless jwk_hash['n'] && jwk_hash['e']

              jwk_hash
            end

            # Converts a JWK to an RSA key object
            #
            # @param jwk [Hash] The JWK to convert
            #
            # @return [OpenSSL::PKey::RSA] The RSA key object
            # @raise [InvalidJwkException] If conversion fails
            def jwk_to_rsa_key(jwk)
              # Use jwt gem's JWK support for OpenSSL 3.0+ compatibility
              # This handles both OpenSSL 1.x and 3.0+ internally
              ::JWT::JWK.import(jwk).keypair
            rescue StandardError => e
              raise InvalidJwkException.new("Failed to convert JWK to RSA key: #{e.message}", e)
            end
          end
        end
      end
    end
  end
end
