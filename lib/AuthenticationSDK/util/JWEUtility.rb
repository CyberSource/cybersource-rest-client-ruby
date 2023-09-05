# frozen_string_literal: true

require_relative './Cache'
require 'jose'

public
class AuthJWEUtility

  def self.decrypt_jwe_using_pem(merchant_config, encoded_response)
    cache_obj = ActiveSupport::Cache::MemoryStore.new
    key = Cache.new.fetchPEMFileForNetworkTokenization(merchant_config.pemFileDirectory, cache_obj)
    return JOSE::JWE.block_decrypt(key, encoded_response).first
  end
end
