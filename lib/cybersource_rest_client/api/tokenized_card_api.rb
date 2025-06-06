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
  class TokenizedCardApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default, config)
      @api_client = api_client
      @api_client.set_configuration(config)
    end
    # Delete a Tokenized Card
    # |  |  |  | | --- | --- | --- | | The Network Token will attempt to be deleted from the card association and if successful the corresponding TMS Network Token will be deleted. 
    #
    # @param tokenized_card_id The Id of a tokenized card.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [nil]
    #
    def delete_tokenized_card(tokenized_card_id, opts = {})
      data, status_code, headers = delete_tokenized_card_with_http_info(tokenized_card_id, opts)
      return data, status_code, headers
    end

    # Delete a Tokenized Card
    # |  |  |  | | --- | --- | --- | | The Network Token will attempt to be deleted from the card association and if successful the corresponding TMS Network Token will be deleted. 
    # @param tokenized_card_id The Id of a tokenized card.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_tokenized_card_with_http_info(tokenized_card_id, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: TokenizedCardApi.delete_tokenized_card ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'tokenized_card_id' is set
      if @api_client.config.client_side_validation && tokenized_card_id.nil?
        fail ArgumentError, "Missing the required parameter 'tokenized_card_id' when calling TokenizedCardApi.delete_tokenized_card"
      end
      # resource path
      local_var_path = 'tms/v2/tokenized-cards/{tokenizedCardId}'.sub('{' + 'tokenizedCardId' + '}', tokenized_card_id.to_s)

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
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["delete_tokenized_card","delete_tokenized_card_with_http_info"])
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
            @api_client.config.logger.debug "API called: TokenizedCardApi#delete_tokenized_card\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Retrieve a Tokenized Card
    # |  |  |  | | --- | --- | --- | |**Tokenized Cards**<br>A Tokenized Card represents a network token. Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires.  
    #
    # @param tokenized_card_id The Id of a tokenized card.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [TokenizedcardRequest]
    #
    def get_tokenized_card(tokenized_card_id, opts = {})
      data, status_code, headers = get_tokenized_card_with_http_info(tokenized_card_id, opts)
      return data, status_code, headers
    end

    # Retrieve a Tokenized Card
    # |  |  |  | | --- | --- | --- | |**Tokenized Cards**&lt;br&gt;A Tokenized Card represents a network token. Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires.  
    # @param tokenized_card_id The Id of a tokenized card.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [Array<(TokenizedcardRequest, Fixnum, Hash)>] TokenizedcardRequest data, response status code and response headers
    def get_tokenized_card_with_http_info(tokenized_card_id, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: TokenizedCardApi.get_tokenized_card ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'tokenized_card_id' is set
      if @api_client.config.client_side_validation && tokenized_card_id.nil?
        fail ArgumentError, "Missing the required parameter 'tokenized_card_id' when calling TokenizedCardApi.get_tokenized_card"
      end
      # resource path
      local_var_path = 'tms/v2/tokenized-cards/{tokenizedCardId}'.sub('{' + 'tokenizedCardId' + '}', tokenized_card_id.to_s)

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
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["get_tokenized_card","get_tokenized_card_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TokenizedcardRequest')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: TokenizedCardApi#get_tokenized_card\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
    # Create a Tokenized Card
    # |  |  |  | | --- | --- | --- | |**Tokenized cards**<br>A Tokenized card represents a network token. Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires. 
    #
    # @param tokenizedcard_request 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [TokenizedcardRequest]
    #
    def post_tokenized_card(tokenizedcard_request, opts = {})
      data, status_code, headers = post_tokenized_card_with_http_info(tokenizedcard_request, opts)
      return data, status_code, headers
    end

    # Create a Tokenized Card
    # |  |  |  | | --- | --- | --- | |**Tokenized cards**&lt;br&gt;A Tokenized card represents a network token. Network tokens perform better than regular card numbers and they are not necessarily invalidated when a cardholder loses their card, or it expires. 
    # @param tokenizedcard_request 
    # @param [Hash] opts the optional parameters
    # @option opts [String] :profile_id The Id of a profile containing user specific TMS configuration.
    # @return [Array<(TokenizedcardRequest, Fixnum, Hash)>] TokenizedcardRequest data, response status code and response headers
    def post_tokenized_card_with_http_info(tokenizedcard_request, opts = {})

      if @api_client.config.debugging
          begin
            raise
                @api_client.config.logger.debug 'Calling API: TokenizedCardApi.post_tokenized_card ...'
            rescue
                puts 'Cannot write to log'
            end
      end
      # verify the required parameter 'tokenizedcard_request' is set
      if @api_client.config.client_side_validation && tokenizedcard_request.nil?
        fail ArgumentError, "Missing the required parameter 'tokenizedcard_request' when calling TokenizedCardApi.post_tokenized_card"
      end
      # resource path
      local_var_path = 'tms/v2/tokenized-cards'

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
      post_body = @api_client.object_to_http_body(tokenizedcard_request)
      sdk_tracker = SdkTracker.new
      post_body = sdk_tracker.insert_developer_id_tracker(post_body, 'TokenizedcardRequest', @api_client.config.host, @api_client.merchantconfig.defaultDeveloperId)
      is_mle_supported_by_cybs_for_api = false
      if MLEUtility.check_is_mle_for_API(@api_client.merchantconfig, is_mle_supported_by_cybs_for_api, ["post_tokenized_card","post_tokenized_card_with_http_info"])
        post_body = MLEUtility.encrypt_request_payload(@api_client.merchantconfig, post_body)
      end
      auth_names = []
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TokenizedcardRequest')
      if @api_client.config.debugging
        begin
        raise
            @api_client.config.logger.debug "API called: TokenizedCardApi#post_tokenized_card\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
        rescue
            puts 'Cannot write to log'
        end
      end
      return data, status_code, headers
    end
  end
end
