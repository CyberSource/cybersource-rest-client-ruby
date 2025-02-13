=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'date'

module CyberSource
  class TssV2TransactionsGet200ResponseProcessingInformationJapanPaymentOptions
    # This value is a 2-digit code indicating the payment method. Use Payment Method Code value that applies to the tranasction. - 10 (One-time payment) - 21, 22, 23, 24  (Bonus(one-time)payment) - 61 (Installment payment) - 31, 32, 33, 34  (Integrated (Bonus + Installment)payment) - 80 (Revolving payment) 
    attr_accessor :payment_method

    # Unique Japan Credit Card Association (JCCA) terminal identifier.  The difference between this field and the `pointOfSaleInformation.terminalID` field is that you can define `pointOfSaleInformation.terminalID`, but `processingInformation.japanPaymentOptions.terminalId` is defined by the JCCA and is used only in Japan.  This field is supported only on CyberSource through VisaNet and JCN Gateway.  Optional field. 
    attr_accessor :terminal_id

    # Business name in Japanese characters. This field is supported only on JCN Gateway and for the Sumitomo Mitsui Card Co. acquirer on CyberSource through VisaNet. 
    attr_accessor :business_name

    # Business name in Katakana characters. This field is supported only on JCN Gateway and for the Sumitomo Mitsui Card Co. acquirer on CyberSource through VisaNet. 
    attr_accessor :business_name_katakana

    # Business name in English characters. This field is supported only on JCN Gateway and for the Sumitomo Mitsui Card Co. acquirer on CyberSource through VisaNet. 
    attr_accessor :business_name_english

    # An array of objects, each of which contains a bonus month and bonus amount.  Length of bonuses array is equal to the number of bonuses.  Max length = 6.  In case of bonus month and amount not specified, null objects to be returned in the array. Example: bonuses : [ {\"month\": \"1\",\"amount\": \"200\"}, {\"month\": \"3\",\"amount\": \"2500\"}, null] 
    attr_accessor :bonuses

    # Billing month in MM format. 
    attr_accessor :first_billing_month

    # Number of Installments. 
    attr_accessor :number_of_installments

    # This will contain the details of the kind of transaction that has been processe. Used only for Japan. Possible Values: - 0 = Normal (authorization with amount and clearing/settlement; data capture or paper draft) - 1 = Negative card authorization (authorization-only with 0 or 1 amount) - 2 = Reservation of authorization (authorization-only with amount) - 3 = Cancel transaction - 4 = Merchant-initiated reversal/refund transactions - 5 = Cancel reservation of authorization - 6 = Post authorization 
    attr_accessor :pre_approval_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'payment_method' => :'paymentMethod',
        :'terminal_id' => :'terminalId',
        :'business_name' => :'businessName',
        :'business_name_katakana' => :'businessNameKatakana',
        :'business_name_english' => :'businessNameEnglish',
        :'bonuses' => :'bonuses',
        :'first_billing_month' => :'firstBillingMonth',
        :'number_of_installments' => :'numberOfInstallments',
        :'pre_approval_type' => :'preApprovalType'
      }
    end

    # Attribute mapping from JSON key to ruby-style variable name.
    def self.json_map
      {
        :'payment_method' => :'payment_method',
        :'terminal_id' => :'terminal_id',
        :'business_name' => :'business_name',
        :'business_name_katakana' => :'business_name_katakana',
        :'business_name_english' => :'business_name_english',
        :'bonuses' => :'bonuses',
        :'first_billing_month' => :'first_billing_month',
        :'number_of_installments' => :'number_of_installments',
        :'pre_approval_type' => :'pre_approval_type'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'payment_method' => :'String',
        :'terminal_id' => :'String',
        :'business_name' => :'String',
        :'business_name_katakana' => :'String',
        :'business_name_english' => :'String',
        :'bonuses' => :'Array<Ptsv2paymentsProcessingInformationJapanPaymentOptionsBonuses>',
        :'first_billing_month' => :'String',
        :'number_of_installments' => :'String',
        :'pre_approval_type' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'paymentMethod')
        self.payment_method = attributes[:'paymentMethod']
      end

      if attributes.has_key?(:'terminalId')
        self.terminal_id = attributes[:'terminalId']
      end

      if attributes.has_key?(:'businessName')
        self.business_name = attributes[:'businessName']
      end

      if attributes.has_key?(:'businessNameKatakana')
        self.business_name_katakana = attributes[:'businessNameKatakana']
      end

      if attributes.has_key?(:'businessNameEnglish')
        self.business_name_english = attributes[:'businessNameEnglish']
      end

      if attributes.has_key?(:'bonuses')
        if (value = attributes[:'bonuses']).is_a?(Array)
          self.bonuses = value
        end
      end

      if attributes.has_key?(:'firstBillingMonth')
        self.first_billing_month = attributes[:'firstBillingMonth']
      end

      if attributes.has_key?(:'numberOfInstallments')
        self.number_of_installments = attributes[:'numberOfInstallments']
      end

      if attributes.has_key?(:'preApprovalType')
        self.pre_approval_type = attributes[:'preApprovalType']
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
    # @param [Object] payment_method Value to be assigned
    def payment_method=(payment_method)
      @payment_method = payment_method
    end

    # Custom attribute writer method with validation
    # @param [Object] terminal_id Value to be assigned
    def terminal_id=(terminal_id)
      @terminal_id = terminal_id
    end

    # Custom attribute writer method with validation
    # @param [Object] business_name Value to be assigned
    def business_name=(business_name)
      @business_name = business_name
    end

    # Custom attribute writer method with validation
    # @param [Object] business_name_katakana Value to be assigned
    def business_name_katakana=(business_name_katakana)
      @business_name_katakana = business_name_katakana
    end

    # Custom attribute writer method with validation
    # @param [Object] business_name_english Value to be assigned
    def business_name_english=(business_name_english)
      @business_name_english = business_name_english
    end

    # Custom attribute writer method with validation
    # @param [Object] first_billing_month Value to be assigned
    def first_billing_month=(first_billing_month)
      @first_billing_month = first_billing_month
    end

    # Custom attribute writer method with validation
    # @param [Object] pre_approval_type Value to be assigned
    def pre_approval_type=(pre_approval_type)
      @pre_approval_type = pre_approval_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          payment_method == o.payment_method &&
          terminal_id == o.terminal_id &&
          business_name == o.business_name &&
          business_name_katakana == o.business_name_katakana &&
          business_name_english == o.business_name_english &&
          bonuses == o.bonuses &&
          first_billing_month == o.first_billing_month &&
          number_of_installments == o.number_of_installments &&
          pre_approval_type == o.pre_approval_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [payment_method, terminal_id, business_name, business_name_katakana, business_name_english, bonuses, first_billing_month, number_of_installments, pre_approval_type].hash
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
