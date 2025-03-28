=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'date'

module CyberSource
  # Payment Processing connection used to support eCheck, aka ACH, payment methods. Example - \"bofaach\"
  class ECheckConfigCommonProcessors
    # *EXISTING* Company (merchant) defined description of entry to receive.  For e.g. PAYROLL, GAS BILL, INS PREM. This field is alphanumeric
    attr_accessor :company_entry_description

    # *EXISTING* company ID assigned to merchant by Acquiring bank. This field is alphanumeric
    attr_accessor :company_id

    # *EXISTING* Capture requests are grouped into a batch bound for your payment processor. The batch time can be identified by reading the last 2-digits as military time. E.g., <processor>_16 = your processing cutoff is 4PM PST. Please note if you are in a different location you may then need to convert time zone as well.
    attr_accessor :batch_group

    # *NEW* Accuity is the original validation service that checks the account/routing number for formatting issues. Used by WF and set to \"Yes\" unless told otherwise
    attr_accessor :enable_accuity_for_avs

    # *NEW*  Possible values: - ALWAYS
    attr_accessor :accuity_check_type

    # *Moved* When set to Yes we will automatically update transactions to a completed status X-number of days after the transaction comes through; if no failure notification is received. When set to No means we will not update transaction status in this manner. For BAMS/Bank of America merchants, they should be set to No unless we are explicitly asked to set a merchant to YES.
    attr_accessor :set_completed_state

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'company_entry_description' => :'companyEntryDescription',
        :'company_id' => :'companyId',
        :'batch_group' => :'batchGroup',
        :'enable_accuity_for_avs' => :'enableAccuityForAvs',
        :'accuity_check_type' => :'accuityCheckType',
        :'set_completed_state' => :'setCompletedState'
      }
    end

    # Attribute mapping from JSON key to ruby-style variable name.
    def self.json_map
      {
        :'company_entry_description' => :'company_entry_description',
        :'company_id' => :'company_id',
        :'batch_group' => :'batch_group',
        :'enable_accuity_for_avs' => :'enable_accuity_for_avs',
        :'accuity_check_type' => :'accuity_check_type',
        :'set_completed_state' => :'set_completed_state'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'company_entry_description' => :'String',
        :'company_id' => :'String',
        :'batch_group' => :'String',
        :'enable_accuity_for_avs' => :'BOOLEAN',
        :'accuity_check_type' => :'String',
        :'set_completed_state' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'companyEntryDescription')
        self.company_entry_description = attributes[:'companyEntryDescription']
      end

      if attributes.has_key?(:'companyId')
        self.company_id = attributes[:'companyId']
      end

      if attributes.has_key?(:'batchGroup')
        self.batch_group = attributes[:'batchGroup']
      end

      if attributes.has_key?(:'enableAccuityForAvs')
        self.enable_accuity_for_avs = attributes[:'enableAccuityForAvs']
      else
        self.enable_accuity_for_avs = true
      end

      if attributes.has_key?(:'accuityCheckType')
        self.accuity_check_type = attributes[:'accuityCheckType']
      else
        self.accuity_check_type = 'ALWAYS'
      end

      if attributes.has_key?(:'setCompletedState')
        self.set_completed_state = attributes[:'setCompletedState']
      else
        self.set_completed_state = false
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @company_entry_description.nil?
        invalid_properties.push('invalid value for "company_entry_description", company_entry_description cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @company_entry_description.nil?
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] company_entry_description Value to be assigned
    def company_entry_description=(company_entry_description)
      #if company_entry_description.nil?
        #fail ArgumentError, 'company_entry_description cannot be nil'
      #end

      @company_entry_description = company_entry_description
    end

    # Custom attribute writer method with validation
    # @param [Object] company_id Value to be assigned
    def company_id=(company_id)
      @company_id = company_id
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          company_entry_description == o.company_entry_description &&
          company_id == o.company_id &&
          batch_group == o.batch_group &&
          enable_accuity_for_avs == o.enable_accuity_for_avs &&
          accuity_check_type == o.accuity_check_type &&
          set_completed_state == o.set_completed_state
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [company_entry_description, company_id, batch_group, enable_accuity_for_avs, accuity_check_type, set_completed_state].hash
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
