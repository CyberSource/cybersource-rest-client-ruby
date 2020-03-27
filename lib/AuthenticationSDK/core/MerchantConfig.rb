require_relative './Logger.rb'
require_relative '../util/Constants.rb'
require_relative '../util/ApiException.rb'
public
# This fuction has all the merchantConfig properties getters and setters methods
  class Merchantconfig
    def initialize(cybsPropertyObj)
    # Common Parameters
    @merchantId = cybsPropertyObj['merchantID']
    @runEnvironment = cybsPropertyObj['runEnvironment']
    @authenticationType = cybsPropertyObj['authenticationType']
    @logDirectory = cybsPropertyObj['logDirectory']
    @logSize = cybsPropertyObj['logSize']
    @enableLog = cybsPropertyObj['enableLog']
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
    @logFilename = cybsPropertyObj['logFilename']
    @solutionId = cybsPropertyObj['solutionId']
    validateMerchantDetails()
    logAllProperties(cybsPropertyObj)
    end
    #fall back logic
    def validateMerchantDetails()
      logmessage=''
      if @enableLog.to_s.empty?
        @enableLog = true
      elsif @enableLog.instance_of? Integer
        @enableLog = @enableLog.to_s
      end
      if @logSize.to_s.empty?
        @logSize = Constants::DEFAULT_LOG_SIZE
      elsif !@logSize.instance_of? Integer
        @logSize=@logSize.to_i
      end
      if @logDirectory.to_s.empty? || !Dir.exist?(@logDirectory)
        @logDirectory = Constants::DEFAULT_LOG_DIRECTORY
        unless Dir.exist?(@logDirectory)
          Dir.mkdir(Constants::DEFAULT_LOG_DIRECTORY)
        end
        logmessage = Constants::WARNING_PREFIX + Constants::INVALID_LOG_DIRECTORY + File.expand_path(@logDirectory)
      end
      if @logFilename.to_s.empty?
        @logFilename = Constants::DEFAULT_LOGFILE_NAME
      elsif !@logFilename.instance_of? String
        @logFilename=@logFilename.to_s
      end
      @log_obj = Log.new @logDirectory,@logFilename,@logSize,@enableLog
      @log_obj.logger.info('START> =======================================')
      if !logmessage.to_s.empty?
        ApiException.new.apiwarning(logmessage,log_obj)
      end
      if @merchantId.to_s.empty?
        err = raise StandardError.new(Constants::ERROR_PREFIX + Constants::MERCHANT_ID_NULL)
        ApiException.new.apiexception(err,log_obj)
      elsif !@merchantId.instance_of? String
        @merchantId=@merchantId.to_s
      end
      if @authenticationType.to_s.empty?
        err = raise StandardError.new(Constants::ERROR_PREFIX + Constants::AUTH_TYPE_MANDATORY)
        ApiException.new.apiexception(err,log_obj) 
      end
      if !@authenticationType.instance_of? String 
        err = raise StandardError.new(Constants::ERROR_PREFIX+ Constants::AUTH_ERROR)
        ApiException.new.apiexception(err,log_obj)
      end
      if !@runEnvironment.to_s.empty?
        if !@runEnvironment.instance_of? String
          @requestHost = @runEnvironment.to_s
        elsif @runEnvironment.upcase == Constants::RUN_ENV_PROD
          @requestHost = Constants::PRODUCTION_URL
        elsif @runEnvironment.upcase == Constants::RUN_ENV_SANDBOX
          @requestHost = Constants::SANDBOX_URL
        elsif @runEnvironment.upcase == Constants::BOA_RUN_ENV_PROD
          @requestHost = Constants::BOA_PRODUCTION_URL
        elsif @runEnvironment.upcase == Constants.BOA_RUN_ENV_SANDBOX
          @requestHost = Constants::BOA_SANDBOX_URL
        else
          @requestHost = @runEnvironment
        end
      elsif @runEnvironment.to_s.empty?
        err = raise StandardError.new(Constants::ERROR_PREFIX + Constants::RUN_ENVIRONMENT)
        ApiException.new.apiexception(err,log_obj)
      end
      if @authenticationType.upcase == Constants::AUTH_TYPE_JWT
        if @keyAlias.to_s.empty?
          @keyAlias = @merchantId
          ApiException.new.apiwarning(Constants::WARNING_PREFIX + Constants::KEY_ALIAS_NULL_EMPTY, log_obj)
        elsif !@keyAlias.instance_of? String
          @keyAlias=@keyAlias.to_s
        elsif @keyAlias != @merchantId
          @keyAlias = @merchantId
          ApiException.new.apiwarning(Constants::WARNING_PREFIX + Constants::INCORRECT_KEY_ALIAS, log_obj)
        end
        if @keyPass.to_s.empty?
          @keyPass = @merchantId
          ApiException.new.apiwarning(Constants::WARNING_PREFIX + Constants::KEY_PASS_NULL, log_obj)
        elsif !@keyPass.instance_of? String
          @keyPass=@keyPass.to_s
        end
        if @keysDirectory.to_s.empty?
          @keysDirectory = Constants::DEFAULT_KEY_DIRECTORY
          ApiException.new.apiwarning(Constants::WARNING_PREFIX + Constants::KEY_DIRECTORY_EMPTY + @keysDirectory, log_obj)
        elsif !@keysDirectory.instance_of? String
          @keysDirectory=@keysDirectory.to_s
        end
        if @keyFilename.to_s.empty?
          @keyFilename = @merchantId
          ApiException.new.apiwarning(Constants::WARNING_PREFIX + Constants::KEY_FILE_NAME_NULL_EMPTY, log_obj)
        elsif !@keyFilename.instance_of? String
          @keyFilename=@keyFilename.to_s
        end
      end
      if @authenticationType.upcase == Constants::AUTH_TYPE_HTTP
        if @merchantKeyId.to_s.empty?
          err = raise StandardError.new(Constants::ERROR_PREFIX+ Constants::MERCHANT_KEY_ID_MANDATORY)
          ApiException.new.apiexception(err,log_obj)
        elsif !@merchantKeyId.instance_of? String
          @merchantKeyId=@merchantKeyId.to_s
        end
        if @merchantSecretKey.to_s.empty?
          err = raise StandardError.new(Constants::ERROR_PREFIX+ Constants::MERCHANT_SECRET_KEY_MANDATORY) 
          ApiException.new.apiexception(err,log_obj)
        elsif !@merchantSecretKey.instance_of? String
          @merchantSecretKey=@merchantSecretKey.to_s
        end
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
      @log_obj.logger.info('MERCHCFG >' + propertyObj.to_s)
    end
     
    # getter and setter methods
    attr_accessor :merchantId
    attr_accessor :merchantSecretKey
    attr_accessor :merchantKeyId
    attr_accessor :authenticationType
    attr_accessor :keysDirectory
    attr_accessor :requestHost
    attr_accessor :keyAlias
    attr_accessor :keyPass
    attr_accessor :keyFilename
    attr_accessor :requestJsonData
    attr_accessor :requestUrl
    attr_accessor :requestType
    attr_accessor :getId
    attr_accessor :logDirectory
    attr_accessor :logFilename
    attr_accessor :enableLog
    attr_accessor :logSize
    attr_accessor :logger
    attr_accessor :proxyAddress
    attr_accessor :proxyPort
    attr_accessor :requestTarget
    attr_accessor :log_obj
    attr_accessor :solutionId
  end