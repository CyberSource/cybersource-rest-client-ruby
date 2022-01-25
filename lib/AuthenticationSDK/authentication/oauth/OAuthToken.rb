require_relative '../../core/ITokenGeneration.rb'
require_relative '../../util/Constants.rb'
require_relative '../../util/ExceptionHandler.rb'
require_relative '../../util/Cache.rb'
require_relative '../../logging/log_factory.rb'

public
  class GenerateOAuthToken
    @log_obj

    #JWT Token-generated based  on the Request type
    def getToken(merchantconfig_obj, gmtDatetime)
      @log_obj = Log.new merchantconfig_obj.log_config, "OAuthToken"
      token = merchantconfig_obj.accessToken
    rescue StandardError => err
      @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
      raise err
      # exit!
    end
    implements TokenInterface
  end