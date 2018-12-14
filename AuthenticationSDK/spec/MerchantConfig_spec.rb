require_relative './MerchantConfigData.rb'
require_relative './spec_helper'

describe Merchantconfig do
    it 'Validating enablelog as null MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['enableLog']=''
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.enableLog).to eq true
    end
    it 'Validating logFileName as null MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['logFilename']=''
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.logFilename).to eq 'cybs'
    end
    it 'Validating enableLog as fixnum in MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['enableLog']=123
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.enableLog).to eq '123'
    end
    it 'Validating logDirectory as fixnum in MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['logDirectory']=''
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.logDirectory).to eq '../log'
    end
    it 'Validating RunEnvironment as Prod MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['runEnvironment']='Cybersource.Environment.Production'
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.requestHost).to eq 'api.cybersource.com'
    end
    it 'Validating RunEnvironment as default MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['runEnvironment']='api.cybersource.com'
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.requestHost).to eq 'api.cybersource.com'
    end
    it 'Validating MerchantId as empty in MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['merchantID']=''
        expect { Merchantconfig.new cybsPropertyobj }.to raise_error(StandardError)
    end
    it 'Validating authenticationType as empty in MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['authenticationType']=''
        expect { Merchantconfig.new cybsPropertyobj }.to raise_error(StandardError)
    end
    it 'Validating authenticationType as Fixnum in MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['authenticationType']=123
        expect { Merchantconfig.new cybsPropertyobj }.to raise_error(StandardError)
    end
    # it 'Validating RunEnvironment as empty MerchantConfig File' do
    #     cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
    #     cybsPropertyobj['runEnvironment']=''
    #     expect { Merchantconfig.new cybsPropertyobj }.to raise_error(StandardError)
    # end
    it 'Validating keyAlias as Fixnum MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['keyAlias']=123
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.keyAlias).to eq '123'
    end
    it 'Validating keyPass as Fixnum MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['keyPass']=123
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.keyPass).to eq '123'
    end
    it 'Validating keysDirectory as Fixnum MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['keysDirectory']=123
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.keysDirectory).to eq '123'
    end
    it 'Validating keyFilename as Fixnum MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['keyFilename']=123
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.keyFilename).to eq '123'
    end
    it 'Validating keyAlias as empty MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['keyAlias']=''
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.keyAlias).to eq 'testrest'
    end
    it 'Validating keyAlias not equal to merchantId MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['keyAlias']='test'
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.keyAlias).to eq 'testrest'
    end
    it 'Validating keyPass as empty MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['keyPass']=''
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.keyPass).to eq 'testrest'
    end
    it 'Validating keyFilename as empty MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['keyFilename']=''
        merchantConfigObj=Merchantconfig.new cybsPropertyobj
        expect(merchantConfigObj.keyFilename).to eq 'testrest'
    end
    it 'Validating merchantKeyId as empty MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['merchantKeyId']=''
        cybsPropertyobj['authenticationType']='http_signature'
        expect { Merchantconfig.new cybsPropertyobj }.to raise_error(StandardError)
    end
    it 'Validating merchantSecretKey as empty MerchantConfig File' do
        cybsPropertyobj=MerchantConfigData.new.merchantConfigProp
        cybsPropertyobj['merchantsecretKey']=''
        cybsPropertyobj['authenticationType']='http_signature'
        expect { Merchantconfig.new cybsPropertyobj }.to raise_error(StandardError)
    end
end