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

    def fetchCert(key_pass, file, key_alias)
      p12_file = OpenSSL::PKCS12.new(file, key_pass)
      x5_cert_pem = p12_file.certificate
      x5_cert_pem.subject.to_a.each do |attribute|
        return  Base64.strict_encode64(x5_cert_pem.to_der) if attribute[1].include?(key_alias)
      end
      unless p12_file.ca_certs.nil?
        p12_file.ca_certs.each do |cert|
          cert.subject.to_a.each do |attribute|
            return  Base64.strict_encode64(cert.to_der) if attribute[1].include?(key_alias)
          end
        end
      end
      nil
    end

     def getCertBasedOnKeyAlias(x5_certs, key_alias)
      unless x5_certs.nil?
        x5_certs.each do |cert|
          cert.subject.to_a.each do |attribute|
            return  Base64.strict_encode64(cert.to_der) if attribute[1].include?(key_alias)
          end
        end
      end
      nil
    end
  end

