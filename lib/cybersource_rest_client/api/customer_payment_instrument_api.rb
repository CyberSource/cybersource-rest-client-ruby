=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'uri'
require 'AuthenticationSDK/util/MLEUtility'
module CyberSource
  class CustomerPaymentInstrumentApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default, config)
      @api_client = api_client
      @api_client.set_configuration(config)
    end
    # Delete a Customer Payment Instrument
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**<br>A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address & card type.<br>A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.<br>A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.<br>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Deleting a Customers Payment Instrument**<br>Your system can use this API to delete an existing Payment Instrument for a Customer.<br>Any Instrument Identifiers representing the card number will also be deleted if they are not associated with any other Payment Instruments.<br>If a customer has more than one Payment Instrument then the default Payment Instrument cannot be deleted without first selecting a [new default Payment Instrument](#token-management_customer-payment-instrument_update-a-customer-payment-instrument_samplerequests-dropdown_make-customer-payment-instrument-the-default_liveconsole-tab-request-body). 
    #
    # @param customer_id The Id of a Customer.
    # @param payment_instrument_id The Id of a payment instrument.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [nil]
    #
    def delete_customer_payment_instrument(customer_id, payment_instrument_id, opts = {})
      data, status_code, headers = delete_customer_payment_instrument_with_http_info(customer_id, payment_instrument_id, opts)
      return data, status_code, headers
    end

    # Delete a Customer Payment Instrument
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**&lt;br&gt;A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address &amp; card type.&lt;br&gt;A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.&lt;br&gt;A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.&lt;br&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;|**Deleting a Customers Payment Instrument**&lt;br&gt;Your system can use this API to delete an existing Payment Instrument for a Customer.&lt;br&gt;Any Instrument Identifiers representing the card number will also be deleted if they are not associated with any other Payment Instruments.&lt;br&gt;If a customer has more than one Payment Instrument then the default Payment Instrument cannot be deleted without first selecting a [new default Payment Instrument](#token-management_customer-payment-instrument_update-a-customer-payment-instrument_samplerequests-dropdown_make-customer-payment-instrument-the-default_liveconsole-tab-request-body). 
    # @param customer_id The Id of a Customer.
    # @param payment_instrument_id The Id of a payment instrument.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_customer_payment_instrument_with_http_info(customer_id, payment_instrument_id, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: CustomerPaymentInstrumentApi.delete_customer_payment_instrument ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'customer_id' is set
      if @api_client.config.client_side_validation && customer_id.nil?
        fail ArgumentError, "Missing the required parameter 'customer_id' when calling CustomerPaymentInstrumentApi.delete_customer_payment_instrument"
      end
      # verify the required parameter 'payment_instrument_id' is set
      if @api_client.config.client_side_validation && payment_instrument_id.nil?
        fail ArgumentError, "Missing the required parameter 'payment_instrument_id' when calling CustomerPaymentInstrumentApi.delete_customer_payment_instrument"
      end
      # resource path
      local_var_path = 'tms/v2/customers/{customerId}/payment-instruments/{paymentInstrumentId}'.sub('{' + 'customerId' + '}', customer_id.to_s).sub('{' + 'paymentInstrumentId' + '}', payment_instrument_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])
      header_params[:'profile-id'] = opts[:'profile_id'] if !opts[:'profile_id'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      if 'DELETE' == 'POST'
        post_body = '{}'
      else
        post_body = nil
      end
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["delete_customer_payment_instrument","delete_customer_payment_instrument_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: CustomerPaymentInstrumentApi#delete_customer_payment_instrument\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Retrieve a Customer Payment Instrument
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**<br>A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address & card type.<br>A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.<br>A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.<br>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Retrieving a Customer Payment Instrument**<br>Your system can use this API to retrieve an existing Payment Instrument for a Customer.<br>To perform a payment with a particular Payment Instrument simply specify the [Payment Instrument Id in the payments request](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-using-tokens_authorization-with-customer-payment-instrument-and-shipping-address-token-id_liveconsole-tab-request-body). 
    #
    # @param customer_id The Id of a Customer.
    # @param payment_instrument_id The Id of a payment instrument.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [PostCustomerPaymentInstrumentRequest]
    #
    def get_customer_payment_instrument(customer_id, payment_instrument_id, opts = {})
      data, status_code, headers = get_customer_payment_instrument_with_http_info(customer_id, payment_instrument_id, opts)
      return data, status_code, headers
    end

    # Retrieve a Customer Payment Instrument
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**&lt;br&gt;A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address &amp; card type.&lt;br&gt;A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.&lt;br&gt;A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.&lt;br&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;|**Retrieving a Customer Payment Instrument**&lt;br&gt;Your system can use this API to retrieve an existing Payment Instrument for a Customer.&lt;br&gt;To perform a payment with a particular Payment Instrument simply specify the [Payment Instrument Id in the payments request](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-using-tokens_authorization-with-customer-payment-instrument-and-shipping-address-token-id_liveconsole-tab-request-body). 
    # @param customer_id The Id of a Customer.
    # @param payment_instrument_id The Id of a payment instrument.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [Array<(PostCustomerPaymentInstrumentRequest, Fixnum, Hash)>] PostCustomerPaymentInstrumentRequest data, response status code and response headers
    def get_customer_payment_instrument_with_http_info(customer_id, payment_instrument_id, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: CustomerPaymentInstrumentApi.get_customer_payment_instrument ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'customer_id' is set
      if @api_client.config.client_side_validation && customer_id.nil?
        fail ArgumentError, "Missing the required parameter 'customer_id' when calling CustomerPaymentInstrumentApi.get_customer_payment_instrument"
      end
      # verify the required parameter 'payment_instrument_id' is set
      if @api_client.config.client_side_validation && payment_instrument_id.nil?
        fail ArgumentError, "Missing the required parameter 'payment_instrument_id' when calling CustomerPaymentInstrumentApi.get_customer_payment_instrument"
      end
      # resource path
      local_var_path = 'tms/v2/customers/{customerId}/payment-instruments/{paymentInstrumentId}'.sub('{' + 'customerId' + '}', customer_id.to_s).sub('{' + 'paymentInstrumentId' + '}', payment_instrument_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])
      header_params[:'profile-id'] = opts[:'profile_id'] if !opts[:'profile_id'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      if 'GET' == 'POST'
        post_body = '{}'
      else
        post_body = nil
      end
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["get_customer_payment_instrument","get_customer_payment_instrument_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PostCustomerPaymentInstrumentRequest')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: CustomerPaymentInstrumentApi#get_customer_payment_instrument\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # List Payment Instruments for a Customer
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**<br>A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address & card type.<br>A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.<br>A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.<br>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Retrieving all Customer Payment Instruments**<br>Your system can use this API to retrieve all existing Payment Instruments for a Customer. 
    #
    # @param customer_id The Id of a Customer.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @option opts [Integer] :offset Starting record in zero-based dataset that should be returned as the first object in the array. Default is 0. (default to 0)
    # @option opts [Integer] :limit The maximum number that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100. (default to 20)
    # @return [PaymentInstrumentList]
    #
    def get_customer_payment_instruments_list(customer_id, opts = {})
      data, status_code, headers = get_customer_payment_instruments_list_with_http_info(customer_id, opts)
      return data, status_code, headers
    end

    # List Payment Instruments for a Customer
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**&lt;br&gt;A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address &amp; card type.&lt;br&gt;A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.&lt;br&gt;A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.&lt;br&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;|**Retrieving all Customer Payment Instruments**&lt;br&gt;Your system can use this API to retrieve all existing Payment Instruments for a Customer. 
    # @param customer_id The Id of a Customer.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @option opts [Integer] :offset Starting record in zero-based dataset that should be returned as the first object in the array. Default is 0.
    # @option opts [Integer] :limit The maximum number that can be returned in the array starting from the offset record in zero-based dataset. Default is 20, maximum is 100.
    # @return [Array<(PaymentInstrumentList, Fixnum, Hash)>] PaymentInstrumentList data, response status code and response headers
    def get_customer_payment_instruments_list_with_http_info(customer_id, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: CustomerPaymentInstrumentApi.get_customer_payment_instruments_list ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'customer_id' is set
      if @api_client.config.client_side_validation && customer_id.nil?
        fail ArgumentError, "Missing the required parameter 'customer_id' when calling CustomerPaymentInstrumentApi.get_customer_payment_instruments_list"
      end
      # resource path
      local_var_path = 'tms/v2/customers/{customerId}/payment-instruments'.sub('{' + 'customerId' + '}', customer_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])
      header_params[:'profile-id'] = opts[:'profile_id'] if !opts[:'profile_id'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      if 'GET' == 'POST'
        post_body = '{}'
      else
        post_body = nil
      end
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["get_customer_payment_instruments_list","get_customer_payment_instruments_list_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PaymentInstrumentList')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: CustomerPaymentInstrumentApi#get_customer_payment_instruments_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Update a Customer Payment Instrument
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**<br>A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address & card type.<br>A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.<br>A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.<br>|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Updating a Customers Payment Instrument**<br>Your system can use this API to update an existing Payment Instrument for a Customer, including selecting a [default Payment Instrument](#token-management_customer-payment-instrument_update-a-customer-payment-instrument_samplerequests-dropdown_make-customer-payment-instrument-the-default_liveconsole-tab-request-body) for use in payments. 
    #
    # @param customer_id The Id of a Customer.
    # @param payment_instrument_id The Id of a payment instrument.
    # @param patch_customer_payment_instrument_request 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @option opts [String] :if_match Contains an ETag value from a GET request to make the request conditional.
    # @return [PatchCustomerPaymentInstrumentRequest]
    #
    def patch_customers_payment_instrument(customer_id, payment_instrument_id, patch_customer_payment_instrument_request, opts = {})
      data, status_code, headers = patch_customers_payment_instrument_with_http_info(customer_id, payment_instrument_id, patch_customer_payment_instrument_request, opts)
      return data, status_code, headers
    end

    # Update a Customer Payment Instrument
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**&lt;br&gt;A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address &amp; card type.&lt;br&gt;A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.&lt;br&gt;A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.&lt;br&gt;|&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;|**Updating a Customers Payment Instrument**&lt;br&gt;Your system can use this API to update an existing Payment Instrument for a Customer, including selecting a [default Payment Instrument](#token-management_customer-payment-instrument_update-a-customer-payment-instrument_samplerequests-dropdown_make-customer-payment-instrument-the-default_liveconsole-tab-request-body) for use in payments. 
    # @param customer_id The Id of a Customer.
    # @param payment_instrument_id The Id of a payment instrument.
    # @param patch_customer_payment_instrument_request 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @option opts [String] :if_match Contains an ETag value from a GET request to make the request conditional.
    # @return [Array<(PatchCustomerPaymentInstrumentRequest, Fixnum, Hash)>] PatchCustomerPaymentInstrumentRequest data, response status code and response headers
    def patch_customers_payment_instrument_with_http_info(customer_id, payment_instrument_id, patch_customer_payment_instrument_request, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: CustomerPaymentInstrumentApi.patch_customers_payment_instrument ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'customer_id' is set
      if @api_client.config.client_side_validation && customer_id.nil?
        fail ArgumentError, "Missing the required parameter 'customer_id' when calling CustomerPaymentInstrumentApi.patch_customers_payment_instrument"
      end
      # verify the required parameter 'payment_instrument_id' is set
      if @api_client.config.client_side_validation && payment_instrument_id.nil?
        fail ArgumentError, "Missing the required parameter 'payment_instrument_id' when calling CustomerPaymentInstrumentApi.patch_customers_payment_instrument"
      end
      # verify the required parameter 'patch_customer_payment_instrument_request' is set
      if @api_client.config.client_side_validation && patch_customer_payment_instrument_request.nil?
        fail ArgumentError, "Missing the required parameter 'patch_customer_payment_instrument_request' when calling CustomerPaymentInstrumentApi.patch_customers_payment_instrument"
      end
      # resource path
      local_var_path = 'tms/v2/customers/{customerId}/payment-instruments/{paymentInstrumentId}'.sub('{' + 'customerId' + '}', customer_id.to_s).sub('{' + 'paymentInstrumentId' + '}', payment_instrument_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])
      header_params[:'profile-id'] = opts[:'profile_id'] if !opts[:'profile_id'].nil?
      header_params[:'if-match'] = opts[:'if_match'] if !opts[:'if_match'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(patch_customer_payment_instrument_request)
      sdk_tracker = SdkTracker.new
      post_body = sdk_tracker.insert_developer_id_tracker(post_body, 'PatchCustomerPaymentInstrumentRequest', @api_client.config.host, @api_client.merchantconfig.defaultDeveloperId)
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["patch_customers_payment_instrument","patch_customers_payment_instrument_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PatchCustomerPaymentInstrumentRequest')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: CustomerPaymentInstrumentApi#patch_customers_payment_instrument\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Create a Customer Payment Instrument
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**<br>A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address & card type.<br>A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.<br>A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.<br><br>**Creating a Customer Payment Instrument**<br>It is recommended you [create a Customer Payment Instrument via a Payment Authorization](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-with-token-create_authorization-create-default-payment-instrument-shipping-address-for-existing-customer_liveconsole-tab-request-body), this can be for a zero amount.<br>In Europe: You should perform Payer Authentication alongside the Authorization.|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|**Payment Network Tokens**<br>Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires.<br>A Payment Network Token will be automatically created and used in future payments if you are enabled for the service.<br>A Payment Network Token can also be [provisioned for an existing Instrument Identifier](#token-management_instrument-identifier_enroll-an-instrument-identifier-for-payment-network-token).<br>For more information about Payment Network Tokens see the Developer Guide.<br><br>**Payments with Customers Payment Instrument**<br>To perform a payment with a particular Payment Instrument or Shipping Address specify the [Payment Instrument in the payment request](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-using-tokens_authorization-with-customer-payment-instrument-and-shipping-address-token-id_liveconsole-tab-request-body). 
    #
    # @param customer_id The Id of a Customer.
    # @param post_customer_payment_instrument_request 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [PostCustomerPaymentInstrumentRequest]
    #
    def post_customer_payment_instrument(customer_id, post_customer_payment_instrument_request, opts = {})
      data, status_code, headers = post_customer_payment_instrument_with_http_info(customer_id, post_customer_payment_instrument_request, opts)
      return data, status_code, headers
    end

    # Create a Customer Payment Instrument
    # |  |  |  | | --- | --- | --- | |**Customer Payment Instrument**&lt;br&gt;A Customer Payment Instrument represents tokenized customer payment information such as expiration date, billing address &amp; card type.&lt;br&gt;A [Customer](#token-management_customer_create-a-customer) can have [one or more Payment Instruments](#token-management_customer-payment-instrument_retrieve-a-customer-payment-instrument), with one allocated as the Customers default for use in payments.&lt;br&gt;A Payment Instrument token does not store the card number. A Payment Instrument is associated with an [Instrument Identifier](#token-management_instrument-identifier_create-an-instrument-identifier) that represents either a payment card number, or in the case of an ACH bank account, the routing and account number.&lt;br&gt;&lt;br&gt;**Creating a Customer Payment Instrument**&lt;br&gt;It is recommended you [create a Customer Payment Instrument via a Payment Authorization](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-with-token-create_authorization-create-default-payment-instrument-shipping-address-for-existing-customer_liveconsole-tab-request-body), this can be for a zero amount.&lt;br&gt;In Europe: You should perform Payer Authentication alongside the Authorization.|&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;|**Payment Network Tokens**&lt;br&gt;Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires.&lt;br&gt;A Payment Network Token will be automatically created and used in future payments if you are enabled for the service.&lt;br&gt;A Payment Network Token can also be [provisioned for an existing Instrument Identifier](#token-management_instrument-identifier_enroll-an-instrument-identifier-for-payment-network-token).&lt;br&gt;For more information about Payment Network Tokens see the Developer Guide.&lt;br&gt;&lt;br&gt;**Payments with Customers Payment Instrument**&lt;br&gt;To perform a payment with a particular Payment Instrument or Shipping Address specify the [Payment Instrument in the payment request](#payments_payments_process-a-payment_samplerequests-dropdown_authorization-using-tokens_authorization-with-customer-payment-instrument-and-shipping-address-token-id_liveconsole-tab-request-body). 
    # @param customer_id The Id of a Customer.
    # @param post_customer_payment_instrument_request 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [Array<(PostCustomerPaymentInstrumentRequest, Fixnum, Hash)>] PostCustomerPaymentInstrumentRequest data, response status code and response headers
    def post_customer_payment_instrument_with_http_info(customer_id, post_customer_payment_instrument_request, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: CustomerPaymentInstrumentApi.post_customer_payment_instrument ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'customer_id' is set
      if @api_client.config.client_side_validation && customer_id.nil?
        fail ArgumentError, "Missing the required parameter 'customer_id' when calling CustomerPaymentInstrumentApi.post_customer_payment_instrument"
      end
      # verify the required parameter 'post_customer_payment_instrument_request' is set
      if @api_client.config.client_side_validation && post_customer_payment_instrument_request.nil?
        fail ArgumentError, "Missing the required parameter 'post_customer_payment_instrument_request' when calling CustomerPaymentInstrumentApi.post_customer_payment_instrument"
      end
      # resource path
      local_var_path = 'tms/v2/customers/{customerId}/payment-instruments'.sub('{' + 'customerId' + '}', customer_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])
      header_params[:'profile-id'] = opts[:'profile_id'] if !opts[:'profile_id'].nil?

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(post_customer_payment_instrument_request)
      sdk_tracker = SdkTracker.new
      post_body = sdk_tracker.insert_developer_id_tracker(post_body, 'PostCustomerPaymentInstrumentRequest', @api_client.config.host, @api_client.merchantconfig.defaultDeveloperId)
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["post_customer_payment_instrument","post_customer_payment_instrument_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PostCustomerPaymentInstrumentRequest')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: CustomerPaymentInstrumentApi#post_customer_payment_instrument\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
  end
end
