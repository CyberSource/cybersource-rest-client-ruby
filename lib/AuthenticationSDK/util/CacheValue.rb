# Cache value object to store certificate data
class CacheValue
  attr_accessor :private_key, :cert, :file_modified_time

  def initialize(private_key = nil, cert = nil, file_modified_time = nil)
    @private_key = private_key
    @cert = cert
    @file_modified_time = file_modified_time
  end

  def to_s
    "CacheValue(private_key: #{@private_key ? 'present' : 'nil'}, cert: #{@cert ? 'present' : 'nil'}, file_modified_time: #{@file_modified_time})"
  end

  def empty?
    @private_key.nil? && @cert.nil? && @file_modified_time.nil?
  end
end