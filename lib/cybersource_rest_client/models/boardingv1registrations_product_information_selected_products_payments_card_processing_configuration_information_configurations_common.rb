=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'date'

module CyberSource
  class Boardingv1registrationsProductInformationSelectedProductsPaymentsCardProcessingConfigurationInformationConfigurationsCommon
    # e.g. * amexdirect * barclays2 * CUP * EFTPOS * fdiglobal * gpx * smartfdc * tsys * vero * VPC  For VPC, CUP and EFTPOS processors, replace the processor name from VPC or CUP or EFTPOS to the actual processor name in the sample request. e.g. replace VPC with &lt;your vpc processor&gt; 
    attr_accessor :processors

    # Vendor code assigned by American Express. Applicable for TSYS (tsys) processor.
    attr_accessor :amex_vendor_code

    # Authorization Finality indicator. Please note that the input can be in small case or capitals but response is in small case as of now. It will be made capitals everywhere in the next version. Applicable for Elavon Americas (elavonamericas), TSYS (tsys), Barclays (barclays2), Streamline (streamline2), Six (six), Barclays HISO (barclayshiso), GPN (gpn), FDI Global (fdiglobal), GPX (gpx), Paymentech Tampa (paymentechtampa), FDC Nashville (smartfdc), VPC and Chase Paymentech Salem (chasepaymentechsalem) processors.  Validation details (for selected processors)...  <table> <thead><tr><th>Processor</th><th>Acceptance Type</th><th>Required</th><th>Default Value</th></tr></thead> <tr><td>Barclays</td><td>cnp, cp, hybrid</td><td>No</td><td>FINAL</td></tr> <tr><td>Barclays HISO</td><td>cnp, cp, hybrid</td><td>Yes</td><td>FINAL</td></tr> </table> 
    attr_accessor :default_auth_type_code

    # MAID aka MasterCard assigned ID, MasterCard equivalent of Merchant Verification Value by Visa. Applicable for VPC, GPX (gpx) and FDI Global (fdiglobal) processors.
    attr_accessor :master_card_assigned_id

    # Allow merchants to accept partial authorization approvals. Applicable for Elavon Americas (elavonamericas), VPC, GPX (gpx), FDI Global (fdiglobal), FDC Nashville (smartfdc), GPN (gpn), TSYS (tsys), American Express Direct (amexdirect), Paymentech Tampa (paymentechtampa) and Chase Paymentech Salem (chasepaymentechsalem) processors.  Validation details (for selected processors)...  <table> <thead><tr><th>Processor</th><th>Acceptance Type</th><th>Required</th><th>Default Value</th></tr></thead> <tr><td>American Express Direct</td><td>cnp, cp, hybrid</td><td>No</td><td>No</td></tr> </table> 
    attr_accessor :enable_partial_auth

    # Indicates type of business product or service of the merchant. Applicable for Chase Paymentech Salem (chasepaymentechsalem), FDI Global (fdiglobal), RUPAY, Elavon Americas (elavonamericas), American Express Direct (amexdirect), CMCIC (cmcic), GPX (gpx), VPC, TSYS (tsys), EFTPOS, CUP, Paymentech Tampa (paymentechtampa), CB2A, Barclays (barclays2), Prisma (prisma) and GPN (gpn) processors.  Validation details (for selected processors)...  <table> <thead><tr><th>Processor</th><th>Acceptance Type</th><th>Required</th><th>Min. Length</th><th>Max. Length</th><th>Regex</th></tr></thead> <tr><td>Barclays</td><td>cnp</td><td>No</td><td>4</td><td>4</td><td>^[0-9]+$</td></tr> <tr><td>American Express Direct</td><td>cnp, cp, hybrid</td><td>Yes</td><td>4</td><td>4</td><td>^[0-9]+$</td></tr> </table> 
    attr_accessor :merchant_category_code

    # The Standard Industrial Classification (SIC) are four-digit codes that categorize the industries that companies belong to based on their business activities. Standard Industrial Classification codes were mostly replaced by the six-digit North American Industry Classification System (NAICS). Applicable for VPC and GPX (gpx) processors.
    attr_accessor :sic_code

    # Food and Consumer Service ID. Identifies the merchant as being certified and approved to accept Food Stamps. Applicable for GPX (gpx) processor.
    attr_accessor :food_and_consumer_service_id

    # Enables you to split an order into multiple shipments with multiple captures. This feature is provided by CyberSource and supports three different scenarios:  * multiple authorizations * multiple captures * multiple authorizations with multiple captures  Applicable for VPC processors. 
    attr_accessor :enable_split_shipment

    # Reduces your interchange fees by using automatic authorization refresh and automatic partial authorization reversal. Applicable for VPC processors.
    attr_accessor :enable_interchange_optimization

    # Identifier provided to merchants who opt for Visa’s delegated authorization program. Applicable for VPC processors.
    attr_accessor :visa_delegated_authentication_id

    # Blocks over-refunds when the aggregated refund amount is higher than the percentage set for this field. Applicable for GPX (gpx), VPC and Chase Paymentech Salem (chasepaymentechsalem) processors.
    attr_accessor :credit_card_refund_limit_percent

    # Limits refunds to the percentage set in this field. Applicable for GPX (gpx) and VPC processors.
    attr_accessor :business_center_credit_card_refund_limit_percent

    # Enables this merchant account to capture amounts greater than the authorization amount. Applicable for GPX (gpx), VPC, Paymentech Tampa (paymentechtampa) and Chase Paymentech Salem (chasepaymentechsalem) processors.
    attr_accessor :allow_captures_greater_than_authorizations

    # Helps prevent duplicate transactions. Applicable for VPC, GPX (gpx) and Chase Paymentech Salem (chasepaymentechsalem) processors.
    attr_accessor :enable_duplicate_merchant_reference_number_blocking

    # This is a local merchant ID used by merchants in addition to the conventional merchant ID. This value is sent to the issuer. Applicable for VPC and Prisma (prisma) processors.
    attr_accessor :domestic_merchant_id

    # Indicates whether merchant processes Level 3 transactions. Applicable for TSYS (tsys), Barclays (barclays2), Paymentech Tampa (paymentechtampa), FDI Global (fdiglobal), Elavon Americas (elavonamericas) and Chase Paymentech Salem (chasepaymentechsalem) processors.  Validation details (for selected processors)...  <table> <thead><tr><th>Processor</th><th>Acceptance Type</th><th>Required</th></tr></thead> <tr><td>Barclays</td><td>cnp</td><td>No</td></tr> </table> 
    attr_accessor :process_level3_data

    # The ID assigned to the sub-merchant. Applicable for American Express Direct (amexdirect) processor.  Validation details (for selected processors)...  <table> <thead><tr><th>Processor</th><th>Acceptance Type</th><th>Required</th><th>Min. Length</th><th>Max. Length</th><th>Regex</th></tr></thead> <tr><td>American Express Direct</td><td>cnp, cp, hybrid</td><td>No</td><td>1</td><td>20</td><td>^[0-9a-zA-Z&#92;-&#92;_&#92;,\\s.]+$</td></tr> </table> 
    attr_accessor :sub_merchant_id

    # Sub-merchant's business name. Applicable for American Express Direct (amexdirect) processor.  Validation details (for selected processors)...  <table> <thead><tr><th>Processor</th><th>Acceptance Type</th><th>Required</th><th>Min. Length</th><th>Max. Length</th><th>Regex</th></tr></thead> <tr><td>American Express Direct</td><td>cnp, cp, hybrid</td><td>No</td><td>1</td><td>37</td><td>^[0-9a-zA-Z&#92;-&#92;_&#92;,\\s.]+$</td></tr> </table> 
    attr_accessor :sub_merchant_business_name

    # It denotes merchant's preference on secondary brand for routing in case of co-branded cards. Applicable for EFTPOS processors.
    attr_accessor :prefer_cobadged_secondary_brand

    attr_accessor :merchant_descriptor_information

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'processors' => :'processors',
        :'amex_vendor_code' => :'amexVendorCode',
        :'default_auth_type_code' => :'defaultAuthTypeCode',
        :'master_card_assigned_id' => :'masterCardAssignedId',
        :'enable_partial_auth' => :'enablePartialAuth',
        :'merchant_category_code' => :'merchantCategoryCode',
        :'sic_code' => :'sicCode',
        :'food_and_consumer_service_id' => :'foodAndConsumerServiceId',
        :'enable_split_shipment' => :'enableSplitShipment',
        :'enable_interchange_optimization' => :'enableInterchangeOptimization',
        :'visa_delegated_authentication_id' => :'visaDelegatedAuthenticationId',
        :'credit_card_refund_limit_percent' => :'creditCardRefundLimitPercent',
        :'business_center_credit_card_refund_limit_percent' => :'businessCenterCreditCardRefundLimitPercent',
        :'allow_captures_greater_than_authorizations' => :'allowCapturesGreaterThanAuthorizations',
        :'enable_duplicate_merchant_reference_number_blocking' => :'enableDuplicateMerchantReferenceNumberBlocking',
        :'domestic_merchant_id' => :'domesticMerchantId',
        :'process_level3_data' => :'processLevel3Data',
        :'sub_merchant_id' => :'subMerchantId',
        :'sub_merchant_business_name' => :'subMerchantBusinessName',
        :'prefer_cobadged_secondary_brand' => :'preferCobadgedSecondaryBrand',
        :'merchant_descriptor_information' => :'merchantDescriptorInformation'
      }
    end

    # Attribute mapping from JSON key to ruby-style variable name.
    def self.json_map
      {
        :'processors' => :'processors',
        :'amex_vendor_code' => :'amex_vendor_code',
        :'default_auth_type_code' => :'default_auth_type_code',
        :'master_card_assigned_id' => :'master_card_assigned_id',
        :'enable_partial_auth' => :'enable_partial_auth',
        :'merchant_category_code' => :'merchant_category_code',
        :'sic_code' => :'sic_code',
        :'food_and_consumer_service_id' => :'food_and_consumer_service_id',
        :'enable_split_shipment' => :'enable_split_shipment',
        :'enable_interchange_optimization' => :'enable_interchange_optimization',
        :'visa_delegated_authentication_id' => :'visa_delegated_authentication_id',
        :'credit_card_refund_limit_percent' => :'credit_card_refund_limit_percent',
        :'business_center_credit_card_refund_limit_percent' => :'business_center_credit_card_refund_limit_percent',
        :'allow_captures_greater_than_authorizations' => :'allow_captures_greater_than_authorizations',
        :'enable_duplicate_merchant_reference_number_blocking' => :'enable_duplicate_merchant_reference_number_blocking',
        :'domestic_merchant_id' => :'domestic_merchant_id',
        :'process_level3_data' => :'process_level3_data',
        :'sub_merchant_id' => :'sub_merchant_id',
        :'sub_merchant_business_name' => :'sub_merchant_business_name',
        :'prefer_cobadged_secondary_brand' => :'prefer_cobadged_secondary_brand',
        :'merchant_descriptor_information' => :'merchant_descriptor_information'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'processors' => :'Hash<String, Boardingv1registrationsProductInformationSelectedProductsPaymentsCardProcessingConfigurationInformationConfigurationsCommonProcessors>',
        :'amex_vendor_code' => :'String',
        :'default_auth_type_code' => :'String',
        :'master_card_assigned_id' => :'String',
        :'enable_partial_auth' => :'BOOLEAN',
        :'merchant_category_code' => :'String',
        :'sic_code' => :'String',
        :'food_and_consumer_service_id' => :'String',
        :'enable_split_shipment' => :'BOOLEAN',
        :'enable_interchange_optimization' => :'BOOLEAN',
        :'visa_delegated_authentication_id' => :'String',
        :'credit_card_refund_limit_percent' => :'String',
        :'business_center_credit_card_refund_limit_percent' => :'String',
        :'allow_captures_greater_than_authorizations' => :'BOOLEAN',
        :'enable_duplicate_merchant_reference_number_blocking' => :'BOOLEAN',
        :'domestic_merchant_id' => :'BOOLEAN',
        :'process_level3_data' => :'String',
        :'sub_merchant_id' => :'String',
        :'sub_merchant_business_name' => :'String',
        :'prefer_cobadged_secondary_brand' => :'BOOLEAN',
        :'merchant_descriptor_information' => :'Boardingv1registrationsProductInformationSelectedProductsPaymentsCardProcessingConfigurationInformationConfigurationsCommonMerchantDescriptorInformation'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'processors')
        if (value = attributes[:'processors']).is_a?(Hash)
          self.processors = value
        end
      end

      if attributes.has_key?(:'amexVendorCode')
        self.amex_vendor_code = attributes[:'amexVendorCode']
      end

      if attributes.has_key?(:'defaultAuthTypeCode')
        self.default_auth_type_code = attributes[:'defaultAuthTypeCode']
      end

      if attributes.has_key?(:'masterCardAssignedId')
        self.master_card_assigned_id = attributes[:'masterCardAssignedId']
      end

      if attributes.has_key?(:'enablePartialAuth')
        self.enable_partial_auth = attributes[:'enablePartialAuth']
      end

      if attributes.has_key?(:'merchantCategoryCode')
        self.merchant_category_code = attributes[:'merchantCategoryCode']
      end

      if attributes.has_key?(:'sicCode')
        self.sic_code = attributes[:'sicCode']
      end

      if attributes.has_key?(:'foodAndConsumerServiceId')
        self.food_and_consumer_service_id = attributes[:'foodAndConsumerServiceId']
      end

      if attributes.has_key?(:'enableSplitShipment')
        self.enable_split_shipment = attributes[:'enableSplitShipment']
      end

      if attributes.has_key?(:'enableInterchangeOptimization')
        self.enable_interchange_optimization = attributes[:'enableInterchangeOptimization']
      end

      if attributes.has_key?(:'visaDelegatedAuthenticationId')
        self.visa_delegated_authentication_id = attributes[:'visaDelegatedAuthenticationId']
      end

      if attributes.has_key?(:'creditCardRefundLimitPercent')
        self.credit_card_refund_limit_percent = attributes[:'creditCardRefundLimitPercent']
      end

      if attributes.has_key?(:'businessCenterCreditCardRefundLimitPercent')
        self.business_center_credit_card_refund_limit_percent = attributes[:'businessCenterCreditCardRefundLimitPercent']
      end

      if attributes.has_key?(:'allowCapturesGreaterThanAuthorizations')
        self.allow_captures_greater_than_authorizations = attributes[:'allowCapturesGreaterThanAuthorizations']
      end

      if attributes.has_key?(:'enableDuplicateMerchantReferenceNumberBlocking')
        self.enable_duplicate_merchant_reference_number_blocking = attributes[:'enableDuplicateMerchantReferenceNumberBlocking']
      end

      if attributes.has_key?(:'domesticMerchantId')
        self.domestic_merchant_id = attributes[:'domesticMerchantId']
      end

      if attributes.has_key?(:'processLevel3Data')
        self.process_level3_data = attributes[:'processLevel3Data']
      end

      if attributes.has_key?(:'subMerchantId')
        self.sub_merchant_id = attributes[:'subMerchantId']
      end

      if attributes.has_key?(:'subMerchantBusinessName')
        self.sub_merchant_business_name = attributes[:'subMerchantBusinessName']
      end

      if attributes.has_key?(:'preferCobadgedSecondaryBrand')
        self.prefer_cobadged_secondary_brand = attributes[:'preferCobadgedSecondaryBrand']
      end

      if attributes.has_key?(:'merchantDescriptorInformation')
        self.merchant_descriptor_information = attributes[:'merchantDescriptorInformation']
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
      default_auth_type_code_validator = EnumAttributeValidator.new('String', ['PRE', 'FINAL', 'UNDEFINED'])
      return false unless default_auth_type_code_validator.valid?(@default_auth_type_code)
      true
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] default_auth_type_code Object to be assigned
    def default_auth_type_code=(default_auth_type_code)
      validator = EnumAttributeValidator.new('String', ['PRE', 'FINAL', 'UNDEFINED'])
      unless validator.valid?(default_auth_type_code)
        fail ArgumentError, 'invalid value for "default_auth_type_code", must be one of #{validator.allowable_values}.'
      end
      @default_auth_type_code = default_auth_type_code
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          processors == o.processors &&
          amex_vendor_code == o.amex_vendor_code &&
          default_auth_type_code == o.default_auth_type_code &&
          master_card_assigned_id == o.master_card_assigned_id &&
          enable_partial_auth == o.enable_partial_auth &&
          merchant_category_code == o.merchant_category_code &&
          sic_code == o.sic_code &&
          food_and_consumer_service_id == o.food_and_consumer_service_id &&
          enable_split_shipment == o.enable_split_shipment &&
          enable_interchange_optimization == o.enable_interchange_optimization &&
          visa_delegated_authentication_id == o.visa_delegated_authentication_id &&
          credit_card_refund_limit_percent == o.credit_card_refund_limit_percent &&
          business_center_credit_card_refund_limit_percent == o.business_center_credit_card_refund_limit_percent &&
          allow_captures_greater_than_authorizations == o.allow_captures_greater_than_authorizations &&
          enable_duplicate_merchant_reference_number_blocking == o.enable_duplicate_merchant_reference_number_blocking &&
          domestic_merchant_id == o.domestic_merchant_id &&
          process_level3_data == o.process_level3_data &&
          sub_merchant_id == o.sub_merchant_id &&
          sub_merchant_business_name == o.sub_merchant_business_name &&
          prefer_cobadged_secondary_brand == o.prefer_cobadged_secondary_brand &&
          merchant_descriptor_information == o.merchant_descriptor_information
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [processors, amex_vendor_code, default_auth_type_code, master_card_assigned_id, enable_partial_auth, merchant_category_code, sic_code, food_and_consumer_service_id, enable_split_shipment, enable_interchange_optimization, visa_delegated_authentication_id, credit_card_refund_limit_percent, business_center_credit_card_refund_limit_percent, allow_captures_greater_than_authorizations, enable_duplicate_merchant_reference_number_blocking, domestic_merchant_id, process_level3_data, sub_merchant_id, sub_merchant_business_name, prefer_cobadged_secondary_brand, merchant_descriptor_information].hash
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