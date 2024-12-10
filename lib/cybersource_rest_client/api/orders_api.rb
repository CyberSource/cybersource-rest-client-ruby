=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'uri'

module CyberSource
  class OrdersApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default, config)
      @api_client = api_client
      @api_client.set_configuration(config)
    end
    # Create an Order
    # A create order request enables you to send the itemized details along with the order. This API can be used by merchants initiating their transactions with the create order API.  
    #
    # @param create_order_request 
    # @param [Hash] opts the optional parameters
    # @return [PtsV2CreateOrderPost201Response]
    #
    def create_order(create_order_request, opts = {})
      data, status_code, headers = create_order_with_http_info(create_order_request, opts)
      return data, status_code, headers
    end

    # Create an Order
    # A create order request enables you to send the itemized details along with the order. This API can be used by merchants initiating their transactions with the create order API.  
    # @param create_order_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(PtsV2CreateOrderPost201Response, Fixnum, Hash)>] PtsV2CreateOrderPost201Response data, response status code and response headers
    def create_order_with_http_info(create_order_request, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: OrdersApi.create_order ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'create_order_request' is set
      if @api_client.config.client_side_validation && create_order_request.nil?
        fail ArgumentError, "Missing the required parameter 'create_order_request' when calling OrdersApi.create_order"
      end
      # resource path
      local_var_path = 'pts/v2/intents'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(create_order_request)
      sdk_tracker = SdkTracker.new
      post_body = sdk_tracker.insert_developer_id_tracker(post_body, 'CreateOrderRequest', @api_client.config.host, @api_client.merchantconfig.defaultDeveloperId)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PtsV2CreateOrderPost201Response')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: OrdersApi#create_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Update an Order
    # This API can be used in two flavours - for updating the order as well as saving the order. 
    #
    # @param id The ID returned from the original create order response.
    # @param update_order_request 
    # @param [Hash] opts the optional parameters
    # @return [PtsV2UpdateOrderPatch201Response]
    #
    def update_order(id, update_order_request, opts = {})
      data, status_code, headers = update_order_with_http_info(id, update_order_request, opts)
      return data, status_code, headers
    end

    # Update an Order
    # This API can be used in two flavours - for updating the order as well as saving the order. 
    # @param id The ID returned from the original create order response.
    # @param update_order_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(PtsV2UpdateOrderPatch201Response, Fixnum, Hash)>] PtsV2UpdateOrderPatch201Response data, response status code and response headers
    def update_order_with_http_info(id, update_order_request, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: OrdersApi.update_order ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'id' is set
      if @api_client.config.client_side_validation && id.nil?
        fail ArgumentError, "Missing the required parameter 'id' when calling OrdersApi.update_order"
      end
      # verify the required parameter 'update_order_request' is set
      if @api_client.config.client_side_validation && update_order_request.nil?
        fail ArgumentError, "Missing the required parameter 'update_order_request' when calling OrdersApi.update_order"
      end
      # resource path
      local_var_path = 'pts/v2/intents/{id}'.sub('{' + 'id' + '}', id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/hal+json;charset=utf-8'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(update_order_request)
      sdk_tracker = SdkTracker.new
      post_body = sdk_tracker.insert_developer_id_tracker(post_body, 'UpdateOrderRequest', @api_client.config.host, @api_client.merchantconfig.defaultDeveloperId)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:PATCH, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'PtsV2UpdateOrderPatch201Response')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: OrdersApi#update_order\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
  end
end