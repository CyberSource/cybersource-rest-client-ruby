=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.38
=end

require 'date'

module CyberSource
  class PtsV2PaymentsPost201ResponsePaymentInformationAccountFeatures
    # Type of account. This value is returned only if you requested a balance inquiry. Possible values:   - `00`: Not applicable or not specified  - `10`: Savings account  - `20`: Checking account  - `30`: Credit card account  - `40`: Universal account  #### PIN debit Type of account. This value is returned only if you requested a balance inquiry.  Possible values: - `00`: Not applicable or not specified - `10`: Savings account - `20`: Checking account - `40`: Universal account - `96`: Cash benefits account - `98`: Food stamp account  Returned by PIN debit purchase. 
    attr_accessor :account_type

    # Possible values: - `N`: Nonregulated - `R`: Regulated  Returned by PIN debit credit or PIN debit purchase.  **Note** This field is returned only for CyberSource through VisaNet. 
    attr_accessor :account_status

    # This is an array of multiple balances information an issuer can return for a given card.
    attr_accessor :balances

    # Remaining balance on the account.  Returned by authorization service.  #### PIN debit Remaining balance on the prepaid card.  Returned by PIN debit purchase. 
    attr_accessor :balance_amount

    # Type of amount. This value is returned only if you requested a balance inquiry. The issuer determines the value that is returned. Possible values for deposit accounts:   - `01`: Current ledger (posted) balance.  - `02`: Current available balance, which is typically the ledger balance less outstanding authorizations.  Some depository institutions also include pending deposits and the credit or overdraft line associated with the account. Possible values for credit card accounts:   - `01`: Credit amount remaining for customer (open to buy).  - `02`: Credit limit. 
    attr_accessor :balance_amount_type

    # Currency of the remaining balance on the account. For the possible values, see the [ISO Standard Currency Codes.](http://apps.cybersource.com/library/documentation/sbc/quickref/currencies.pdf)  Returned by authorization service.  #### PIN debit Currency of the remaining balance on the prepaid card.  Returned by PIN debit purchase. 
    attr_accessor :currency

    # Sign for the remaining balance on the account. Returned only when the processor returns this value. Possible values:  Possible values: - `Positive` - `Negative`  #### PIN debit Sign for the remaining balance on the prepaid card. Returned only when the processor returns this value.  Returned by PIN debit purchase. 
    attr_accessor :balance_sign

    # **Chase Paymentech Solutions**  Indicates whether a customer has high credit limits. This information enables you to market high cost items to these customers and to understand the kinds of cards that high income customers are using.  This field is supported for Visa, Mastercard, Discover, and Diners Club. Possible values:   - `Y`: Yes  - `N`: No  - `X`: Not applicable / Unknown  #### Litle  Flag that indicates that a Visa cardholder or Mastercard cardholder is in one of the affluent categories. Possible values:   - `AFFLUENT`: High income customer with high spending pattern (>100k USD annual income and >40k USD annual    card usage).  - `MASS AFFLUENT`: High income customer (>100k USD annual income).   Maximum length is 13.  #### Chase Paymentech Solutions  Maximum length is 1. 
    attr_accessor :affluence_indicator

    # #### GPX Mastercard product ID associated with the primary account number (PAN). Returned by authorization service.  #### CyberSource through VisaNet Visa or Mastercard product ID that is associated with the primary account number (PAN). For descriptions of the Visa product IDs, see the Product ID table on the [Visa Request & Response Codes web page.](https://developer.visa.com/guides/request_response_codes)  Data Length: String (3)  #### GPN Visa or Mastercard product ID that is associated with the primary account number (PAN). For descriptions of the Visa product IDs, see the Product ID table on the [Visa Request & Response Codes web page.](https://developer.visa.com/guides/request_response_codes)  Data Length: String (3)  #### Worldpay VAP **Important** Before using this field on Worldpay VAP, you must contact CyberSource Customer Support to have your account configured for this feature.  Type of card used in the transaction. The only possible value is: - `PREPAID`: Prepaid Card  Data Length: String (7)  #### RBS WorldPay Atlanta Type of card used in the transaction. Possible values: - `B`: Business Card - `O`: Noncommercial Card - `R`: Corporate Card - `S`: Purchase Card - `Blank`: Purchase card not supported  Data Length: String (1) 
    attr_accessor :category

    # Indicates whether the card is a commercial card, which enables you to include Level II data in your transaction requests. This field is supported for Visa and Mastercard on **Chase Paymentech Solutions**. Possible values:   - `Y`: Yes  - `N`: No  - `X`: Not applicable / Unknown 
    attr_accessor :commercial

    # Type of commercial card. This field is supported only for CyberSource through VisaNet. Possible values:   - `B`: Business card  - `R`: Corporate card  - `S`: Purchasing card  - `0`: Noncommercial card  Returned by authorization service. 
    attr_accessor :group

    # Indicates whether the card is a healthcare card. This field is supported for Visa and Mastercard on **Chase Paymentech Solutions**. Possible values:   - `Y`: Yes  - `N`: No  - `X`: Not applicable / Unknown 
    attr_accessor :health_care

    # Indicates whether the card is a payroll card. This field is supported for Visa, Discover, Diners Club, and JCB on **Chase Paymentech Solutions**. Possible values:   - `Y`: Yes  - `N`: No  - `X`: Not applicable / Unknown 
    attr_accessor :payroll

    # Indicates whether the card is eligible for Level III interchange fees, which enables you to include Level III data in your transaction requests. This field is supported for Visa and Mastercard on **Chase Paymentech Solutions**. Possible values:   - `Y`: Yes  - `N`: No  - `X`: Not applicable / Unknown 
    attr_accessor :level3_eligible

    # Indicates whether the card is a PINless debit card. This field is supported for Visa and Mastercard on **Chase Paymentech Solutions**. Possible values:   - `Y`: Yes  - `N`: No  - `X`: Not applicable / Unknown 
    attr_accessor :pinless_debit

    # Indicates whether the card is a signature debit card.  This information enables you to alter the way an order is processed. For example, you might not want to reauthorize a transaction for a signature debit card, or you might want to perform reversals promptly for a signature debit card. This field is supported for Visa, Mastercard, and Maestro (International) on Chase Paymentech Solutions. Possible values:   - `Y`: Yes  - `N`: No  - `X`: Not applicable / Unknown 
    attr_accessor :signature_debit

    # Indicates whether the card is a prepaid card. This information enables you to determine when a gift card or prepaid card is presented for use when establishing a new recurring, installment, or deferred billing relationship.  This field is supported for Visa, Mastercard, Discover, Diners Club, and JCB on Chase Paymentech Solutions. Possible values:   - `Y`: Yes  - `N`: No  - `X`: Not applicable / Unknown 
    attr_accessor :prepaid

    # Indicates whether the card is regulated according to the Durbin Amendment. If the card is regulated, the card issuer is subject to price caps and interchange rules. This field is supported for Visa, Mastercard, Discover, Diners Club, and JCB on Chase Paymentech Solutions. Possible values:   - `Y`: Yes  - `N`: No  - `X`: Not applicable / Unknown 
    attr_accessor :regulated

    # This is the account owner information, valid values are: - `01` : primary account holder - `02` : secondary account holder This is returned in the response of an account verification transaction by the Issuer.  
    attr_accessor :account_holder_type

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'account_type' => :'accountType',
        :'account_status' => :'accountStatus',
        :'balances' => :'balances',
        :'balance_amount' => :'balanceAmount',
        :'balance_amount_type' => :'balanceAmountType',
        :'currency' => :'currency',
        :'balance_sign' => :'balanceSign',
        :'affluence_indicator' => :'affluenceIndicator',
        :'category' => :'category',
        :'commercial' => :'commercial',
        :'group' => :'group',
        :'health_care' => :'healthCare',
        :'payroll' => :'payroll',
        :'level3_eligible' => :'level3Eligible',
        :'pinless_debit' => :'pinlessDebit',
        :'signature_debit' => :'signatureDebit',
        :'prepaid' => :'prepaid',
        :'regulated' => :'regulated',
        :'account_holder_type' => :'accountHolderType'
      }
    end

    # Attribute mapping from JSON key to ruby-style variable name.
    def self.json_map
      {
        :'account_type' => :'account_type',
        :'account_status' => :'account_status',
        :'balances' => :'balances',
        :'balance_amount' => :'balance_amount',
        :'balance_amount_type' => :'balance_amount_type',
        :'currency' => :'currency',
        :'balance_sign' => :'balance_sign',
        :'affluence_indicator' => :'affluence_indicator',
        :'category' => :'category',
        :'commercial' => :'commercial',
        :'group' => :'group',
        :'health_care' => :'health_care',
        :'payroll' => :'payroll',
        :'level3_eligible' => :'level3_eligible',
        :'pinless_debit' => :'pinless_debit',
        :'signature_debit' => :'signature_debit',
        :'prepaid' => :'prepaid',
        :'regulated' => :'regulated',
        :'account_holder_type' => :'account_holder_type'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'account_type' => :'String',
        :'account_status' => :'String',
        :'balances' => :'Array<PtsV2PaymentsPost201ResponsePaymentInformationAccountFeaturesBalances>',
        :'balance_amount' => :'String',
        :'balance_amount_type' => :'String',
        :'currency' => :'String',
        :'balance_sign' => :'String',
        :'affluence_indicator' => :'String',
        :'category' => :'String',
        :'commercial' => :'String',
        :'group' => :'String',
        :'health_care' => :'String',
        :'payroll' => :'String',
        :'level3_eligible' => :'String',
        :'pinless_debit' => :'String',
        :'signature_debit' => :'String',
        :'prepaid' => :'String',
        :'regulated' => :'String',
        :'account_holder_type' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'accountType')
        self.account_type = attributes[:'accountType']
      end

      if attributes.has_key?(:'accountStatus')
        self.account_status = attributes[:'accountStatus']
      end

      if attributes.has_key?(:'balances')
        if (value = attributes[:'balances']).is_a?(Array)
          self.balances = value
        end
      end

      if attributes.has_key?(:'balanceAmount')
        self.balance_amount = attributes[:'balanceAmount']
      end

      if attributes.has_key?(:'balanceAmountType')
        self.balance_amount_type = attributes[:'balanceAmountType']
      end

      if attributes.has_key?(:'currency')
        self.currency = attributes[:'currency']
      end

      if attributes.has_key?(:'balanceSign')
        self.balance_sign = attributes[:'balanceSign']
      end

      if attributes.has_key?(:'affluenceIndicator')
        self.affluence_indicator = attributes[:'affluenceIndicator']
      end

      if attributes.has_key?(:'category')
        self.category = attributes[:'category']
      end

      if attributes.has_key?(:'commercial')
        self.commercial = attributes[:'commercial']
      end

      if attributes.has_key?(:'group')
        self.group = attributes[:'group']
      end

      if attributes.has_key?(:'healthCare')
        self.health_care = attributes[:'healthCare']
      end

      if attributes.has_key?(:'payroll')
        self.payroll = attributes[:'payroll']
      end

      if attributes.has_key?(:'level3Eligible')
        self.level3_eligible = attributes[:'level3Eligible']
      end

      if attributes.has_key?(:'pinlessDebit')
        self.pinless_debit = attributes[:'pinlessDebit']
      end

      if attributes.has_key?(:'signatureDebit')
        self.signature_debit = attributes[:'signatureDebit']
      end

      if attributes.has_key?(:'prepaid')
        self.prepaid = attributes[:'prepaid']
      end

      if attributes.has_key?(:'regulated')
        self.regulated = attributes[:'regulated']
      end

      if attributes.has_key?(:'accountHolderType')
        self.account_holder_type = attributes[:'accountHolderType']
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
    # @param [Object] account_type Value to be assigned
    def account_type=(account_type)
      @account_type = account_type
    end

    # Custom attribute writer method with validation
    # @param [Object] account_status Value to be assigned
    def account_status=(account_status)
      @account_status = account_status
    end

    # Custom attribute writer method with validation
    # @param [Object] balance_amount Value to be assigned
    def balance_amount=(balance_amount)
      @balance_amount = balance_amount
    end

    # Custom attribute writer method with validation
    # @param [Object] balance_amount_type Value to be assigned
    def balance_amount_type=(balance_amount_type)
      @balance_amount_type = balance_amount_type
    end

    # Custom attribute writer method with validation
    # @param [Object] currency Value to be assigned
    def currency=(currency)
      @currency = currency
    end

    # Custom attribute writer method with validation
    # @param [Object] balance_sign Value to be assigned
    def balance_sign=(balance_sign)
      @balance_sign = balance_sign
    end

    # Custom attribute writer method with validation
    # @param [Object] affluence_indicator Value to be assigned
    def affluence_indicator=(affluence_indicator)
      @affluence_indicator = affluence_indicator
    end

    # Custom attribute writer method with validation
    # @param [Object] category Value to be assigned
    def category=(category)
      @category = category
    end

    # Custom attribute writer method with validation
    # @param [Object] commercial Value to be assigned
    def commercial=(commercial)
      @commercial = commercial
    end

    # Custom attribute writer method with validation
    # @param [Object] group Value to be assigned
    def group=(group)
      @group = group
    end

    # Custom attribute writer method with validation
    # @param [Object] health_care Value to be assigned
    def health_care=(health_care)
      @health_care = health_care
    end

    # Custom attribute writer method with validation
    # @param [Object] payroll Value to be assigned
    def payroll=(payroll)
      @payroll = payroll
    end

    # Custom attribute writer method with validation
    # @param [Object] level3_eligible Value to be assigned
    def level3_eligible=(level3_eligible)
      @level3_eligible = level3_eligible
    end

    # Custom attribute writer method with validation
    # @param [Object] pinless_debit Value to be assigned
    def pinless_debit=(pinless_debit)
      @pinless_debit = pinless_debit
    end

    # Custom attribute writer method with validation
    # @param [Object] signature_debit Value to be assigned
    def signature_debit=(signature_debit)
      @signature_debit = signature_debit
    end

    # Custom attribute writer method with validation
    # @param [Object] prepaid Value to be assigned
    def prepaid=(prepaid)
      @prepaid = prepaid
    end

    # Custom attribute writer method with validation
    # @param [Object] regulated Value to be assigned
    def regulated=(regulated)
      @regulated = regulated
    end

    # Custom attribute writer method with validation
    # @param [Object] account_holder_type Value to be assigned
    def account_holder_type=(account_holder_type)
      @account_holder_type = account_holder_type
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          account_type == o.account_type &&
          account_status == o.account_status &&
          balances == o.balances &&
          balance_amount == o.balance_amount &&
          balance_amount_type == o.balance_amount_type &&
          currency == o.currency &&
          balance_sign == o.balance_sign &&
          affluence_indicator == o.affluence_indicator &&
          category == o.category &&
          commercial == o.commercial &&
          group == o.group &&
          health_care == o.health_care &&
          payroll == o.payroll &&
          level3_eligible == o.level3_eligible &&
          pinless_debit == o.pinless_debit &&
          signature_debit == o.signature_debit &&
          prepaid == o.prepaid &&
          regulated == o.regulated &&
          account_holder_type == o.account_holder_type
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [account_type, account_status, balances, balance_amount, balance_amount_type, currency, balance_sign, affluence_indicator, category, commercial, group, health_care, payroll, level3_eligible, pinless_debit, signature_debit, prepaid, regulated, account_holder_type].hash
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
