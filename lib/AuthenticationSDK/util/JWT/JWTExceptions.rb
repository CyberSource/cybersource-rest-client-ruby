# frozen_string_literal: true

module CyberSource
  module Authentication
    module Util
      module JWT
        # Base JWT Exception Class
        #
        # Provides enhanced exception handling for JWT-related operations with
        # error chaining and detailed stack trace information.
        class JWTException < StandardError
          # @param message [String] Error message describing the exception
          # @param cause [Exception, nil] Optional underlying cause of the error
          def initialize(message = '', cause = nil)
            super(message)
            set_backtrace(cause.backtrace) if cause&.backtrace
          end

          # @return [Boolean] True if a cause exception exists
          def has_cause?
            !cause.nil?
          end

          # @return [String] Exception string with cause information
          def to_s
            return super unless has_cause?

            "#{super}\nCaused by: #{cause}"
          end

          # @return [Array<Exception>] Array of exceptions in the chain
          def exception_chain
            chain = [self]
            current = cause

            while current
              chain << current
              current = current.cause
            end

            chain
          end

          # @return [Exception] The root cause of the exception chain
          def root_cause
            exception_chain.last
          end

          # @return [Array<String>] Error messages from all exceptions in the chain
          def cause_chain_messages
            exception_chain.map(&:message)
          end

          # @param highlight [Boolean] Whether to highlight the message
          # @param order [Symbol] :top or :bottom, determines message order
          # @return [String] Detailed error message with all causes
          def full_message(highlight: false, order: :top, **)
            messages = exception_chain.each_with_index.map do |exception, index|
              prefix = index.zero? ? '' : 'Caused by: '
              "#{prefix}#{exception.class}: #{exception.message}"
            end

            order == :bottom ? messages.reverse.join("\n") : messages.join("\n")
          end
        end

        # Thrown when a JSON Web Key (JWK) is invalid or malformed
        class InvalidJwkException < JWTException
        end

        # Thrown when a JWT token is invalid, malformed, or cannot be processed
        class InvalidJwtException < JWTException
        end

        # Thrown when JWT signature validation fails
        class JwtSignatureValidationException < JWTException
        end
      end
    end
  end
end
