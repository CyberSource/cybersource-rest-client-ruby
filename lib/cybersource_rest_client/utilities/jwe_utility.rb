# frozen_string_literal: true

require_relative '../../AuthenticationSDK/util/JWEUtility'
module CyberSource

  public
  class JWEUtility
    def self.decryptJWEResponse(encoded_response, merchant_config)
      return AuthJWEUtility.decrypt_jwe_using_pem(merchant_config, encoded_response)
    end
  end
end
