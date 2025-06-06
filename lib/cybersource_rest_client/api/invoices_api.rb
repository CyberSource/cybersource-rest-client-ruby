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
  class InvoicesApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default, config)
      @api_client = api_client
      @api_client.set_configuration(config)
    end
    # Create a New Invoice
    # The invoicing product enables you to bill any customer with an email address and accept digital payments securely from any connected device. You can either use the system generated email or use the invoice payment link in your own communication. You can add discounts and taxes for the entire invoice or for each line item. To customize the invoice to match your brand see [Invoice Settings](https://developer.cybersource.com/api-reference-assets/index.html#invoicing_invoice-settings_update-invoice-settings). The invoice payment page uses Unified Checkout to process the payments. The availability of API features for a merchant can depend on the portfolio configuration and may need to be enabled at the portfolio level before they can be added to merchant accounts.
    #
    # @param create_invoice_request 
    # @param [Hash] opts the optional parameters
    # @return [InvoicingV2InvoicesPost201Response]
    #
    def create_invoice(create_invoice_request, opts = {})
      data, status_code, headers = create_invoice_with_http_info(create_invoice_request, opts)
      return data, status_code, headers
    end

    # Create a New Invoice
    # The invoicing product enables you to bill any customer with an email address and accept digital payments securely from any connected device. You can either use the system generated email or use the invoice payment link in your own communication. You can add discounts and taxes for the entire invoice or for each line item. To customize the invoice to match your brand see [Invoice Settings](https://developer.cybersource.com/api-reference-assets/index.html#invoicing_invoice-settings_update-invoice-settings). The invoice payment page uses Unified Checkout to process the payments. The availability of API features for a merchant can depend on the portfolio configuration and may need to be enabled at the portfolio level before they can be added to merchant accounts.
    # @param create_invoice_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InvoicingV2InvoicesPost201Response, Fixnum, Hash)>] InvoicingV2InvoicesPost201Response data, response status code and response headers
    def create_invoice_with_http_info(create_invoice_request, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: InvoicesApi.create_invoice ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'create_invoice_request' is set
      if @api_client.config.client_side_validation && create_invoice_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_invoice_request' when calling InvoicesApi.create_invoice"
      end
      # resource path
      local_var_path = 'invoicing/v2/invoices'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/hal+json', 'application/json;charset=utf-8', 'application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(create_invoice_request)
      sdk_tracker = SdkTracker.new
      post_body = sdk_tracker.insert_developer_id_tracker(post_body, 'CreateInvoiceRequest', @api_client.config.host, @api_client.merchantconfig.defaultDeveloperId)
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["create_invoice","create_invoice_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InvoicingV2InvoicesPost201Response')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: InvoicesApi#create_invoice\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Get a List of Invoices
    # Provides a (filtered) list of invoices that have been created in your account. You can filter the list based on Invoice Status by setting the status query parameter to one of DRAFT, CREATED, SENT, PARTIAL, PAID or CANCELED.
    #
    # @param offset Page offset number.
    # @param limit Maximum number of items you would like returned.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :status The status of the invoice.  Possible values:   - DRAFT   - CREATED   - SENT   - PARTIAL   - PAID   - CANCELED 
    # @return [InvoicingV2InvoicesAllGet200Response]
    #
    def get_all_invoices(offset, limit, opts = {})
      data, status_code, headers = get_all_invoices_with_http_info(offset, limit, opts)
      return data, status_code, headers
    end

    # Get a List of Invoices
    # Provides a (filtered) list of invoices that have been created in your account. You can filter the list based on Invoice Status by setting the status query parameter to one of DRAFT, CREATED, SENT, PARTIAL, PAID or CANCELED.
    # @param offset Page offset number.
    # @param limit Maximum number of items you would like returned.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :status The status of the invoice.  Possible values:   - DRAFT   - CREATED   - SENT   - PARTIAL   - PAID   - CANCELED 
    # @return [Array<(InvoicingV2InvoicesAllGet200Response, Fixnum, Hash)>] InvoicingV2InvoicesAllGet200Response data, response status code and response headers
    def get_all_invoices_with_http_info(offset, limit, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: InvoicesApi.get_all_invoices ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'offset' is set
      if @api_client.config.client_side_validation && offset.nil?
        fail ArgumentError, "Missing the required parameter 'offset' when calling InvoicesApi.get_all_invoices"
      end
      # verify the required parameter 'limit' is set
      if @api_client.config.client_side_validation && limit.nil?
        fail ArgumentError, "Missing the required parameter 'limit' when calling InvoicesApi.get_all_invoices"
      end
      # resource path
      local_var_path = 'invoicing/v2/invoices'

      # query parameters
      query_params = {}
      query_params[:'offset'] = offset
      query_params[:'limit'] = limit
      query_params[:'status'] = opts[:'status'] if !opts[:'status'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/hal+json', 'application/json;charset=utf-8', 'application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      if 'GET' == 'POST'
        post_body = '{}'
      else
        post_body = nil
      end
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["get_all_invoices","get_all_invoices_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InvoicingV2InvoicesAllGet200Response')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: InvoicesApi#get_all_invoices\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Get Invoice Details
    # You can retrieve details of a specific invoice. This can be used to check the Invoice status and get a list of invoice payments in the invoice history section of the response. For each payment transaction you can use the Transaction Details API to get more details on the payment transaction.
    #
    # @param id The invoice number.
    # @param [Hash] opts the optional parameters
    # @return [InvoicingV2InvoicesGet200Response]
    #
    def get_invoice(id, opts = {})
      data, status_code, headers = get_invoice_with_http_info(id, opts)
      return data, status_code, headers
    end

    # Get Invoice Details
    # You can retrieve details of a specific invoice. This can be used to check the Invoice status and get a list of invoice payments in the invoice history section of the response. For each payment transaction you can use the Transaction Details API to get more details on the payment transaction.
    # @param id The invoice number.
    # @param [Hash] opts the optional parameters
    # @return [Array<(InvoicingV2InvoicesGet200Response, Fixnum, Hash)>] InvoicingV2InvoicesGet200Response data, response status code and response headers
    def get_invoice_with_http_info(id, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: InvoicesApi.get_invoice ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.get_invoice"
      end
      # resource path
      local_var_path = 'invoicing/v2/invoices/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/hal+json', 'application/json;charset=utf-8', 'application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      if 'GET' == 'POST'
        post_body = '{}'
      else
        post_body = nil
      end
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["get_invoice","get_invoice_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InvoicingV2InvoicesGet200Response')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: InvoicesApi#get_invoice\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Cancel an Invoice
    # You can cancel an invoice if no payment is made to it. You cannot cancel partially or fully paid invoices.
    #
    # @param id The invoice number.
    # @param [Hash] opts the optional parameters
    # @return [InvoicingV2InvoicesCancel200Response]
    #
    def perform_cancel_action(id, opts = {})
      data, status_code, headers = perform_cancel_action_with_http_info(id, opts)
      return data, status_code, headers
    end

    # Cancel an Invoice
    # You can cancel an invoice if no payment is made to it. You cannot cancel partially or fully paid invoices.
    # @param id The invoice number.
    # @param [Hash] opts the optional parameters
    # @return [Array<(InvoicingV2InvoicesCancel200Response, Fixnum, Hash)>] InvoicingV2InvoicesCancel200Response data, response status code and response headers
    def perform_cancel_action_with_http_info(id, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: InvoicesApi.perform_cancel_action ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.perform_cancel_action"
      end
      # resource path
      local_var_path = 'invoicing/v2/invoices/{id}/cancelation'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/hal+json', 'application/json;charset=utf-8', 'application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      if 'POST' == 'POST'
        post_body = '{}'
      else
        post_body = nil
      end
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["perform_cancel_action","perform_cancel_action_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InvoicingV2InvoicesCancel200Response')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: InvoicesApi#perform_cancel_action\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Send an Invoice
    # You can send an invoice in draft or created state or resend a sent or partially paid invoice. Fully paid or canceled invoices cannot be resent.
    #
    # @param id The invoice number.
    # @param [Hash] opts the optional parameters
    # @return [InvoicingV2InvoicesSend200Response]
    #
    def perform_send_action(id, opts = {})
      data, status_code, headers = perform_send_action_with_http_info(id, opts)
      return data, status_code, headers
    end

    # Send an Invoice
    # You can send an invoice in draft or created state or resend a sent or partially paid invoice. Fully paid or canceled invoices cannot be resent.
    # @param id The invoice number.
    # @param [Hash] opts the optional parameters
    # @return [Array<(InvoicingV2InvoicesSend200Response, Fixnum, Hash)>] InvoicingV2InvoicesSend200Response data, response status code and response headers
    def perform_send_action_with_http_info(id, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: InvoicesApi.perform_send_action ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.perform_send_action"
      end
      # resource path
      local_var_path = 'invoicing/v2/invoices/{id}/delivery'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/hal+json', 'application/json;charset=utf-8', 'application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      if 'POST' == 'POST'
        post_body = '{}'
      else
        post_body = nil
      end
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["perform_send_action","perform_send_action_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InvoicingV2InvoicesSend200Response')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: InvoicesApi#perform_send_action\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Update an Invoice
    # You can update all information except the invoice number till any payment is received for an invoice. Invoices that are partially or fully paid or cancelled cannot be updated.
    #
    # @param id The invoice number.
    # @param update_invoice_request Updating the invoice does not resend the invoice automatically. You must resend the invoice separately.
    # @param [Hash] opts the optional parameters
    # @return [InvoicingV2InvoicesPut200Response]
    #
    def update_invoice(id, update_invoice_request, opts = {})
      data, status_code, headers = update_invoice_with_http_info(id, update_invoice_request, opts)
      return data, status_code, headers
    end

    # Update an Invoice
    # You can update all information except the invoice number till any payment is received for an invoice. Invoices that are partially or fully paid or cancelled cannot be updated.
    # @param id The invoice number.
    # @param update_invoice_request Updating the invoice does not resend the invoice automatically. You must resend the invoice separately.
    # @param [Hash] opts the optional parameters
    # @return [Array<(InvoicingV2InvoicesPut200Response, Fixnum, Hash)>] InvoicingV2InvoicesPut200Response data, response status code and response headers
    def update_invoice_with_http_info(id, update_invoice_request, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: InvoicesApi.update_invoice ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling InvoicesApi.update_invoice"
      end
      # verify the required parameter 'update_invoice_request' is set
      if @api_client.config.client_side_validation && update_invoice_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_invoice_request' when calling InvoicesApi.update_invoice"
      end
      # resource path
      local_var_path = 'invoicing/v2/invoices/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/hal+json', 'application/json;charset=utf-8', 'application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(update_invoice_request)
      sdk_tracker = SdkTracker.new
      post_body = sdk_tracker.insert_developer_id_tracker(post_body, 'UpdateInvoiceRequest', @api_client.config.host, @api_client.merchantconfig.defaultDeveloperId)
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["update_invoice","update_invoice_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InvoicingV2InvoicesPut200Response')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: InvoicesApi#update_invoice\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
  end
end
