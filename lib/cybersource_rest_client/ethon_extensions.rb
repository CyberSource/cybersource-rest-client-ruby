# frozen_string_literal: true

# Extension to add CURLOPT_MAXAGE_CONN support to Ethon without modifying the gem
# This file extends Ethon to add the maxage_conn option

require 'ethon'

# Now extend the Easy class to add the setter/getter methods
# This follows the same pattern as other Ethon options
module Ethon
  class Easy
    # Add the maxage_conn setter method - it will get call from set_attributes(options) from http actionable in ethon lib.
    def maxage_conn=(value)
      return if value.nil?
      @maxage_conn = value.to_i
      
      # CURLOPT_MAXAGE_CONN = CURLOPTTYPE_LONG + 288
      # CURLOPTTYPE_LONG = 0, so the option value is 0 + 288 = 288
      curl_option = 288
      # Call curl directly using Ethon::Curl.easy_setopt
      Ethon::Curl.easy_setopt(@handle, curl_option, :long, @maxage_conn)
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