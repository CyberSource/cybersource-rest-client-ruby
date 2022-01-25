require_relative '../authentication/http/HttpSignatureHeader.rb'
require_relative '../authentication/jwt/JwtToken.rb'
require_relative '../authentication/oauth/OAuthToken.rb'
require_relative '../util/Constants.rb'
require_relative '../util/ExceptionHandler.rb'
require_relative '../logging/log_factory.rb'
public
# This function calls for the generation of Signature message depending on the authentication type.
    class Authorization
        @log_obj
        def getToken(merchantconfig_obj, gmtdatetime)
            @log_obj = Log.new merchantconfig_obj.log_config, "Authorization"

            authenticationType = merchantconfig_obj.authenticationType.upcase
            @log_obj.logger.info("Authentication Type: " + authenticationType)

            if merchantconfig_obj.requestType.to_s.empty?
                raise StandardError.new(Constants::ERROR_PREFIX + Constants::REQUEST_TYPE_EMPTY)
            end

            if authenticationType == Constants::AUTH_TYPE_HTTP
                token = GenerateHttpSignature.new.getToken(merchantconfig_obj, gmtdatetime)
            elsif authenticationType == Constants::AUTH_TYPE_JWT
                token = GenerateJwtToken.new.getToken(merchantconfig_obj, gmtdatetime)
            elsif authenticationType == Constants::AUTH_TYPE_OAUTH
                token = GenerateOAuthToken.new.getToken(merchantconfig_obj, gmtdatetime)
            else
                raise StandardError.ner(Constants::ERROR_PREFIX + Constants::AUTH_ERROR)
            end
        rescue StandardError => err
            @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
            raise err
            # exit!
        end
    end
