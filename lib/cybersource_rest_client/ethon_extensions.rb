# frozen_string_literal: true

# Extension to add CURLOPT_MAXAGE_CONN support to Ethon without modifying the gem
# This file extends Ethon to add the maxage_conn option

require 'ethon'

# Extend Ethon by reopening the Options module and adding our option
module Ethon
  module Curls
    module Options
      # Add the maxage_conn option (CURLOPT_MAXAGE_CONN = 288)
      # Using the same pattern as other options in Ethon
      option :easy, :maxage_conn, :int, 288
      
      # Add an alias for backward compatibility
      option_alias :easy, :maxage_conn, :max_connection_age
    end
  end
end

# Now extend the Easy class to add the setter/getter methods
# This follows the same pattern as other Ethon options
module Ethon
  class Easy
    # Add the maxage_conn setter method
    def maxage_conn=(value)
      return if value.nil?
      @maxage_conn = value.to_i
      
      # Calculate the curl option value: CURLOPT_MAXAGE_CONN = CURLOPTTYPE_LONG + 288
      # CURLOPTTYPE_LONG = 0, so the option value is 288
      curl_option = 30000 + 288  # 30000 is CURLOPTTYPE_OFF_T base, but MAXAGE_CONN is actually LONG type, so it should be 0 + 288 = 288
      
      # Call curl directly using Ethon::Curl.easy_setopt
      Ethon::Curl.easy_setopt(@handle, 288, :long, @maxage_conn)
    end
    
    # Add the maxage_conn getter method
    def maxage_conn
      @maxage_conn
    end
    
    # Add alias methods
    def max_connection_age=(value)
      self.maxage_conn = value
    end
    
    def max_connection_age
      @maxage_conn
    end
  end
end

puts "[CyberSource] Extended Ethon with CURLOPT_MAXAGE_CONN support"
