
# Ruby Client SDK for the CyberSource REST APIs

## Description

The CyberSource Ruby client provides convenient access to the [CyberSource REST API](https://developer.cybersource.com/api/reference/api-reference.html) from your Ruby application.

[![Version         ][rubygems_badge]][rubygems]

[rubygems_badge]: https://badge.fury.io/rb/cybersource_rest_client.svg
[rubygems]: https://rubygems.org/gems/cybersource_rest_client

## System Requirements

* Ruby 2.5.0 or higher

## Installation

### Bundler

Be sure to always use HTTPS rubygems source in your gemfile and include the cybersource_rest_client.

```ruby
	source 'https://rubygems.org' do
	  gem 'cybersource_rest_client'
	end
```

## Account Registration and Configuration

* Account Registration

Follow the first step mentioned in [Getting Started with CyberSource REST SDKs](https://developer.cybersource.com/hello-world/rest-api-sdks.html#gettingstarted) to create a sandbox account.

* Configuration

Follow the second step mentioned in [Getting Started with CyberSource REST SDKs](https://developer.cybersource.com/hello-world/rest-api-sdks.html#gettingstarted) to configure the SDK by inputting your credentials.

***Please note that this is for reference only. Ensure to store the credentials in a more secure manner.***

## How to Use

To get started using this SDK, it's highly recommended to download our sample code repository:

* [Cybersource Ruby Sample Code Repository (on GitHub)](https://github.com/CyberSource/cybersource-rest-samples-ruby)

In that respository, we have comprehensive sample code for all common uses of our API:

Additionally, you can find details and examples of how our API is structured in our API Reference Guide:

* [Developer Center API Reference](https://developer.cybersource.com/api/reference/api-reference.html)

The API Reference Guide provides examples of what information is needed for a particular request and how that information would be formatted. Using those examples, you can easily determine what methods would be necessary to include that information in a request using this SDK.

### SDK Usage Examples and Sample Code

* Install the CyberSource Ruby SDK and add the SDK to your GemFile.
* Configure your credentials in [MerchantConfiguration](https://github.com/CyberSource/cybersource-rest-samples-ruby/blob/21be3e94c9144ce217ae20ef476425d384aadc31/data/Configuration.rb#L5C3-L67C6).
* Create an instance of [ApiClient](https://github.com/CyberSource/cybersource-rest-samples-ruby/blob/21be3e94c9144ce217ae20ef476425d384aadc31/Samples/Payments/Payments/simple-authorizationinternet.rb#L46C9-L46C48).
* Use the created ApiClient instance and MerchantConfiguration to call CyberSource APIs. For example [SimpleAuthorizationInternet](https://github.com/CyberSource/cybersource-rest-samples-ruby/blob/21be3e94c9144ce217ae20ef476425d384aadc31/Samples/Payments/Payments/simple-authorizationinternet.rb#L46C9-L46C48)

For more detailed examples, refer to the [cybersource-rest-samples-ruby](https://github.com/CyberSource/cybersource-rest-samples-ruby) repository.

### Switching between the sandbox environment and the production environment

CyberSource maintains a complete sandbox environment for testing and development purposes. This sandbox environment is an exact duplicate of our production environment with the transaction authorization and settlement process simulated. By default, this SDK is configured to communicate with the sandbox environment. To switch to the production environment, set the `runEnvironment` property in the SDK Configuration.  See our sample at <https://github.com/CyberSource/cybersource-rest-samples-ruby/blob/master/data/Configuration.rb>

```Ruby
   # For TESTING use
     runEnvironment='apitest.cybersource.com'
   # For PRODUCTION use
   # runEnvironment='api.cybersource.com'
```

API credentials are different for each environment, so be sure to switch to the appropriate credentials when switching environments.

## Features

### MetaKey Support

A Meta Key is a single key that can be used by one, some, or all merchants (or accounts, if created by a Portfolio user) in the portfolio.

The Portfolio or Parent Account owns the key and is considered the transaction submitter when a Meta Key is used, while the merchant owns the transaction.

MIDs continue to be able to create keys for themselves, even if a Meta Key is generated.

Further information on MetaKey can be found in [New Business Center User Guide](https://developer.cybersource.com/library/documentation/dev_guides/Business_Center/New_Business_Center_User_Guide.pdf).


## How to Contribute

* Fork the repo and create your branch from `master`.
* If you've added code that should be tested, add tests.
* Ensure the test suite passes.
* Submit your pull request! (Ensure you have [synced your fork](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork) with the original repository before initiating the PR).

## Need Help?

For any help, you can reach out to us at our [Discussion Forum](https://community.developer.cybersource.com/t5/cybersource-APIs/bd-p/api).

## Disclaimer

CyberSource may allow Customer to access, use, and/or test a CyberSource product or service that may still be in development or has not been market-tested (“Beta Product”) solely for the purpose of evaluating the functionality or marketability of the Beta Product (a “Beta Evaluation”). Notwithstanding any language to the contrary, the following terms shall apply with respect to Customer’s participation in any Beta Evaluation (and the Beta Product(s)) accessed thereunder): The Parties will enter into a separate form agreement detailing the scope of the Beta Evaluation, requirements, pricing, the length of the beta evaluation period (“Beta Product Form”). Beta Products are not, and may not become, Transaction Services and have not yet been publicly released and are offered for the sole purpose of internal testing and non-commercial evaluation. Customer’s use of the Beta Product shall be solely for the purpose of conducting the Beta Evaluation. Customer accepts all risks arising out of the access and use of the Beta Products. CyberSource may, in its sole discretion, at any time, terminate or discontinue the Beta Evaluation. Customer acknowledges and agrees that any Beta Product may still be in development and that Beta Product is provided “AS IS” and may not perform at the level of a commercially available service, may not operate as expected and may be modified prior to release. CYBERSOURCE SHALL NOT BE RESPONSIBLE OR LIABLE UNDER ANY CONTRACT, TORT (INCLUDING NEGLIGENCE), OR OTHERWISE RELATING TO A BETA PRODUCT OR THE BETA EVALUATION (A) FOR LOSS OR INACCURACY OF DATA OR COST OF PROCUREMENT OF SUBSTITUTE GOODS, SERVICES OR TECHNOLOGY, (B) ANY CLAIM, LOSSES, DAMAGES, OR CAUSE OF ACTION ARISING IN CONNECTION WITH THE BETA PRODUCT; OR (C) FOR ANY INDIRECT, INCIDENTAL OR CONSEQUENTIAL DAMAGES INCLUDING, BUT NOT LIMITED TO, LOSS OF REVENUES AND LOSS OF PROFITS.

## License

This repository is distributed under a proprietary license. See the provided [`LICENSE.txt`](/license.txt) file.
