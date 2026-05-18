# frozen_string_literal: true

require_relative '../../AuthenticationSDK/util/AuthJWEUtility'
module CyberSource

  public
  class JWEUtility
    # <b>DEPRECATED:</b> This method has been marked as Deprecated and will be removed in coming releases. Use <tt>decryptJWUsingPrivateKey()</tt> instead.
    def self.decryptJWEResponse(encoded_response, merchant_config)
      warn("[DEPRECATED] `decryptJWEResponse()` method is deprecated and will be removed in coming releases. Use `decryptJWUsingPrivateKey()` instead.")
      return AuthJWEUtility.decrypt_jwe_using_pem(merchant_config, encoded_response)
    end

    def self.decryptJWUsingPrivateKey(private_key, encoded_response)
      return AuthJWEUtility.decrypt_jwe_using_private_key(private_key, encoded_response)
    end
  end
end
