=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'date'

module CyberSource
  class Ptsv1pushfundstransferPointOfServiceInformation
    # Identifier for the terminal at your retail location. You can define this value yourself, but consult the processor for requirements.  Visa Platform Connect A list of all possible values is stored in your CyberSource account. If terminal ID validation is enabled for your CyberSource account, the value you send for this field is validated against the list each time you include the field in a request. To enable or disable terminal ID validation, contact CyberSource Customer Support.   Used by Authorization Optional for the following processors. When you do not include this field in a request, the default value that is defined in your account is used.  Chase Paymentech Solutions: Optional field. If you include this field in your request, you must also include pointOfSaleInformation.catLevel. 
    attr_accessor :terminal_id

    # Type of cardholder-activated terminal. Possible values:  - `1`: Automated dispensing machine - `2`: Self-service terminal - `3`: Limited amount terminal - `4`: In-flight commerce (IFC) terminal - `5`: Radio frequency device - `6`: Mobile acceptance terminal - `7`: Electronic cash register - `8`: E-commerce device at your location - `9`: Terminal or cash register that uses a dialup connection to connect to the transaction processing network  Chase Paymentech Solutions Only values 1, 2, and 3 are supported. Required if pointOfSaleInformation.terminalID is included in the request; otherwise, optional.  Visa Platform COnnect Values 1 through 6 are supported on CyberSource through VisaNet, but some acquirers do not support all six values. Optional field.  Nonnegative integer. 
    attr_accessor :cat_level

    # Method of entering payment card information into the POS terminal. Possible values:  - `contact`: Read from direct contact with chip card. - `contactless`: Read from a contactless interface using chip data. - `keyed`: Manually keyed into POS terminal. This value is not supported on OmniPay Direct. - `msd`: Read from a contactless interface using magnetic stripe data (MSD). This value is not supported on OmniPay Direct. - `swiped`: Read from credit card magnetic stripe. The contact, contactless, and msd values are supported only for EMV transactions. 
    attr_accessor :entry_mode

    # PIN Entry Capability - 0 Unknown. - 1 Indicates terminal can accept and forward online PINs. - 2 Indicates terminal cannot accept and forward online PINs. - 8 Terminal PIN pad down. - 9 Reserved for future use. 
    attr_accessor :pin_entry_capability

    # integer [ 1 .. 5 ] POS terminal’s capability. Possible values:  - `1`: Terminal has a magnetic stripe reader only. - `2`: Terminal has a magnetic stripe reader and manual entry capability. - `3`: Terminal has manual entry capability only. - `4`: Terminal can read chip cards. - `5`: Terminal can read contactless chip cards; cannot use contact to read chip cards. For an EMV transaction, the value of this field must be 4 or 5.  Used by Authorization Required for the following processors: Chase Paymentech Solutions  Optional for the following processors: Visa Platform Connect 
    attr_accessor :terminal_capability

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'terminal_id' => :'terminalId',
        :'cat_level' => :'catLevel',
        :'entry_mode' => :'entryMode',
        :'pin_entry_capability' => :'pinEntryCapability',
        :'terminal_capability' => :'terminalCapability'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'terminal_id' => :'String',
        :'cat_level' => :'Integer',
        :'entry_mode' => :'String',
        :'pin_entry_capability' => :'Integer',
        :'terminal_capability' => :'Integer'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'terminalId')
        self.terminal_id = attributes[:'terminalId']
      end

      if attributes.has_key?(:'catLevel')
        self.cat_level = attributes[:'catLevel']
      end

      if attributes.has_key?(:'entryMode')
        self.entry_mode = attributes[:'entryMode']
      end

      if attributes.has_key?(:'pinEntryCapability')
        self.pin_entry_capability = attributes[:'pinEntryCapability']
      end

      if attributes.has_key?(:'terminalCapability')
        self.terminal_capability = attributes[:'terminalCapability']
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

    # Custom attribute writer method with validation
    # @param [Object] terminal_id Value to be assigned
    def terminal_id=(terminal_id)
      @terminal_id = terminal_id
    end

    # Custom attribute writer method with validation
    # @param [Object] entry_mode Value to be assigned
    def entry_mode=(entry_mode)
      @entry_mode = entry_mode
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          terminal_id == o.terminal_id &&
          cat_level == o.cat_level &&
          entry_mode == o.entry_mode &&
          pin_entry_capability == o.pin_entry_capability &&
          terminal_capability == o.terminal_capability
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [terminal_id, cat_level, entry_mode, pin_entry_capability, terminal_capability].hash
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
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
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