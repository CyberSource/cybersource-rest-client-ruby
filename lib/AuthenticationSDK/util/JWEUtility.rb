# frozen_string_literal: true

require_relative './Cache'
require 'jose'

public
class JWEUtility
  # <b>DEPRECATED:</b> This method has been marked as Deprecated and will be removed in coming releases. Use <tt>decrypt_jwe_using_private_key()</tt> instead.
  def self.decrypt_jwe_using_pem(merchant_config, encoded_response)
    warn("[DEPRECATED] `decrypt_jwe_using_pem()` method is deprecated and will be removed in coming releases. Use `decrypt_jwe_using_private_key()` instead.")
    key = Cache.new.fetchPEMFileForNetworkTokenization(merchant_config.pemFileDirectory)
    return JOSE::JWE.block_decrypt(key, encoded_response).first
  end

  def self.decrypt_jwe_using_private_key(private_key, encoded_response)
    return JOSE::JWE.block_decrypt(private_key, encoded_response).first
  end
end
