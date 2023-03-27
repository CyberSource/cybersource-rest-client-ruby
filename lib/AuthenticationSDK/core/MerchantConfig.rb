require_relative '../util/Constants.rb'
require_relative '../util/ExceptionHandler.rb'
require_relative '../logging/log_factory.rb'
require_relative '../logging/log_configuration.rb'

public
# This fuction has all the merchantConfig properties getters and setters methods
  class Merchantconfig
    def initialize(cybsPropertyObj)
    # Common Parameters
    @merchantId = cybsPropertyObj['merchantID']
    @runEnvironment = cybsPropertyObj['runEnvironment']
    @intermediateHost = cybsPropertyObj['intermediateHost']
    @authenticationType = cybsPropertyObj['authenticationType']
    @proxyAddress = cybsPropertyObj['proxyAddress']
    @proxyPort = cybsPropertyObj['proxyPort']
    @getId = ''
    @requestHost = ''
    @requestTarget = ''
    @requestJsonData = ''
    # HTTP Parameters
    @merchantSecretKey = cybsPropertyObj['merchantsecretKey']
    @merchantKeyId = cybsPropertyObj['merchantKeyId']
    # JWT Parameters
    @keysDirectory = cybsPropertyObj['keysDirectory']
    @keyAlias = cybsPropertyObj['keyAlias']
    @keyPass = cybsPropertyObj['keyPass']
    @keyFilename = cybsPropertyObj['keyFilename']
    @useMetaKey = cybsPropertyObj['useMetaKey']
    @portfolioID = cybsPropertyObj['portfolioID']
    @solutionId = cybsPropertyObj['solutionId']
    # MutualAuth & OAuth Parameters
    @enableClientCert = cybsPropertyObj['enableClientCert']
    @clientCertDirectory = cybsPropertyObj['clientCertDirectory']
    @sslClientCert = cybsPropertyObj['sslClientCert']
    @privateKey = cybsPropertyObj['privateKey']
    @sslKeyPassword = cybsPropertyObj['sslKeyPassword']
    @clientId = cybsPropertyObj['clientId']
    @clientSecret = cybsPropertyObj['clientSecret']
    @accessToken = cybsPropertyObj['accessToken']
    @refreshToken = cybsPropertyObj['refreshToken']
    # LogConfiguration
    @log_config = LogConfiguration.new(cybsPropertyObj['logConfiguration'])
    # Custom Default Headers
    @defaultCustomHeaders = cybsPropertyObj['defaultCustomHeaders']
    validateMerchantDetails()
    logAllProperties(cybsPropertyObj)
    end
    #fall back logic
    def validateMerchantDetails()
      logmessage=''
      @log_config.validate(logmessage)
      @log_obj = Log.new @log_config, "MerchantConfig"
      @log_obj.logger.info('START> =======================================')
      if !logmessage.to_s.empty?
        @log_obj.logger.warn(ExceptionHandler.new.new_api_warning logmessage)
      end
      if @authenticationType.to_s.empty?
        err = StandardError.new(Constants::ERROR_PREFIX + Constants::AUTH_TYPE_MANDATORY)
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end
      if !@authenticationType.instance_of? String
        err = StandardError.new(Constants::ERROR_PREFIX+ Constants::AUTH_ERROR)
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end
      if !@runEnvironment.to_s.empty?
        if !@runEnvironment.instance_of? String
          @requestHost = @runEnvironment.to_s
        end

        if Constants::OLD_RUN_ENVIRONMENT_CONSTANTS.include?(@runEnvironment.upcase)
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::DEPRECATED_ENVIRONMENT)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        else
          @requestHost = @runEnvironment
        end
      elsif @runEnvironment.to_s.empty?
        err = StandardError.new(Constants::ERROR_PREFIX + Constants::RUN_ENVIRONMENT)
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end

      if !@enableClientCert.nil? && @enableClientCert
        if @sslClientCert.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::SSL_CLIENT_CERT_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@sslClientCert.instance_of? String
          @sslClientCert=@sslClientCert.to_s
        end
        if @privateKey.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::PRIVATE_KEY_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@privateKey.instance_of? String
          @privateKey=@privateKey.to_s
        end
        if @sslKeyPassword.to_s.empty?
          err = Constants::WARNING_PREFIX + Constants::SSL_KEY_PASSWORD_EMPTY
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning err)
          raise err
        elsif !@sslKeyPassword.instance_of? String
          @sslKeyPassword=@sslKeyPassword.to_s
        end
        if @clientCertDirectory.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::CLIENT_CERT_DIR_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@clientCertDirectory.instance_of? String
          @clientCertDirectory=@clientCertDirectory.to_s
        end
      end

      if @authenticationType.upcase == Constants::AUTH_TYPE_JWT
        if @merchantId.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::MERCHANT_ID_NULL)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@merchantId.instance_of? String
          @merchantId=@merchantId.to_s
        end
        if @keyAlias.to_s.empty?
          @keyAlias = @merchantId
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::KEY_ALIAS_NULL_EMPTY)
        elsif !@keyAlias.instance_of? String
          @keyAlias=@keyAlias.to_s
        elsif @keyAlias != @merchantId
          @keyAlias = @merchantId
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::INCORRECT_KEY_ALIAS)
        end
        if @keyPass.to_s.empty?
          @keyPass = @merchantId
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::KEY_PASS_NULL)
        elsif !@keyPass.instance_of? String
          @keyPass=@keyPass.to_s
        end
        if @keysDirectory.to_s.empty?
          @keysDirectory = Constants::DEFAULT_KEY_DIRECTORY
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::KEY_DIRECTORY_EMPTY + @keysDirectory)
        elsif !@keysDirectory.instance_of? String
          @keysDirectory=@keysDirectory.to_s
        end
        if @keyFilename.to_s.empty?
          @keyFilename = @merchantId
          @log_obj.logger.warn(ExceptionHandler.new.new_api_warning Constants::WARNING_PREFIX + Constants::KEY_FILE_NAME_NULL_EMPTY)
        elsif !@keyFilename.instance_of? String
          @keyFilename=@keyFilename.to_s
        end
      end
      if @authenticationType.upcase == Constants::AUTH_TYPE_MUTUAL_AUTH
        if @clientId.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::CLIENT_ID_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@clientId.instance_of? String
          @clientId=@clientId.to_s
        end
        if @clientSecret.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::CLIENT_SECRET_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@clientSecret.instance_of? String
          @clientSecret=@clientSecret.to_s
        end
      end
      if @authenticationType.upcase == Constants::AUTH_TYPE_OAUTH
        if @accessToken.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::ACCESS_TOKEN_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@accessToken.instance_of? String
          @accessToken=@accessToken.to_s
        end
        if @refreshToken.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::REFRESH_TOKEN_EMPTY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@refreshToken.instance_of? String
          @refreshToken=@refreshToken.to_s
        end
      end
      if @authenticationType.upcase == Constants::AUTH_TYPE_HTTP
        if @merchantId.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX + Constants::MERCHANT_ID_NULL)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@merchantId.instance_of? String
          @merchantId=@merchantId.to_s
        end
        if @merchantKeyId.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX+ Constants::MERCHANT_KEY_ID_MANDATORY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@merchantKeyId.instance_of? String
          @merchantKeyId=@merchantKeyId.to_s
        end
        if @merchantSecretKey.to_s.empty?
          err = StandardError.new(Constants::ERROR_PREFIX+ Constants::MERCHANT_SECRET_KEY_MANDATORY)
          @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
          raise err
        elsif !@merchantSecretKey.instance_of? String
          @merchantSecretKey=@merchantSecretKey.to_s
        end
      end
      if @useMetaKey && @portfolioID.to_s.empty?
        err = StandardError.new(Constants::ERROR_PREFIX+ Constants::PORTFOLIO_ID_MANDATORY)
        @log_obj.logger.error(ExceptionHandler.new.new_api_exception err)
        raise err
      end

      if !@proxyAddress.instance_of? String
        @proxyAddress=@proxyAddress.to_s
      end
      if !@proxyPort.instance_of? String
        @proxyPort=@proxyPort.to_s
      end
    end

    def logAllProperties(propertyObj)
      merchantConfig = ''
      hiddenProperties = (Constants::HIDDEN_MERCHANT_PROPERTIES).split(',')
      hiddenPropArray = Array.new
      hiddenProperties.each do |value|
        hiddenPropArray << value.strip
      end
      hiddenPropArray.each do |prop|
        propertyObj.each do |key, value|
          if key == prop
            propertyObj.delete(key)
          end
        end
      end
      @log_obj.logger.info('Merchant Configuration :\n' + propertyObj.to_s)
    end

    # getter and setter methods
    attr_accessor :merchantId
    attr_accessor :merchantSecretKey
    attr_accessor :merchantKeyId
    attr_accessor :authenticationType
    attr_accessor :keysDirectory
    attr_accessor :requestHost
    attr_accessor :intermediateHost
    attr_accessor :keyAlias
    attr_accessor :keyPass
    attr_accessor :keyFilename
    attr_accessor :useMetaKey
    attr_accessor :portfolioID
    attr_accessor :enableClientCert
    attr_accessor :clientCertDirectory
    attr_accessor :sslClientCert
    attr_accessor :sslKeyPassword
    attr_accessor :privateKey
    attr_accessor :clientId
    attr_accessor :clientSecret
    attr_accessor :accessToken
    attr_accessor :refreshToken
    attr_accessor :requestJsonData
    attr_accessor :requestUrl
    attr_accessor :requestType
    attr_accessor :getId
    attr_accessor :logger
    attr_accessor :log_config
    attr_accessor :proxyAddress
    attr_accessor :proxyPort
    attr_accessor :requestTarget
    attr_accessor :log_obj
    attr_accessor :solutionId
    attr_accessor :defaultCustomHeaders
  end