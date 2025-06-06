=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'date'

module CyberSource
  class Tmsv2customersEmbeddedDefaultPaymentInstrumentBillTo
    # Customer's first name. This name must be the same as the name on the card. 
    attr_accessor :first_name

    # Customer's last name. This name must be the same as the name on the card. 
    attr_accessor :last_name

    # Name of the customer's company. 
    attr_accessor :company

    # Payment card billing street address as it appears on the credit card issuer's records. 
    attr_accessor :address1

    # Additional address information. 
    attr_accessor :address2

    # Payment card billing city. 
    attr_accessor :locality

    # State or province of the billing address. Use the State, Province, and Territory Codes for the United States and Canada. 
    attr_accessor :administrative_area

    # Postal code for the billing address. The postal code must consist of 5 to 9 digits.  When the billing country is the U.S., the 9-digit postal code must follow this format: [5 digits][dash][4 digits]  **Example** `12345-6789`  When the billing country is Canada, the 6-digit postal code must follow this format: [alpha][numeric][alpha][space][numeric][alpha][numeric]  **Example** `A1B 2C3` 
    attr_accessor :postal_code

    # Payment card billing country. Use the two-character ISO Standard Country Codes. 
    attr_accessor :country

    # Customer's email address, including the full domain name. 
    attr_accessor :email

    # Customer's phone number. 
    attr_accessor :phone_number

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'first_name' => :'firstName',
        :'last_name' => :'lastName',
        :'company' => :'company',
        :'address1' => :'address1',
        :'address2' => :'address2',
        :'locality' => :'locality',
        :'administrative_area' => :'administrativeArea',
        :'postal_code' => :'postalCode',
        :'country' => :'country',
        :'email' => :'email',
        :'phone_number' => :'phoneNumber'
      }
    end

    # Attribute mapping from JSON key to ruby-style variable name.
    def self.json_map
      {
        :'first_name' => :'first_name',
        :'last_name' => :'last_name',
        :'company' => :'company',
        :'address1' => :'address1',
        :'address2' => :'address2',
        :'locality' => :'locality',
        :'administrative_area' => :'administrative_area',
        :'postal_code' => :'postal_code',
        :'country' => :'country',
        :'email' => :'email',
        :'phone_number' => :'phone_number'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'first_name' => :'String',
        :'last_name' => :'String',
        :'company' => :'String',
        :'address1' => :'String',
        :'address2' => :'String',
        :'locality' => :'String',
        :'administrative_area' => :'String',
        :'postal_code' => :'String',
        :'country' => :'String',
        :'email' => :'String',
        :'phone_number' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'firstName')
        self.first_name = attributes[:'firstName']
      end

      if attributes.has_key?(:'lastName')
        self.last_name = attributes[:'lastName']
      end

      if attributes.has_key?(:'company')
        self.company = attributes[:'company']
      end

      if attributes.has_key?(:'address1')
        self.address1 = attributes[:'address1']
      end

      if attributes.has_key?(:'address2')
        self.address2 = attributes[:'address2']
      end

      if attributes.has_key?(:'locality')
        self.locality = attributes[:'locality']
      end

      if attributes.has_key?(:'administrativeArea')
        self.administrative_area = attributes[:'administrativeArea']
      end

      if attributes.has_key?(:'postalCode')
        self.postal_code = attributes[:'postalCode']
      end

      if attributes.has_key?(:'country')
        self.country = attributes[:'country']
      end

      if attributes.has_key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.has_key?(:'phoneNumber')
        self.phone_number = attributes[:'phoneNumber']
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
    # @param [Object] first_name Value to be assigned
    def first_name=(first_name)
      @first_name = first_name
    end

    # Custom attribute writer method with validation
    # @param [Object] last_name Value to be assigned
    def last_name=(last_name)
      @last_name = last_name
    end

    # Custom attribute writer method with validation
    # @param [Object] company Value to be assigned
    def company=(company)
      @company = company
    end

    # Custom attribute writer method with validation
    # @param [Object] address1 Value to be assigned
    def address1=(address1)
      @address1 = address1
    end

    # Custom attribute writer method with validation
    # @param [Object] address2 Value to be assigned
    def address2=(address2)
      @address2 = address2
    end

    # Custom attribute writer method with validation
    # @param [Object] locality Value to be assigned
    def locality=(locality)
      @locality = locality
    end

    # Custom attribute writer method with validation
    # @param [Object] administrative_area Value to be assigned
    def administrative_area=(administrative_area)
      @administrative_area = administrative_area
    end

    # Custom attribute writer method with validation
    # @param [Object] postal_code Value to be assigned
    def postal_code=(postal_code)
      @postal_code = postal_code
    end

    # Custom attribute writer method with validation
    # @param [Object] country Value to be assigned
    def country=(country)
      @country = country
    end

    # Custom attribute writer method with validation
    # @param [Object] email Value to be assigned
    def email=(email)
      @email = email
    end

    # Custom attribute writer method with validation
    # @param [Object] phone_number Value to be assigned
    def phone_number=(phone_number)
      @phone_number = phone_number
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          first_name == o.first_name &&
          last_name == o.last_name &&
          company == o.company &&
          address1 == o.address1 &&
          address2 == o.address2 &&
          locality == o.locality &&
          administrative_area == o.administrative_area &&
          postal_code == o.postal_code &&
          country == o.country &&
          email == o.email &&
          phone_number == o.phone_number
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [first_name, last_name, company, address1, address2, locality, administrative_area, postal_code, country, email, phone_number].hash
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
