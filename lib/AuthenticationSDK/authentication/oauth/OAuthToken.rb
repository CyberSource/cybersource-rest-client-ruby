require_relative '../../core/ITokenGeneration.rb'
require_relative '../../util/Constants.rb'
require_relative '../../util/ApiException.rb'
require_relative '../../util/Cache.rb'
public
#JWT Token-generated based  on the Request type
  class GenerateOAuthToken
    def getToken(merchantconfig_obj,gmtDatetime,log_obj)
      token = merchantconfig_obj.accessToken
    rescue StandardError => err
      ApiException.new.apiexception(err,log_obj)
      exit!
    end
    implements TokenInterface
  end