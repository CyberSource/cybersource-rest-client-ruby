require_relative '../authentication/http/HttpSignatureHeader.rb'
require_relative '../authentication/jwt/JwtToken.rb'
require_relative '../authentication/oauth/OAuthToken.rb'
require_relative '../util/Constants.rb'
require_relative '../util/ApiException.rb'
public
# This function calls for the generation of Signature message depending on the authentication type.
  class Authorization
    def getToken(merchantconfig_obj, gmtdatetime, log_obj)
      authenticationType = merchantconfig_obj.authenticationType.upcase
      if merchantconfig_obj.requestType.to_s.empty?
        raise StandardError.new(Constants::ERROR_PREFIX + Constants::REQUEST_TYPE_EMPTY)
      end
      if authenticationType == Constants::AUTH_TYPE_HTTP
        token = GenerateHttpSignature.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
      elsif authenticationType == Constants::AUTH_TYPE_JWT
        token = GenerateJwtToken.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
      elsif authenticationType == Constants::AUTH_TYPE_OAUTH
        token = GenerateOAuthToken.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
      else
        raise StandardError.ner(Constants::ERROR_PREFIX + Constants::AUTH_ERROR)
      end
    rescue StandardError => err
      ApiException.new.apiexception(err,log_obj)
      exit!
    end
  end
