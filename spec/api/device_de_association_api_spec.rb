=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'spec_helper'
require 'json'

# Unit tests for CyberSource::DeviceDeAssociationApi
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'DeviceDeAssociationApi' do
  before do
    # run before each test
    @instance = CyberSource::DeviceDeAssociationApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of DeviceDeAssociationApi' do
    it 'should create an instance of DeviceDeAssociationApi' do
      expect(@instance).to be_instance_of(CyberSource::DeviceDeAssociationApi)
    end
  end

  # unit tests for delete_terminal_association
  # De-associate a device from merchant or account V2
  # The current association of the device will be removed and will be assigned back to parent in the hierarchy based on internal logic
  # @param de_association_request_body de association of the deviceId in the request body.
  # @param [Hash] opts the optional parameters
  # @return [nil]
  describe 'delete_terminal_association test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for post_de_associate_v3_terminal
  # De-associate a device from merchant to account or reseller and from account to reseller
  # A device will be de-associated from its current organization and moved up in the hierarchy. The device&#39;s new position will be determined by a specified destination, either an account or a portfolio. If no destination is provided, the device will default to the currently logged-in user. 
  # @param device_de_associate_v3_request deviceId that has to be de-associated to the destination organizationId.
  # @param [Hash] opts the optional parameters
  # @return [Array<InlineResponse2006>]
  describe 'post_de_associate_v3_terminal test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
