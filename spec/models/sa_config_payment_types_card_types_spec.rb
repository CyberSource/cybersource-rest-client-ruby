=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for CyberSource::SAConfigPaymentTypesCardTypes
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'SAConfigPaymentTypesCardTypes' do
  before do
    # run before each test
    @instance = CyberSource::SAConfigPaymentTypesCardTypes.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SAConfigPaymentTypesCardTypes' do
    it 'should create an instance of SAConfigPaymentTypesCardTypes' do
      expect(@instance).to be_instance_of(CyberSource::SAConfigPaymentTypesCardTypes)
    end
  end
  describe 'test attribute "discover"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "amex"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "master_card"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "visa"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
