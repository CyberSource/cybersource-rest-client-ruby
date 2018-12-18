require_relative './spec_helper'
require_relative '../util/Utility.rb'

describe Utility do
    it 'validating responsecode for 200' do
        responsecode = 200
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Transcation Successful'
    end
    it 'validating responsecode for 201' do
        responsecode = 200
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Transcation Successful'
    end
    it 'validating responsecode for 400' do
        responsecode = 400
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Bad Request'
    end
    it 'validating responsecode for 401' do
        responsecode = 401
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Authentication Failed'
    end
    it 'validating responsecode for 403' do
        responsecode = 403
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Forbidden'
    end
    it 'validating responsecode for 404' do
        responsecode = 404
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Not Found'
    end
    it 'validating responsecode for 500' do
        responsecode = 500
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Internal Server Error'
    end
    it 'validating responsecode for 502' do
        responsecode = 502
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Bad Gateway'
    end
    it 'validating responsecode for 503' do
        responsecode = 503
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Service Unavailable'
    end
    it 'validating responsecode for 504' do
        responsecode = 504
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq 'Gateway Timeout'
    end
    it 'validating responsecode for invalid' do
        responsecode = 000
        responsemessage = Utility.new.getResponseCodeMessage(responsecode)
        expect(responsemessage).to eq ''
    end
end