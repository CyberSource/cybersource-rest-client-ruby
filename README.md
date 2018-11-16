# Ruby Client SDK for the CyberSource REST APIs

The CyberSource Ruby client provides convenient access to the [CyberSource REST API](https://developer.cybersource.com/api/reference/api-reference.html) from your Ruby application.

[![Version         ][rubygems_badge]][rubygems]

[rubygems_badge]: https://badge.fury.io/rb/cybersource_rest_client.svg
[rubygems]: https://rubygems.org/gems/cybersource_rest_client

## Requirements
* Ruby 2.2.2 or higher
* [CyberSource Account](https://developer.cybersource.com/api/developer-guides/dita-gettingstarted/registration.html)
* [CyberSource API Keys](https://prod.developer.cybersource.com/api/developer-guides/dita-gettingstarted/registration/createCertSharedKey.html)
 
## Dependencies
* concurrent-ruby 1.1.3
* i18n 1.1.1
* minitest 5.11.3
* thread_safe 0.3.6
* tzinfo 1.2.5
* activesupport 5.2.1
* interface 1.0.4
* json 2.1.0
* jwt 2.1.0
* ffi 1.9.25
* ethon 0.11.0
* typhoeus 1.3.1

## Installation
### Bundler
Be sure to always use HTTPS rubygems source in your gemfile and include the cybersource_rest_client.

```
source 'https://rubygems.org' do
  gem 'cybersource_rest_client'
end

```

## Registration & Configuration
Use of this SDK and the CyberSource APIs requires having an account on our system. You can find details of getting a test account and creating your keys [here](https://developer.cybersource.com/api/developer-guides/dita-gettingstarted/registration.html)

Once you have your keys, simply load them into the appropriate variables in your code, as per the below sample code dealing with the authentication part of the API request. 

Remember this SDK is for use in server-side Ruby applications that access the CyberSource REST API and credentials should always be securely stored and accessed appropriately. 

## SDK Usage Examples and Sample Code
To get started using this SDK, it's highly recommended to download our sample code repository:
* [Cybersource Ruby Sample Code Repository (on GitHub)](https://github.com/CyberSource/cybersource-rest-samples-ruby)

In that respository, we have comprehensive sample code for all common uses of our API:

Additionally, you can find details and examples of how our API is structured in our API Reference Guide:
* [Developer Center API Reference](https://developer.cybersource.com/api/reference/api-reference.html)

The API Reference Guide provides examples of what information is needed for a particular request and how that information would be formatted. Using those examples, you can easily determine what methods would be necessary to include that information in a request using this SDK.

### Switching between the sandbox environment and the production environment
Cybersource maintains a complete sandbox environment for testing and development purposes. This sandbox environment is an exact duplicate of our production environment with the transaction authorization and settlement process simulated. By default, this SDK is configured to communicate with the sandbox environment. To switch to the production environment, set the `runEnvironment` property in the SDK Configuration.  See our sample at https://github.com/CyberSource/cybersource-rest-samples-ruby/blob/master/data/Configuration.rb

```Ruby
# For TESTING use
runEnvironment='cybersource.environment.sandbox'
# For PRODUCTION use
# runEnvironment='cybersource.environment.production'
```

API credentials are different for each environment, so be sure to switch to the appropriate credentials when switching environments.



## License
This repository is distributed under a proprietary license. See the provided [`LICENSE.txt`](/LICENSE.txt) file.
