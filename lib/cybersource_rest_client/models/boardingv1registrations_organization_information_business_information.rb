=begin
#CyberSource Merged Spec

#All CyberSource API specs merged together. These are available at https://developer.cybersource.com/api/reference/api-reference.html

OpenAPI spec version: 0.0.1

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.2.3

=end

require 'date'

module CyberSource
  class Boardingv1registrationsOrganizationInformationBusinessInformation
    attr_accessor :name

    attr_accessor :doing_business_as

    attr_accessor :description

    # `Format: YYYY-MM-DD` Example 2016-08-11 equals August 11, 2016 
    attr_accessor :start_date

    attr_accessor :address

    # Merchant perferred time zone Possible Values: - 'Pacific/Pago_Pago' - 'Pacific/Honolulu' - 'America/Anchorage' - 'America/Vancouver' - 'America/Los_Angeles' - 'America/Phoenix' - 'America/Edmonton' - 'America/Denver' - 'America/Winnipeg' - 'America/Mexico_City' - 'America/Chicago' - 'America/Bogota' - 'America/Indianapolis' - 'America/New_York' - 'America/La_Paz' - 'America/Halifax' - 'America/St_Johns' - 'America/Buenos_Aires' - 'America/Godthab' - 'America/Sao_Paulo' - 'America/Noronha' - 'Atlantic/Cape_Verde' - 'GMT' - 'Europe/Dublin' - 'Europe/Lisbon' - 'Europe/London' - 'Africa/Tunis' - 'Europe/Vienna' - 'Europe/Brussels' - 'Europe/Zurich' - 'Europe/Prague' - 'Europe/Berlin' - 'Europe/Copenhagen' - 'Europe/Madrid' - 'Europe/Budapest' - 'Europe/Rome' - 'Africa/Tripoli' - 'Europe/Monaco' - 'Europe/Malta' - 'Europe/Amsterdam' - 'Europe/Oslo' - 'Europe/Warsaw' - 'Europe/Stockholm' - 'Europe/Belgrade' - 'Europe/Paris' - 'Africa/Johannesburg' - 'Europe/Minsk' - 'Africa/Cairo' - 'Europe/Helsinki' - 'Europe/Athens' - 'Asia/Jerusalem' - 'Europe/Riga' - 'Europe/Bucharest' - 'Europe/Istanbul' - 'Asia/Riyadh' - 'Europe/Moscow' - 'Asia/Dubai' - 'Asia/Baku' - 'Asia/Tbilisi' - 'Asia/Calcutta' - 'Asia/Katmandu' - 'Asia/Dacca' - 'Asia/Rangoon' - 'Asia/Jakarta' - 'Asia/Saigon' - 'Asia/Bangkok' - 'Australia/Perth' - 'Asia/Hong_Kong' - 'Asia/Macao' - 'Asia/Kuala_Lumpur' - 'Asia/Manila' - 'Asia/Singapore' - 'Asia/Taipei' - 'Asia/Shanghai' - 'Asia/Seoul' - 'Asia/Tokyo' - 'Asia/Yakutsk' - 'Australia/Adelaide' - 'Australia/Brisbane' - 'Australia/Broken_Hill' - 'Australia/Darwin' - 'Australia/Eucla' - 'Australia/Hobart' - 'Australia/Lindeman' - 'Australia/Sydney' - 'Australia/Lord_Howe' - 'Australia/Melbourne' - 'Asia/Magadan' - 'Pacific/Norfolk' - 'Pacific/Auckland' 
    attr_accessor :time_zone

    attr_accessor :website_url

    # Business type Possible Values:   - 'PARTNERSHIP'   - 'SOLE_PROPRIETORSHIP'   - 'CORPORATION'   - 'LLC'   - 'NON_PROFIT'   - 'TRUST' 
    attr_accessor :type

    attr_accessor :tax_id

    attr_accessor :phone_number

    attr_accessor :business_contact

    attr_accessor :technical_contact

    attr_accessor :emergency_contact

    # Industry standard Merchant Category Code (MCC)
    attr_accessor :merchant_category_code

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
        :'name' => :'name',
        :'doing_business_as' => :'doingBusinessAs',
        :'description' => :'description',
        :'start_date' => :'startDate',
        :'address' => :'address',
        :'time_zone' => :'timeZone',
        :'website_url' => :'websiteUrl',
        :'type' => :'type',
        :'tax_id' => :'taxId',
        :'phone_number' => :'phoneNumber',
        :'business_contact' => :'businessContact',
        :'technical_contact' => :'technicalContact',
        :'emergency_contact' => :'emergencyContact',
        :'merchant_category_code' => :'merchantCategoryCode'
      }
    end

    # Attribute mapping from JSON key to ruby-style variable name.
    def self.json_map
      {
        :'name' => :'name',
        :'doing_business_as' => :'doing_business_as',
        :'description' => :'description',
        :'start_date' => :'start_date',
        :'address' => :'address',
        :'time_zone' => :'time_zone',
        :'website_url' => :'website_url',
        :'type' => :'type',
        :'tax_id' => :'tax_id',
        :'phone_number' => :'phone_number',
        :'business_contact' => :'business_contact',
        :'technical_contact' => :'technical_contact',
        :'emergency_contact' => :'emergency_contact',
        :'merchant_category_code' => :'merchant_category_code'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'name' => :'String',
        :'doing_business_as' => :'String',
        :'description' => :'String',
        :'start_date' => :'Date',
        :'address' => :'Boardingv1registrationsOrganizationInformationBusinessInformationAddress',
        :'time_zone' => :'String',
        :'website_url' => :'String',
        :'type' => :'String',
        :'tax_id' => :'String',
        :'phone_number' => :'String',
        :'business_contact' => :'Boardingv1registrationsOrganizationInformationBusinessInformationBusinessContact',
        :'technical_contact' => :'Boardingv1registrationsOrganizationInformationBusinessInformationBusinessContact',
        :'emergency_contact' => :'Boardingv1registrationsOrganizationInformationBusinessInformationBusinessContact',
        :'merchant_category_code' => :'String'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.has_key?(:'doingBusinessAs')
        self.doing_business_as = attributes[:'doingBusinessAs']
      end

      if attributes.has_key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.has_key?(:'startDate')
        self.start_date = attributes[:'startDate']
      end

      if attributes.has_key?(:'address')
        self.address = attributes[:'address']
      end

      if attributes.has_key?(:'timeZone')
        self.time_zone = attributes[:'timeZone']
      end

      if attributes.has_key?(:'websiteUrl')
        self.website_url = attributes[:'websiteUrl']
      end

      if attributes.has_key?(:'type')
        self.type = attributes[:'type']
      end

      if attributes.has_key?(:'taxId')
        self.tax_id = attributes[:'taxId']
      end

      if attributes.has_key?(:'phoneNumber')
        self.phone_number = attributes[:'phoneNumber']
      end

      if attributes.has_key?(:'businessContact')
        self.business_contact = attributes[:'businessContact']
      end

      if attributes.has_key?(:'technicalContact')
        self.technical_contact = attributes[:'technicalContact']
      end

      if attributes.has_key?(:'emergencyContact')
        self.emergency_contact = attributes[:'emergencyContact']
      end

      if attributes.has_key?(:'merchantCategoryCode')
        self.merchant_category_code = attributes[:'merchantCategoryCode']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if @name.nil?
        invalid_properties.push('invalid value for "name", name cannot be nil.')
      end

      #if @name !~ Regexp.new(/^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/)
        #invalid_properties.push('invalid value for "name", must conform to the pattern /^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/.')
      #end

      #if !@doing_business_as.nil? && @doing_business_as !~ Regexp.new(/^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/)
        #invalid_properties.push('invalid value for "doing_business_as", must conform to the pattern /^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/.')
      #end

      #if !@description.nil? && @description !~ Regexp.new(/[À-ÖØ-öø-ǿÀ-ÖØ-öø-ǿ\\n\\ra-zA-Z0-9().\\-_#,;\/\\\\@$:&amp;!?%«»€₣«»€₣ ]{1,}$/)
        #invalid_properties.push('invalid value for "description", must conform to the pattern /[À-ÖØ-öø-ǿÀ-ÖØ-öø-ǿ\\n\\ra-zA-Z0-9().\\-_#,;\/\\\\@$:&amp;!?%«»€₣«»€₣ ]{1,}$/.')
      #end

      #if !@website_url.nil? && @website_url !~ Regexp.new(/\\b((?:https?:\/\/|www\\d{0,3}[.]|[a-z0-9.\\-]+[.][a-z]{2,4}\/)(?:[^\\s()<>]+|\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\))+(?:\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\)|[^\\s`!()\\[\\]{};:'\".,<>?Â«Â»â€œâ€â€˜â€™]))/)
        #invalid_properties.push('invalid value for "website_url", must conform to the pattern /\\b((?:https?:\/\/|www\\d{0,3}[.]|[a-z0-9.\\-]+[.][a-z]{2,4}\/)(?:[^\\s()<>]+|\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\))+(?:\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\)|[^\\s`!()\\[\\]{};:'\".,<>?Â«Â»â€œâ€â€˜â€™]))/.')
      #end

      #if !@tax_id.nil? && @tax_id !~ Regexp.new(/\\d{9}/)
        #invalid_properties.push('invalid value for "tax_id", must conform to the pattern /\\d{9}/.')
      #end

      #if !@phone_number.nil? && @phone_number !~ Regexp.new(/^[0-9a-zA-Z\\\\+\\\\-]+$/)
        #invalid_properties.push('invalid value for "phone_number", must conform to the pattern /^[0-9a-zA-Z\\\\+\\\\-]+$/.')
      #end

      #if !@merchant_category_code.nil? && @merchant_category_code !~ Regexp.new(/^\\d{3,4}$/)
        #invalid_properties.push('invalid value for "merchant_category_code", must conform to the pattern /^\\d{3,4}$/.')
      #end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if @name.nil?
      #return false if @name !~ Regexp.new(/^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/)
      #return false if !@doing_business_as.nil? && @doing_business_as !~ Regexp.new(/^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/)
      #return false if !@description.nil? && @description !~ Regexp.new(/[À-ÖØ-öø-ǿÀ-ÖØ-öø-ǿ\\n\\ra-zA-Z0-9().\\-_#,;\/\\\\@$:&amp;!?%«»€₣«»€₣ ]{1,}$/)
      time_zone_validator = EnumAttributeValidator.new('String', ['Pacific/Pago_Pago', 'Pacific/Honolulu', 'America/Anchorage', 'America/Vancouver', 'America/Los_Angeles', 'America/Phoenix', 'America/Edmonton', 'America/Denver', 'America/Winnipeg', 'America/Mexico_City', 'America/Chicago', 'America/Bogota', 'America/Indianapolis', 'America/New_York', 'America/La_Paz', 'America/Halifax', 'America/St_Johns', 'America/Buenos_Aires', 'America/Godthab', 'America/Sao_Paulo', 'America/Noronha', 'Atlantic/Cape_Verde', 'GMT', 'Europe/Dublin', 'Europe/Lisbon', 'Europe/London', 'Africa/Tunis', 'Europe/Vienna', 'Europe/Brussels', 'Europe/Zurich', 'Europe/Prague', 'Europe/Berlin', 'Europe/Copenhagen', 'Europe/Madrid', 'Europe/Budapest', 'Europe/Rome', 'Africa/Tripoli', 'Europe/Monaco', 'Europe/Malta', 'Europe/Amsterdam', 'Europe/Oslo', 'Europe/Warsaw', 'Europe/Stockholm', 'Europe/Belgrade', 'Europe/Paris', 'Africa/Johannesburg', 'Europe/Minsk', 'Africa/Cairo', 'Europe/Helsinki', 'Europe/Athens', 'Asia/Jerusalem', 'Europe/Riga', 'Europe/Bucharest', 'Europe/Istanbul', 'Asia/Riyadh', 'Europe/Moscow', 'Asia/Dubai', 'Asia/Baku', 'Asia/Tbilisi', 'Asia/Calcutta', 'Asia/Katmandu', 'Asia/Dacca', 'Asia/Rangoon', 'Asia/Jakarta', 'Asia/Saigon', 'Asia/Bangkok', 'Australia/Perth', 'Asia/Hong_Kong', 'Asia/Macao', 'Asia/Kuala_Lumpur', 'Asia/Manila', 'Asia/Singapore', 'Asia/Taipei', 'Asia/Shanghai', 'Asia/Seoul', 'Asia/Tokyo', 'Asia/Yakutsk', 'Australia/Adelaide', 'Australia/Brisbane', 'Australia/Broken_Hill', 'Australia/Darwin', 'Australia/Eucla', 'Australia/Hobart', 'Australia/Lindeman', 'Australia/Sydney', 'Australia/Lord_Howe', 'Australia/Melbourne', 'Asia/Magadan', 'Pacific/Norfolk', 'Pacific/Auckland'])
      return false unless time_zone_validator.valid?(@time_zone)
      #return false if !@website_url.nil? && @website_url !~ Regexp.new(/\\b((?:https?:\/\/|www\\d{0,3}[.]|[a-z0-9.\\-]+[.][a-z]{2,4}\/)(?:[^\\s()<>]+|\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\))+(?:\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\)|[^\\s`!()\\[\\]{};:'\".,<>?Â«Â»â€œâ€â€˜â€™]))/)
      type_validator = EnumAttributeValidator.new('String', ['PARTNERSHIP', 'SOLE_PROPRIETORSHIP', 'CORPORATION', 'LLC', 'NON_PROFIT', 'TRUST'])
      return false unless type_validator.valid?(@type)
      #return false if !@tax_id.nil? && @tax_id !~ Regexp.new(/\\d{9}/)
      #return false if !@phone_number.nil? && @phone_number !~ Regexp.new(/^[0-9a-zA-Z\\\\+\\\\-]+$/)
      #return false if !@merchant_category_code.nil? && @merchant_category_code !~ Regexp.new(/^\\d{3,4}$/)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] name Value to be assigned
    def name=(name)
      if name.nil?
        fail ArgumentError, 'name cannot be nil'
      end

      #if name !~ Regexp.new(/^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/)
        #fail ArgumentError, 'invalid value for "name", must conform to the pattern /^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/.'
      #end

      @name = name
    end

    # Custom attribute writer method with validation
    # @param [Object] doing_business_as Value to be assigned
    def doing_business_as=(doing_business_as)
      #if !doing_business_as.nil? && doing_business_as !~ Regexp.new(/^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/)
        #fail ArgumentError, 'invalid value for "doing_business_as", must conform to the pattern /^[0-9a-zA-Z _\\-\\+\\.\\*\\\"\/'&\\,\\(\\)!$;:?@\\#¡-￿]+$/.'
      #end

      @doing_business_as = doing_business_as
    end

    # Custom attribute writer method with validation
    # @param [Object] description Value to be assigned
    def description=(description)
      #if !description.nil? && description !~ Regexp.new(/[À-ÖØ-öø-ǿÀ-ÖØ-öø-ǿ\\n\\ra-zA-Z0-9().\\-_#,;\/\\\\@$:&amp;!?%«»€₣«»€₣ ]{1,}$/)
        #fail ArgumentError, 'invalid value for "description", must conform to the pattern /[À-ÖØ-öø-ǿÀ-ÖØ-öø-ǿ\\n\\ra-zA-Z0-9().\\-_#,;\/\\\\@$:&amp;!?%«»€₣«»€₣ ]{1,}$/.'
      #end

      @description = description
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] time_zone Object to be assigned
    def time_zone=(time_zone)
      validator = EnumAttributeValidator.new('String', ['Pacific/Pago_Pago', 'Pacific/Honolulu', 'America/Anchorage', 'America/Vancouver', 'America/Los_Angeles', 'America/Phoenix', 'America/Edmonton', 'America/Denver', 'America/Winnipeg', 'America/Mexico_City', 'America/Chicago', 'America/Bogota', 'America/Indianapolis', 'America/New_York', 'America/La_Paz', 'America/Halifax', 'America/St_Johns', 'America/Buenos_Aires', 'America/Godthab', 'America/Sao_Paulo', 'America/Noronha', 'Atlantic/Cape_Verde', 'GMT', 'Europe/Dublin', 'Europe/Lisbon', 'Europe/London', 'Africa/Tunis', 'Europe/Vienna', 'Europe/Brussels', 'Europe/Zurich', 'Europe/Prague', 'Europe/Berlin', 'Europe/Copenhagen', 'Europe/Madrid', 'Europe/Budapest', 'Europe/Rome', 'Africa/Tripoli', 'Europe/Monaco', 'Europe/Malta', 'Europe/Amsterdam', 'Europe/Oslo', 'Europe/Warsaw', 'Europe/Stockholm', 'Europe/Belgrade', 'Europe/Paris', 'Africa/Johannesburg', 'Europe/Minsk', 'Africa/Cairo', 'Europe/Helsinki', 'Europe/Athens', 'Asia/Jerusalem', 'Europe/Riga', 'Europe/Bucharest', 'Europe/Istanbul', 'Asia/Riyadh', 'Europe/Moscow', 'Asia/Dubai', 'Asia/Baku', 'Asia/Tbilisi', 'Asia/Calcutta', 'Asia/Katmandu', 'Asia/Dacca', 'Asia/Rangoon', 'Asia/Jakarta', 'Asia/Saigon', 'Asia/Bangkok', 'Australia/Perth', 'Asia/Hong_Kong', 'Asia/Macao', 'Asia/Kuala_Lumpur', 'Asia/Manila', 'Asia/Singapore', 'Asia/Taipei', 'Asia/Shanghai', 'Asia/Seoul', 'Asia/Tokyo', 'Asia/Yakutsk', 'Australia/Adelaide', 'Australia/Brisbane', 'Australia/Broken_Hill', 'Australia/Darwin', 'Australia/Eucla', 'Australia/Hobart', 'Australia/Lindeman', 'Australia/Sydney', 'Australia/Lord_Howe', 'Australia/Melbourne', 'Asia/Magadan', 'Pacific/Norfolk', 'Pacific/Auckland'])
      unless validator.valid?(time_zone)
        fail ArgumentError, 'invalid value for "time_zone", must be one of #{validator.allowable_values}.'
      end
      @time_zone = time_zone
    end

    # Custom attribute writer method with validation
    # @param [Object] website_url Value to be assigned
    def website_url=(website_url)
      #if !website_url.nil? && website_url !~ Regexp.new(/\\b((?:https?:\/\/|www\\d{0,3}[.]|[a-z0-9.\\-]+[.][a-z]{2,4}\/)(?:[^\\s()<>]+|\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\))+(?:\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\)|[^\\s`!()\\[\\]{};:'\".,<>?Â«Â»â€œâ€â€˜â€™]))/)
        #fail ArgumentError, 'invalid value for "website_url", must conform to the pattern /\\b((?:https?:\/\/|www\\d{0,3}[.]|[a-z0-9.\\-]+[.][a-z]{2,4}\/)(?:[^\\s()<>]+|\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\))+(?:\\(([^\\s()<>]+|(\\([^\\s()<>]+\\)))*\\)|[^\\s`!()\\[\\]{};:'\".,<>?Â«Â»â€œâ€â€˜â€™]))/.'
      #end

      @website_url = website_url
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] type Object to be assigned
    def type=(type)
      validator = EnumAttributeValidator.new('String', ['PARTNERSHIP', 'SOLE_PROPRIETORSHIP', 'CORPORATION', 'LLC', 'NON_PROFIT', 'TRUST'])
      unless validator.valid?(type)
        fail ArgumentError, 'invalid value for "type", must be one of #{validator.allowable_values}.'
      end
      @type = type
    end

    # Custom attribute writer method with validation
    # @param [Object] tax_id Value to be assigned
    def tax_id=(tax_id)
      #if !tax_id.nil? && tax_id !~ Regexp.new(/\\d{9}/)
        #fail ArgumentError, 'invalid value for "tax_id", must conform to the pattern /\\d{9}/.'
      #end

      @tax_id = tax_id
    end

    # Custom attribute writer method with validation
    # @param [Object] phone_number Value to be assigned
    def phone_number=(phone_number)
      #if !phone_number.nil? && phone_number !~ Regexp.new(/^[0-9a-zA-Z\\\\+\\\\-]+$/)
        #fail ArgumentError, 'invalid value for "phone_number", must conform to the pattern /^[0-9a-zA-Z\\\\+\\\\-]+$/.'
      #end

      @phone_number = phone_number
    end

    # Custom attribute writer method with validation
    # @param [Object] merchant_category_code Value to be assigned
    def merchant_category_code=(merchant_category_code)
      #if !merchant_category_code.nil? && merchant_category_code !~ Regexp.new(/^\\d{3,4}$/)
        #fail ArgumentError, 'invalid value for "merchant_category_code", must conform to the pattern /^\\d{3,4}$/.'
      #end

      @merchant_category_code = merchant_category_code
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          name == o.name &&
          doing_business_as == o.doing_business_as &&
          description == o.description &&
          start_date == o.start_date &&
          address == o.address &&
          time_zone == o.time_zone &&
          website_url == o.website_url &&
          type == o.type &&
          tax_id == o.tax_id &&
          phone_number == o.phone_number &&
          business_contact == o.business_contact &&
          technical_contact == o.technical_contact &&
          emergency_contact == o.emergency_contact &&
          merchant_category_code == o.merchant_category_code
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [name, doing_business_as, description, start_date, address, time_zone, website_url, type, tax_id, phone_number, business_contact, technical_contact, emergency_contact, merchant_category_code].hash
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