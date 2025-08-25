require 'openssl'
require 'base64'

public

  class Utility
    def getResponseCodeMessage(responseCode)
      responseCode = responseCode.to_s
      case responseCode
      when "200"
        tempResponseCodeMessage = "Transcation Successful"
      when "201"
        tempResponseCodeMessage = "Transcation Successful"
      when "400"
        tempResponseCodeMessage = "Bad Request"
      when "401"
        tempResponseCodeMessage = "Authentication Failed"
      when "404"
        tempResponseCodeMessage = "Not Found"
      when "403"
        tempResponseCodeMessage = "Forbidden"
      when "500"
        tempResponseCodeMessage = "Internal Server Error"
      when "502"
        tempResponseCodeMessage = "Bad Gateway"
      when "503"
        tempResponseCodeMessage = "Service Unavailable"
      when "504"
        tempResponseCodeMessage = "Gateway Timeout"
      else
        tempResponseCodeMessage= ''
      end
      return tempResponseCodeMessage
    end
  end

