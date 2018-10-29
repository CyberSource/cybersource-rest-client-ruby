Gem::Specification.new do |s|
  s.name = "AuthenticationSDK"
  s.version = "0.0.1"
  s.platform = Gem::Platform::RUBY
  s.date = "2018-07-17"
  s.summary = "Cybersource Payments REST API Ruby Gem"
  s.description = "Move your business forward with the Cybersource Payments REST API"
  s.authors = ["cybersource"]
  s.email = ""
  s.files = Dir.glob("{lib}/**/*")
  
  s.required_ruby_version     = '>= 2.2.2'
  s.required_rubygems_version = '>= 1.3.6'

  s.add_runtime_dependency 'activesupport', '~> 5.2', '>= 5.2.0'
  s.add_runtime_dependency 'json', '~> 2.1.0', '>= 1.8.1'
  s.add_runtime_dependency 'interface','~> 1.0', '>= 1.0.4'
  s.add_runtime_dependency 'jwt', '~> 2.1.0'
  
  s.add_development_dependency 'rspec', '~> 2.1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'rubocop', '~> 0.57.2'
end
