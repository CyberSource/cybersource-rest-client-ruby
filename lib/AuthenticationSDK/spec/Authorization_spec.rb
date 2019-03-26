require_relative './spec_helper'
require_relative '../../AuthenticationSDK/util/Constants.rb'
require_relative './MerchantConfigData.rb'
require_relative '../core/MerchantConfig.rb'
require_relative '../authentication/http/HttpSignatureHeader.rb'
require_relative '../authentication/jwt/JwtToken.rb'
require_relative '../core/Authorization.rb'
require 'net/http'
require 'json'
require 'date'

describe Authorization do
    it 'validating HTTP get Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='Http_signature'
        getId='5246387105766473203529' #capture-5289697403596987704107
        requestTarget='/pts/v2/payments/'
        merchantconfig_obj.requestTarget=requestTarget + getId
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='GET'
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        token = Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
        expect(token).not_to be_empty
    end
    it 'validating HTTP post Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='Http_signature'
        requestTarget='/pts/v2/payments'
        requestJsonPath='../PostRequestData.json'
        merchantconfig_obj.requestTarget=requestTarget
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='POST'
        merchantconfig_obj.requestJsonData=File.read(File.expand_path(requestJsonPath,__FILE__))
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        token = Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
        expect(token).not_to be_empty
    end
    it 'validating HTTP put Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='Http_signature'
        requestTarget='/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest'
        requestJsonPath='../PutRequestData.json'
        merchantconfig_obj.requestTarget=requestTarget
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='PUT'
        merchantconfig_obj.requestJsonData=File.read(File.expand_path(requestJsonPath,__FILE__))
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        token = Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
        expect(token).not_to be_empty
    end
    it 'validating HTTP Delete Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='Http_signature'
        getId='5246387105766473203529'
        requestTarget='/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest/'
        merchantconfig_obj.requestTarget=requestTarget + getId
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='DELETE'
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        token = Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
        expect(token).not_to be_empty
    end
    it 'validating JWT get Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='JWT'
        requestTarget='/pts/v2/payments'
        merchantconfig_obj.keysDirectory=File.expand_path(merchantconfig_obj.keysDirectory,__FILE__)
        merchantconfig_obj.requestTarget=requestTarget
        getId='5246387105766473203529' #capture-5289697403596987704107
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget + '/' + getId
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='GET'
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        token = Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
        expect(token).not_to be_empty
    end
    it 'validating JWT post Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='JWT'
        requestTarget='/pts/v2/payments'
        merchantconfig_obj.keysDirectory=File.expand_path(merchantconfig_obj.keysDirectory,__FILE__)
        requestJsonPath='../PostRequestData.json'
        merchantconfig_obj.requestTarget=requestTarget
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='POST'
        merchantconfig_obj.requestJsonData=File.read(File.expand_path(requestJsonPath,__FILE__))
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        token = Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
        expect(token).not_to be_empty
    end
    it 'validating JWT put Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='JWT'
        requestTarget='/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest'
        requestJsonPath='../PutRequestData.json'
        merchantconfig_obj.keysDirectory=File.expand_path(merchantconfig_obj.keysDirectory,__FILE__)
        merchantconfig_obj.requestTarget=requestTarget
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='PUT'
        merchantconfig_obj.requestJsonData=File.read(File.expand_path(requestJsonPath,__FILE__))
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        token = Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
        expect(token).not_to be_empty
    end
    it 'validating JWT Delete Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='JWT'
        getId='5246387105766473203529'
        requestTarget='/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest/'
        merchantconfig_obj.requestTarget=requestTarget + getId
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url
        merchantconfig_obj.requestType='DELETE'
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        token = Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj)
        expect(token).not_to be_empty
    end
    it 'validating Auth type exception in Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='Signature'
        requestTarget='/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest'
        requestJsonPath='../PutRequestData.json'
        merchantconfig_obj.requestTarget=requestTarget
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='PUT'
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        expect { Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj) }.to raise_error(StandardError)
    end
    it 'validating Request type exception in Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='Http_Signature'
        requestTarget='/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest'
        requestJsonPath='../PutRequestData.json'
        merchantconfig_obj.requestTarget=requestTarget
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType=""
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        expect { Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj) }.to raise_error(StandardError)
    end
    # checking for invalid File path for p12 file
    it 'validating JWT get invalid key directory Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='JWT'
        requestTarget='/pts/v2/payments'
        merchantconfig_obj.keysDirectory='../../../AuthenticationSDK/res'
        merchantconfig_obj.keysDirectory=File.expand_path(merchantconfig_obj.keysDirectory,__FILE__)
        merchantconfig_obj.requestTarget=requestTarget
        getId='5246387105766473203529' #capture-5289697403596987704107
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget + '/' + getId
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='GET'
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        expect { Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj) }.to raise_error(StandardError)
    end
    it 'validating JWT post invalid keydirectory Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='JWT'
        requestTarget='/pts/v2/payments'
        merchantconfig_obj.keysDirectory='../../../AuthenticationSDK/res'
        merchantconfig_obj.keysDirectory=File.expand_path(merchantconfig_obj.keysDirectory,__FILE__)
        requestJsonPath='../PostRequestData.json'
        merchantconfig_obj.requestTarget=requestTarget
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='POST'
        merchantconfig_obj.requestJsonData=File.read(File.expand_path(requestJsonPath,__FILE__))
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        expect { Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj) }.to raise_error(StandardError)
    end
    it 'validating JWT put invalid keysdirectory Authorization' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
        merchantconfig_obj=Merchantconfig.new cybsPropertyobj
        merchantconfig_obj.authenticationType='JWT'
        requestTarget='/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest'
        requestJsonPath='../PutRequestData.json'
        merchantconfig_obj.keysDirectory='../../../AuthenticationSDK/res'
        merchantconfig_obj.keysDirectory=File.expand_path(merchantconfig_obj.keysDirectory,__FILE__)
        merchantconfig_obj.requestTarget=requestTarget
        url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
        merchantconfig_obj.requestUrl=url 
        merchantconfig_obj.requestType='PUT'
        merchantconfig_obj.requestJsonData=File.read(File.expand_path(requestJsonPath,__FILE__))
        log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
        gmtdatetime=DateTime.now.httpdate
        expect { Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj) }.to raise_error(StandardError)
    end
    describe GenerateHttpSignature do
        it 'validating invalid requestType Authorization' do
            cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
            merchantconfig_obj=Merchantconfig.new cybsPropertyobj
            merchantconfig_obj.authenticationType='http_signature'
            requestTarget='/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest'
            requestJsonPath='../PutRequestData.json'
            merchantconfig_obj.keysDirectory='../../../AuthenticationSDK/res'
            merchantconfig_obj.keysDirectory=File.expand_path(merchantconfig_obj.keysDirectory,__FILE__)
            merchantconfig_obj.requestTarget=requestTarget
            url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
            merchantconfig_obj.requestUrl=url 
            merchantconfig_obj.requestType=''
            merchantconfig_obj.requestJsonData=File.read(File.expand_path(requestJsonPath,__FILE__))
            log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
            gmtdatetime=DateTime.now.httpdate
            expect { GenerateHttpSignature.new.getToken(merchantconfig_obj, gmtdatetime, log_obj) }.to raise_error(StandardError)
        end
    end
    describe GenerateJwtToken do
        it 'validating invalid requestType Authorization' do
            cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
            merchantconfig_obj=Merchantconfig.new cybsPropertyobj
            merchantconfig_obj.authenticationType='JWT'
            requestTarget='/reporting/v2/reportSubscriptions/TRRReport?organizationId=testrest'
            requestJsonPath='../PutRequestData.json'
            merchantconfig_obj.keysDirectory='../../../AuthenticationSDK/res'
            merchantconfig_obj.keysDirectory=File.expand_path(merchantconfig_obj.keysDirectory,__FILE__)
            merchantconfig_obj.requestTarget=requestTarget
            url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget
            merchantconfig_obj.requestUrl=url 
            merchantconfig_obj.requestType=''
            merchantconfig_obj.requestJsonData=File.read(File.expand_path(requestJsonPath,__FILE__))
            log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
            gmtdatetime=DateTime.now.httpdate
            expect { GenerateJwtToken.new.getToken(merchantconfig_obj, gmtdatetime, log_obj) }.to raise_error(StandardError)
        end
        it 'validating invalid password Authorization' do
            cybsPropertyobj=MerchantConfigData.new.merchantConfigProp         
            merchantconfig_obj=Merchantconfig.new cybsPropertyobj
            merchantconfig_obj.authenticationType='JWT'
            requestTarget='/pts/v2/payments'
            merchantconfig_obj.keysDirectory='../../../AuthenticationSDK/res'
            merchantconfig_obj.keysDirectory=File.expand_path(merchantconfig_obj.keysDirectory,__FILE__)
            merchantconfig_obj.requestTarget=requestTarget
            merchantconfig_obj.keyPass='test'
            getId='5246387105766473203529' #capture-5289697403596987704107
            url= Constants::HTTPS_URI_PREFIX + merchantconfig_obj.requestHost + merchantconfig_obj.requestTarget + '/' + getId
            merchantconfig_obj.requestUrl=url 
            merchantconfig_obj.requestType='GET'
            log_obj = MerchantConfigData.new.setLog merchantconfig_obj.logDirectory, merchantconfig_obj.logFilename, merchantconfig_obj.logSize, merchantconfig_obj.enableLog
            gmtdatetime=DateTime.now.httpdate
            expect { Authorization.new.getToken(merchantconfig_obj, gmtdatetime, log_obj) }.to raise_error(StandardError)
        end
    end
end