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

# Unit tests for CyberSource::Kmsv2keyssymverifiKeyInformation
# Automatically generated by swagger-codegen (github.com/swagger-api/swagger-codegen)
# Please update as you see appropriate
describe 'Kmsv2keyssymverifiKeyInformation' do
  before do
    # run before each test
    @instance = CyberSource::Kmsv2keyssymverifiKeyInformation.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of Kmsv2keyssymverifiKeyInformation' do
    it 'should create an instance of Kmsv2keyssymverifiKeyInformation' do
      expect(@instance).to be_instance_of(CyberSource::Kmsv2keyssymverifiKeyInformation)
    end
  end
  describe 'test attribute "organization_id"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "reference_number"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  describe 'test attribute "digest_algorithm"' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
      # validator = Petstore::EnumTest::EnumAttributeValidator.new('String', ["HMACSHA1", "HMACSHA2"])
      # validator.allowable_values.each do |value|
      #   expect { @instance.digest_algorithm = value }.not_to raise_error
      # end
    end
  end

end