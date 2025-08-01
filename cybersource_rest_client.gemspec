# -*- encoding: utf-8 -*-

=begin
#CyberSource Flex API

#Simple PAN tokenization service

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

$:.push File.expand_path("../lib", __FILE__)
require "cybersource_rest_client/version"

Gem::Specification.new do |s|
  s.name        = "cybersource_rest_client"
  s.version     = "0.0.75"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["CyberSource"]
  s.email       = ["cybersourcedev@gmail.com"]
  s.homepage    = "https://developer.cybersource.com"
  s.summary     = "CyberSource Ruby SDK Gem"
  s.description = "Simple REST API for the CyberSource Global Payments Platform"
  s.license     = "CyberSource"
  s.files       = Dir.glob("{lib}/{cybersource_rest_client}/**/*") + Dir.glob("{lib}/{AuthenticationSDK}/authentication/**/*") + Dir.glob("{lib}/{AuthenticationSDK}/core/**/*") + Dir.glob("{lib}/{AuthenticationSDK}/util/**/*") + Dir.glob("{lib}/{AuthenticationSDK}/logging/**/*") + Dir.glob("{lib}/cybersource_rest_client.rb")
  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency 'typhoeus', '~> 1.4', '>= 1.4.0'
  s.add_runtime_dependency 'json', '~> 2.7', '>= 2.7.0'
  s.add_runtime_dependency 'activesupport', '>= 6.0.3.2', '< 8.0'
  s.add_runtime_dependency 'interface','~> 1.0', '>= 1.0.5'
  s.add_runtime_dependency 'jwt', '2.7.0'
  s.add_runtime_dependency 'addressable', '~> 2.8', '>= 2.8.0'
  s.add_runtime_dependency 'time', '~> 0.2.2'
  s.add_runtime_dependency 'jose', '~> 1.1'

  s.add_development_dependency 'rubocop', '~> 0.57.2'
  s.add_development_dependency 'rspec', '~> 3.12', '>= 3.12.0'
  s.add_development_dependency 'vcr', '~> 5.0', '>= 5.0.0'
  s.add_development_dependency 'autotest', '~> 4.4', '>= 4.4.6'
  s.add_development_dependency 'autotest-rails-pure', '~> 4.1', '>= 4.1.2'
  s.add_development_dependency 'autotest-growl', '~> 0.2', '>= 0.2.16'
  s.add_development_dependency 'autotest-fsevent', '~> 0.2', '>= 0.2.12'

  s.require_paths = ["lib"]
end
