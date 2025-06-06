=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'date'

module CyberSource
  class TokenizedcardRequest
    attr_accessor :_links

    # The Id of the Tokenized Card. 
    attr_accessor :id

    # The type. Possible Values: - tokenizedCard 
    attr_accessor :object

    # An identifier provided by the issuer for the account. 
    attr_accessor :account_reference_id

    # Identifier of the consumer within the wallet. Maximum 24 characters for VTS.
    attr_accessor :consumer_id

    # Specifies whether the InstrumentId should be created (true) or not (false). Possible Values: - `true`: The InstrumentId should be created. - `false`: The InstrumentId should be created. 
    attr_accessor :create_instrument_identifier

    # Source of the payment instrument. Possible Values: - ONFILE - TOKEN - ISSUER 
    attr_accessor :source

    # State of the network token or network token provision. Possible Values:   ACTIVE : Network token is active.   SUSPENDED : Network token is suspended. This state can change back to ACTIVE.   DELETED : This is a final state for a network token instance.   UNPROVISIONED : A previous network token. 
    attr_accessor :state

    # Issuers state for the network token Possible Values: - INVALID_REQUEST : The network token provision request contained invalid data. - CARD_VERIFICATION_FAILED : The network token provision request contained data that could not be verified. - CARD_NOT_ELIGIBLE : Card can currently not be used with issuer for tokenization. - CARD_NOT_ALLOWED : Card can currently not be used with card association for tokenization. - DECLINED : Card can currently not be used with issuer for tokenization. - SERVICE_UNAVAILABLE : The network token service was unavailable or timed out. - SYSTEM_ERROR : An unexpected error occurred with network token service, check configuration. 
    attr_accessor :reason

    # The token requestor's network token for the provided PAN and consumer Id, if available. 
    attr_accessor :number

    # Two-digit month in which the network token expires. Format: `MM`. Possible Values: `01` through `12`. 
    attr_accessor :expiration_month

    # Four-digit year in which the network token expires. Format: `YYYY`. 
    attr_accessor :expiration_year

    # The type of card (Card Network). Possible Values: - visa - mastercard - americanexpress 
    attr_accessor :type

    # Value generated by the card association to be used alongside the network token for processing a payment. 
    attr_accessor :cryptogram

    # 4-digit number generated by the card association to be used alogside the network token for processing a payment. Only supported for Amex and SCOF. 
    attr_accessor :security_code

    # Raw Electronic Commerce Indicator provided by the card association with the result of the cardholder authentication. 
    attr_accessor :eci

    # 11-digit identifier that uniquely identifies the Token Requestor. 
    attr_accessor :requestor_id

    # Unique id to identify this PAN/ enrollment. 
    attr_accessor :enrollment_id

    # Unique ID for netwrok token. 
    attr_accessor :token_reference_id

    # Payment account reference. 
    attr_accessor :payment_account_reference

    attr_accessor :card

    attr_accessor :passcode

    attr_accessor :metadata

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'_links' => :'_links',
        :'id' => :'id',
        :'object' => :'object',
        :'account_reference_id' => :'accountReferenceId',
        :'consumer_id' => :'consumerId',
        :'create_instrument_identifier' => :'createInstrumentIdentifier',
        :'source' => :'source',
        :'state' => :'state',
        :'reason' => :'reason',
        :'number' => :'number',
        :'expiration_month' => :'expirationMonth',
        :'expiration_year' => :'expirationYear',
        :'type' => :'type',
        :'cryptogram' => :'cryptogram',
        :'security_code' => :'securityCode',
        :'eci' => :'eci',
        :'requestor_id' => :'requestorId',
        :'enrollment_id' => :'enrollmentId',
        :'token_reference_id' => :'tokenReferenceId',
        :'payment_account_reference' => :'paymentAccountReference',
        :'card' => :'card',
        :'passcode' => :'passcode',
        :'metadata' => :'metadata'
      }
    end

    # Attribute mapping from JSON key to ruby-style variable name.
    def self.json_map
      {
        :'_links' => :'_links',
        :'id' => :'id',
        :'object' => :'object',
        :'account_reference_id' => :'account_reference_id',
        :'consumer_id' => :'consumer_id',
        :'create_instrument_identifier' => :'create_instrument_identifier',
        :'source' => :'source',
        :'state' => :'state',
        :'reason' => :'reason',
        :'number' => :'number',
        :'expiration_month' => :'expiration_month',
        :'expiration_year' => :'expiration_year',
        :'type' => :'type',
        :'cryptogram' => :'cryptogram',
        :'security_code' => :'security_code',
        :'eci' => :'eci',
        :'requestor_id' => :'requestor_id',
        :'enrollment_id' => :'enrollment_id',
        :'token_reference_id' => :'token_reference_id',
        :'payment_account_reference' => :'payment_account_reference',
        :'card' => :'card',
        :'passcode' => :'passcode',
        :'metadata' => :'metadata'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'_links' => :'Tmsv2TokenizedCardLinks',
        :'id' => :'String',
        :'object' => :'String',
        :'account_reference_id' => :'String',
        :'consumer_id' => :'String',
        :'create_instrument_identifier' => :'BOOLEAN',
        :'source' => :'String',
        :'state' => :'String',
        :'reason' => :'String',
        :'number' => :'String',
        :'expiration_month' => :'String',
        :'expiration_year' => :'String',
        :'type' => :'String',
        :'cryptogram' => :'String',
        :'security_code' => :'String',
        :'eci' => :'String',
        :'requestor_id' => :'String',
        :'enrollment_id' => :'String',
        :'token_reference_id' => :'String',
        :'payment_account_reference' => :'String',
        :'card' => :'Tmsv2TokenizedCardCard',
        :'passcode' => :'Tmsv2TokenizedCardPasscode',
        :'metadata' => :'Tmsv2TokenizedCardMetadata'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'_links')
        self._links = attributes[:'_links']
      end

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'object')
        self.object = attributes[:'object']
      end

      if attributes.has_key?(:'accountReferenceId')
        self.account_reference_id = attributes[:'accountReferenceId']
      end

      if attributes.has_key?(:'consumerId')
        self.consumer_id = attributes[:'consumerId']
      end

      if attributes.has_key?(:'createInstrumentIdentifier')
        self.create_instrument_identifier = attributes[:'createInstrumentIdentifier']
      end

      if attributes.has_key?(:'source')
        self.source = attributes[:'source']
      end

      if attributes.has_key?(:'state')
        self.state = attributes[:'state']
      end

      if attributes.has_key?(:'reason')
        self.reason = attributes[:'reason']
      end

      if attributes.has_key?(:'number')
        self.number = attributes[:'number']
      end

      if attributes.has_key?(:'expirationMonth')
        self.expiration_month = attributes[:'expirationMonth']
      end

      if attributes.has_key?(:'expirationYear')
        self.expiration_year = attributes[:'expirationYear']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'cryptogram')
        self.cryptogram = attributes[:'cryptogram']
      end

      if attributes.has_key?(:'securityCode')
        self.security_code = attributes[:'securityCode']
      end

      if attributes.has_key?(:'eci')
        self.eci = attributes[:'eci']
      end

      if attributes.has_key?(:'requestorId')
        self.requestor_id = attributes[:'requestorId']
      end

      if attributes.has_key?(:'enrollmentId')
        self.enrollment_id = attributes[:'enrollmentId']
      end

      if attributes.has_key?(:'tokenReferenceId')
        self.token_reference_id = attributes[:'tokenReferenceId']
      end

      if attributes.has_key?(:'paymentAccountReference')
        self.payment_account_reference = attributes[:'paymentAccountReference']
      end

      if attributes.has_key?(:'card')
        self.card = attributes[:'card']
      end

      if attributes.has_key?(:'passcode')
        self.passcode = attributes[:'passcode']
      end

      if attributes.has_key?(:'metadata')
        self.metadata = attributes[:'metadata']
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
    # @param [Object] consumer_id Value to be assigned
    def consumer_id=(consumer_id)
      @consumer_id = consumer_id
    end

    # Custom attribute writer method with validation
    # @param [Object] requestor_id Value to be assigned
    def requestor_id=(requestor_id)
      @requestor_id = requestor_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          _links == o._links &&
          id == o.id &&
          object == o.object &&
          account_reference_id == o.account_reference_id &&
          consumer_id == o.consumer_id &&
          create_instrument_identifier == o.create_instrument_identifier &&
          source == o.source &&
          state == o.state &&
          reason == o.reason &&
          number == o.number &&
          expiration_month == o.expiration_month &&
          expiration_year == o.expiration_year &&
          type == o.type &&
          cryptogram == o.cryptogram &&
          security_code == o.security_code &&
          eci == o.eci &&
          requestor_id == o.requestor_id &&
          enrollment_id == o.enrollment_id &&
          token_reference_id == o.token_reference_id &&
          payment_account_reference == o.payment_account_reference &&
          card == o.card &&
          passcode == o.passcode &&
          metadata == o.metadata
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [_links, id, object, account_reference_id, consumer_id, create_instrument_identifier, source, state, reason, number, expiration_month, expiration_year, type, cryptogram, security_code, eci, requestor_id, enrollment_id, token_reference_id, payment_account_reference, card, passcode, metadata].hash
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
