# frozen_string_literal: true

require 'jose'

public
class AuthJWEUtility
  def self.get_key_from_pem_file(path)
    return JOSE::JWK.from_pem_file path
  end

  def self.decrypt_jwe_using_pem(merchant_config, encoded_response)
    path = merchant_config.pemFileDirectory
    key = get_key_from_pem_file(path)
    return JOSE::JWE.block_decrypt(key, encoded_response).first
  end

end
