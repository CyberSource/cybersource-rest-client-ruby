=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'spec_helper'
require 'json'
require 'date'

# Unit tests for CyberSource::PaymentProductsCurrencyConversionConfigurationInformationConfigurationsProcessors
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'PaymentProductsCurrencyConversionConfigurationInformationConfigurationsProcessors' do
  before do
    # run before each test
    @instance = CyberSource::PaymentProductsCurrencyConversionConfigurationInformationConfigurationsProcessors.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of PaymentProductsCurrencyConversionConfigurationInformationConfigurationsProcessors' do
    it 'should create an instance of PaymentProductsCurrencyConversionConfigurationInformationConfigurationsProcessors' do
      expect(@instance).to be_instance_of(CyberSource::PaymentProductsCurrencyConversionConfigurationInformationConfigurationsProcessors)
    end
  end
  describe 'test attribute "merchant_id"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "acquirer_id"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end