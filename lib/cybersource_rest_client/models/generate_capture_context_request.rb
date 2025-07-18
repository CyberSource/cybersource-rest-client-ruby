=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'date'

module CyberSource
  # This is a server-to-server API request to generate the capture context that can be used to initiate an instance of Microform on an acceptance page.   The capture context is a digitally signed JWT that provides authentication, one-time keys, and the target origin to the Microform Integration application. 
  class GenerateCaptureContextRequest
    # Specify the version of Microform that you want to use. 
    attr_accessor :client_version

    # The [target origin](https://developer.mozilla.org/en-US/docs/Glossary/Origin) of the website on which you will be launching Microform is defined by the scheme (protocol), hostname (domain) and port number (if used).    You must use https://hostname (unless you use http://localhost) Wildcards are NOT supported.  Ensure that subdomains are included. Any valid top-level domain is supported (e.g. .com, .co.uk, .gov.br etc)  Examples:   - https://example.com   - https://subdomain.example.com   - https://example.com:8080<br><br>  If you are embedding within multiple nested iframes you need to specify the origins of all the browser contexts used, for example:    targetOrigins: [     \"https://example.com\",     \"https://basket.example.com\",     \"https://ecom.example.com\"   ]<br><br>  You can supply up to nine origins within the targetOrigins field for nested iframes. If the list of origins exceeds five ensure that you:   - Compare the list of origins in the v2/sessions targetOrigins field against the location.ancestorOrigins of the browser.    - Ensure that the count of origins and their content matches in both.  If any origins are absent or mismatched, the system will prevent Microform from loading and display a client-side error message. 
    attr_accessor :target_origins

    # The list of card networks you want to use for this Microform transaction.  Microform currently supports the following card networks: - VISA - MASTERCARD - AMEX - CARNET - CARTESBANCAIRES - CUP - DINERSCLUB - DISCOVER - EFTPOS - ELO - JCB - JCREW - MADA - MAESTRO - MEEZA - PAYPAK  **Important:**    - When integrating Microform (Card) at least one card network should be specified in the allowedCardNetworks field in the capture context request.   - When integrating Microform (ACH/eCheck) the allowedCardNetworks field is not required in the capture context request.   - When integrating both Microform (Card) and Microform (ACH/eCheck) at least one card network should be specified in the allowedCardNetworks field in the capture context request. 
    attr_accessor :allowed_card_networks

    # The payment types that are allowed for the merchant.    Possible values when launching Microform: - CARD - CHECK <br><br> 
    attr_accessor :allowed_payment_types

    attr_accessor :transient_token_response_options

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'client_version' => :'clientVersion',
        :'target_origins' => :'targetOrigins',
        :'allowed_card_networks' => :'allowedCardNetworks',
        :'allowed_payment_types' => :'allowedPaymentTypes',
        :'transient_token_response_options' => :'transientTokenResponseOptions'
      }
    end

    # Attribute mapping from JSON key to ruby-style variable name.
    def self.json_map
      {
        :'client_version' => :'client_version',
        :'target_origins' => :'target_origins',
        :'allowed_card_networks' => :'allowed_card_networks',
        :'allowed_payment_types' => :'allowed_payment_types',
        :'transient_token_response_options' => :'transient_token_response_options'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'client_version' => :'String',
        :'target_origins' => :'Array<String>',
        :'allowed_card_networks' => :'Array<String>',
        :'allowed_payment_types' => :'Array<String>',
        :'transient_token_response_options' => :'Microformv2sessionsTransientTokenResponseOptions'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'clientVersion')
        self.client_version = attributes[:'clientVersion']
      end

      if attributes.has_key?(:'targetOrigins')
        if (value = attributes[:'targetOrigins']).is_a?(Array)
          self.target_origins = value
        end
      end

      if attributes.has_key?(:'allowedCardNetworks')
        if (value = attributes[:'allowedCardNetworks']).is_a?(Array)
          self.allowed_card_networks = value
        end
      end

      if attributes.has_key?(:'allowedPaymentTypes')
        if (value = attributes[:'allowedPaymentTypes']).is_a?(Array)
          self.allowed_payment_types = value
        end
      end

      if attributes.has_key?(:'transientTokenResponseOptions')
        self.transient_token_response_options = attributes[:'transientTokenResponseOptions']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          client_version == o.client_version &&
          target_origins == o.target_origins &&
          allowed_card_networks == o.allowed_card_networks &&
          allowed_payment_types == o.allowed_payment_types &&
          transient_token_response_options == o.transient_token_response_options
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [client_version, target_origins, allowed_card_networks, allowed_payment_types, transient_token_response_options].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{self.class.json_map[key]}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{self.class.json_map[key]}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = CyberSource.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
