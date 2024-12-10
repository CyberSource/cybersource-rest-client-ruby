=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'uri'

module CyberSource
  class FlexAPIApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default, config)
      @api_client = api_client
      @api_client.set_configuration(config)
    end
    # Establish a Payment Session with a Capture Context
    # To establish a payment session, include the API fields you plan to use in that session in the body of the request.  The system then returns a JSON Web Token (JWT) that includes the capture context.   To determine which fields to include in your capture context, identify the personal information that you wish to isolate from the payment session.  **Capture Context Fields**<br> When making a session request, any fields that you request to be added to the capture context are required by default.  However, you can choose to make a field optional by setting the required parameter to false. 
    #
    # @param generate_flex_api_capture_context_request 
    # @param [Hash] opts the optional parameters
    # @return [String]
    #
    def generate_flex_api_capture_context(generate_flex_api_capture_context_request, opts = {})
      data, status_code, headers = generate_flex_api_capture_context_with_http_info(generate_flex_api_capture_context_request, opts)
      return data, status_code, headers
    end

    # Establish a Payment Session with a Capture Context
    # To establish a payment session, include the API fields you plan to use in that session in the body of the request.  The system then returns a JSON Web Token (JWT) that includes the capture context.   To determine which fields to include in your capture context, identify the personal information that you wish to isolate from the payment session.  **Capture Context Fields**&lt;br&gt; When making a session request, any fields that you request to be added to the capture context are required by default.  However, you can choose to make a field optional by setting the required parameter to false. 
    # @param generate_flex_api_capture_context_request 
    # @param [Hash] opts the optional parameters
    # @return [Array<(String, Fixnum, Hash)>] String data, response status code and response headers
    def generate_flex_api_capture_context_with_http_info(generate_flex_api_capture_context_request, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: FlexAPIApi.generate_flex_api_capture_context ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'generate_flex_api_capture_context_request' is set
      if @api_client.config.client_side_validation && generate_flex_api_capture_context_request.nil?
        fail ArgumentError, "Missing the required parameter 'generate_flex_api_capture_context_request' when calling FlexAPIApi.generate_flex_api_capture_context"
      end
      # resource path
      local_var_path = 'flex/v2/sessions'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/jwt'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json;charset=utf-8'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(generate_flex_api_capture_context_request)
      sdk_tracker = SdkTracker.new
      post_body = sdk_tracker.insert_developer_id_tracker(post_body, 'GenerateFlexAPICaptureContextRequest', @api_client.config.host, @api_client.merchantconfig.defaultDeveloperId)
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'String')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: FlexAPIApi#generate_flex_api_capture_context\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
  end
end