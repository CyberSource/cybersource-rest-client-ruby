=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'spec_helper'
require 'json'

# Unit tests for CyberSource::PayoutsApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'PayoutsApi' do
  before do
    # run before each test
    @instance = CyberSource::PayoutsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of PayoutsApi' do
    it 'should create an instance of PayoutsApi' do
      expect(@instance).to be_instance_of(CyberSource::PayoutsApi)
    end
  end

  # unit tests for oct_create_payment
  # Process a Payout
  # Send funds from a selected funding source to a designated credit/debit card account or a prepaid card using an Original Credit Transaction (OCT). The availability of API features for a merchant can depend on the portfolio configuration and may need to be enabled at the portfolio level before they can be added to merchant accounts. 
  # @param oct_create_payment_request 
  # @param [Hash] opts the optional parameters
  # @return [PtsV2PayoutsPost201Response]
  describe 'oct_create_payment test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
