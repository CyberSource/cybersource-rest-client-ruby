require 'simplecov'
SimpleCov.start
require 'simplecov-json'

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter,
]

require_relative '../core/Authorization.rb'
require_relative '../core/MerchantConfig.rb'
require_relative '../util/Utility.rb'
