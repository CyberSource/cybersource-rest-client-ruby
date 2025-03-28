=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'date'

module CyberSource
  class Tmsv2customersEmbeddedDefaultPaymentInstrumentCard
    # Two-digit month in which the payment card expires.  Format: `MM`.  Possible Values: `01` through `12`. 
    attr_accessor :expiration_month

    # Four-digit year in which the credit card expires.  Format: `YYYY`. 
    attr_accessor :expiration_year

    # Value that indicates the card type. Possible Values v2 : v1:   * 001 : visa   * 002 : mastercard - Eurocard—European regional brand of Mastercard   * 003 : american express   * 004 : discover   * 005 : diners club   * 006 : carte blanche   * 007 : jcb   * 008 : optima   * 011 : twinpay credit   * 012 : twinpay debit   * 013 : walmart   * 014 : enRoute   * 015 : lowes consumer   * 016 : home depot consumer   * 017 : mbna   * 018 : dicks sportswear   * 019 : casual corner   * 020 : sears   * 021 : jal   * 023 : disney   * 024 : maestro uk domestic   * 025 : sams club consumer   * 026 : sams club business   * 028 : bill me later   * 029 : bebe   * 030 : restoration hardware   * 031 : delta online — use this value only for Ingenico ePayments. For other processors, use 001 for all Visa card types.   * 032 : solo   * 033 : visa electron   * 034 : dankort   * 035 : laser   * 036 : carte bleue — formerly Cartes Bancaires   * 037 : carta si   * 038 : pinless debit   * 039 : encoded account   * 040 : uatp   * 041 : household   * 042 : maestro international   * 043 : ge money uk   * 044 : korean cards   * 045 : style   * 046 : jcrew   * 047 : payease china processing ewallet   * 048 : payease china processing bank transfer   * 049 : meijer private label   * 050 : hipercard — supported only by the Comercio Latino processor.   * 051 : aura — supported only by the Comercio Latino processor.   * 052 : redecard   * 054 : elo — supported only by the Comercio Latino processor.   * 055 : capital one private label   * 056 : synchrony private label   * 057 : costco private label   * 060 : mada   * 062 : china union pay   * 063 : falabella private label 
    attr_accessor :type

    # Number of times a Maestro (UK Domestic) card has been issued to the account holder. The card might or might not have an issue number. The number can consist of one or two digits, and the first digit might be a zero. When you include this value in your request, include exactly what is printed on the card. A value of 2 is different than a value of 02. Do not include the field, even with a blank value, if the card is not a Maestro (UK Domestic) card.  **Note** The issue number is not required for Maestro (UK Domestic) transactions. 
    attr_accessor :issue_number

    # Month of the start of the Maestro (UK Domestic) card validity period. Do not include the field, even with a blank value, if the card is not a Maestro (UK Domestic) card. `Format: MM`. Possible Values: 01 through 12.  **Note** The start date is not required for Maestro (UK Domestic) transactions. 
    attr_accessor :start_month

    # Year of the start of the Maestro (UK Domestic) card validity period. Do not include the field, even with a blank value, if the card is not a Maestro (UK Domestic) card. `Format: YYYY`.  **Note** The start date is not required for Maestro (UK Domestic) transactions. 
    attr_accessor :start_year

    # 'Payment Instrument was created / updated as part of a pinless debit transaction.' 
    attr_accessor :use_as

    # Hash value representing the card. 
    attr_accessor :hash 
 	 alias :sdk_hash_value :hash

    attr_accessor :tokenized_information

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'expiration_month' => :'expirationMonth',
        :'expiration_year' => :'expirationYear',
        :'type' => :'type',
        :'issue_number' => :'issueNumber',
        :'start_month' => :'startMonth',
        :'start_year' => :'startYear',
        :'use_as' => :'useAs',
        :'sdk_hash_value' => :'hash',
        :'tokenized_information' => :'tokenizedInformation'
      }
    end

    # Attribute mapping from JSON key to ruby-style variable name.
    def self.json_map
      {
        :'expiration_month' => :'expiration_month',
        :'expiration_year' => :'expiration_year',
        :'type' => :'type',
        :'issue_number' => :'issue_number',
        :'start_month' => :'start_month',
        :'start_year' => :'start_year',
        :'use_as' => :'use_as',
        :'sdk_hash_value' => :'hash',
        :'tokenized_information' => :'tokenized_information'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'expiration_month' => :'String',
        :'expiration_year' => :'String',
        :'type' => :'String',
        :'issue_number' => :'String',
        :'start_month' => :'String',
        :'start_year' => :'String',
        :'use_as' => :'String',
        :'sdk_hash_value' => :'String',
        :'tokenized_information' => :'Tmsv2customersEmbeddedDefaultPaymentInstrumentCardTokenizedInformation'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'expirationMonth')
        self.expiration_month = attributes[:'expirationMonth']
      end

      if attributes.has_key?(:'expirationYear')
        self.expiration_year = attributes[:'expirationYear']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'issueNumber')
        self.issue_number = attributes[:'issueNumber']
      end

      if attributes.has_key?(:'startMonth')
        self.start_month = attributes[:'startMonth']
      end

      if attributes.has_key?(:'startYear')
        self.start_year = attributes[:'startYear']
      end

      if attributes.has_key?(:'useAs')
        self.use_as = attributes[:'useAs']
      end

      if attributes.has_key?(:'sdkHashValue')
        self.sdk_hash_value = attributes[:'sdkHashValue']
      end

      if attributes.has_key?(:'tokenizedInformation')
        self.tokenized_information = attributes[:'tokenizedInformation']
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
    # @param [Object] expiration_month Value to be assigned
    def expiration_month=(expiration_month)
      @expiration_month = expiration_month
    end

    # Custom attribute writer method with validation
    # @param [Object] expiration_year Value to be assigned
    def expiration_year=(expiration_year)
      @expiration_year = expiration_year
    end

    # Custom attribute writer method with validation
    # @param [Object] issue_number Value to be assigned
    def issue_number=(issue_number)
      @issue_number = issue_number
    end

    # Custom attribute writer method with validation
    # @param [Object] start_month Value to be assigned
    def start_month=(start_month)
      @start_month = start_month
    end

    # Custom attribute writer method with validation
    # @param [Object] start_year Value to be assigned
    def start_year=(start_year)
      @start_year = start_year
    end

    # Custom attribute writer method with validation
    # @param [Object] sdk_hash_value Value to be assigned
    def sdk_hash_value=(sdk_hash_value)
      @sdk_hash_value = sdk_hash_value
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          expiration_month == o.expiration_month &&
          expiration_year == o.expiration_year &&
          type == o.type &&
          issue_number == o.issue_number &&
          start_month == o.start_month &&
          start_year == o.start_year &&
          use_as == o.use_as &&
          sdk_hash_value == o.sdk_hash_value &&
          tokenized_information == o.tokenized_information
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [expiration_month, expiration_year, type, issue_number, start_month, start_year, use_as, sdk_hash_value, tokenized_information].hash
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
