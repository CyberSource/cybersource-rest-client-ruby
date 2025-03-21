require 'logger'
require 'json'

class SensitiveTag
    attr_accessor :tagName, :pattern, :replacement, :disableMask
    def initialize(tagName, pattern, replacement, disableMask)
        @tagName = tagName
        @pattern = pattern
        @replacement = replacement
        @disableMask = disableMask
    end
end

class SensitiveDataConfigType
    attr_accessor :sensitiveTags, :sensitiveStringRegexes

    def initialize
    @sensitiveTags = Array.new([
            SensitiveTag.new("securityCode", "[0-9]{3,4}", "XXX", false),
            SensitiveTag.new("number", "(\\s*\\p{N}\\s*)+(\\p{N}{4})(\\s*)", "XXXX-\\2", false),
            SensitiveTag.new("cardNumber", "(\\s*\\p{N}\\s*)+(\\p{N}{4})(\\s*)", "XXXX-\\2", false),
            SensitiveTag.new("expirationMonth", "[0-1][0-9]", "XXXX", false),
            SensitiveTag.new("expirationYear", "2[0-9][0-9][0-9]", "XXXX", false),
            SensitiveTag.new("account", "(\\s*\\p{N}\\s*)+(\\p{N}{4})(\\s*)", "XXXX-\\2", false),
            SensitiveTag.new("routingNumber", "[0-9]+", "XXXXX", false),
            SensitiveTag.new("email", "[a-z0-9!#$%&'*+\/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", "XXXXX", false),
            SensitiveTag.new("firstName", "([a-zA-Z]+( )?[a-zA-Z]*'?-?[a-zA-Z]*( )?([a-zA-Z]*)?)", "xxxxx", false),
            SensitiveTag.new("lastName", "([a-zA-Z]+( )?[a-zA-Z]*'?-?[a-zA-Z]*( )?([a-zA-Z]*)?)", "xxxxx", false),
            SensitiveTag.new("phoneNumber", "(\\+[0-9]{1,2} )?\\(?[0-9]{3}\\)?[ .-]?[0-9]{3}[ .-]?[0-9]{4}", "xxxxx", false),
            SensitiveTag.new("type", "[-A-Za-z0-9 ]+", "xxxxx", false),
            SensitiveTag.new("token", "[-.A-Za-z0-9 ]+", "xxxxx", false),
            SensitiveTag.new("signature", "[-.A-Za-z0-9 ]+", "xxxxx", false),
            SensitiveTag.new("prefix", "(\\p{N}{6})(\\p{N}*)", "\\2-XXXXX", false),
            SensitiveTag.new("prefix", "(\\s*)(\\p{N}{4})(\\s*)(\\p{N}{2})(\\s*\\p{N}*\\s*)", "\\2-XXXX", false),
            SensitiveTag.new("bin", "(\\s*)(\\p{N}{4})(\\s*)(\\p{N}{2})(\\s*\\p{N}*\\s*)", "\\2-XXXX", false)
        ]).freeze

    @sensitiveStringRegexes = [
            "4\\p{N}{3}([\\ \\-]?)\\p{N}{4}\\1\\p{N}{4}\\1\\p{N}{4}",
            "4\\p{N}{3}([\\ \\-]?)(?:\\p{N}{4}\\1){2}\\p{N}(?:\\p{N}{3})?",
            "5[1-5]\\p{N}{2}([\\ \\-]?)\\p{N}{4}\\1\\p{N}{4}\\1\\p{N}{4}",
            "6(?:011|22(?:1(?=[\\ \\-]?(?:2[6-9]|[3-9]))|[2-8]|9(?=[\\ \\-]?(?:[01]|2[0-5])))|4[4-9]\\p{N}|5\\p{N}\\p{N})([\\ \\-]?)\\p{N}{4}\\1\\p{N}{4}\\1\\p{N}{4}",
            "35(?:2[89]|[3-8]\\p{N})([\\ \\-]?)\\p{N}{4}\\1\\p{N}{4}\\1\\p{N}{4}",
            "3[47]\\p{N}\\p{N}([\\ \\-]?)\\p{N}{6}\\1\\p{N}{5}"
        ].freeze
    end
end

class SensitiveDataFilter < Logger::Formatter
    @@sensitiveTagConfig = nil
    @@tagPatterns = nil
    @@tagReplacements = nil
    @@cardPatterns = nil

    def initialize
        @@sensitiveTagConfig = SensitiveDataConfigType.new
        @@cardPatterns       = @@sensitiveTagConfig.sensitiveStringRegexes
        @@tagPatterns        = Array.new(@@sensitiveTagConfig.sensitiveStringRegexes.length)
        @@tagReplacements    = Array.new(@@sensitiveTagConfig.sensitiveTags.length)

        @@sensitiveTagConfig.sensitiveTags.each_with_index do |sensitiveTag, index|
            tagName = sensitiveTag.tagName
            replacement = sensitiveTag.replacement

            if sensitiveTag.pattern.nil? || sensitiveTag.pattern.empty?
                pattern = "(.*)"
            else
            pattern = sensitiveTag.pattern
            end

            @@tagPatterns[index] = "\""+tagName+"\":\""+pattern+"\""
            @@tagReplacements[index] = "\""+tagName+"\":\""+replacement+"\""
        end
    end

    def maskSensitiveDataInJson(input)
        parts = input.split(":", 2)
        json_data = JSON.parse(parts[1].strip)
        encrypted_request = json_data["encryptedRequest"]
        json_data["encryptedRequest"] = 'X' * encrypted_request.length
        return parts[0] + ":" + JSON.generate(json_data)
    end

    def call(severity, time, progname, msg)
        maskedMessage = maskSensitiveString(msg)
        ccMasked = maskCreditCards(maskedMessage)
        if ccMasked.include?("encryptedRequest")
            mleMasked = maskSensitiveDataInJson(ccMasked)
            return formatLogEntry(severity, time, progname, mleMasked)
        else
            return formatLogEntry(severity, time, progname, ccMasked)
        end
    end

    def maskCreditCards(input)
        encoded_input = input #.force_encoding("UTF-8")
        @@cardPatterns.each {|cardNumberRegex|
            encoded_input = encoded_input.gsub(/#{cardNumberRegex}/, "XXX")
        }
        return encoded_input
    end

    def maskSensitiveString(input)
        encoded_input = input #.force_encoding("UTF-8")
        @@tagPatterns.each_with_index do |item, index|
            encoded_input = encoded_input.gsub(/#{item}/,@@tagReplacements[index])
        end
        return encoded_input
    end

    def formatLogEntry(severity, time, progname, msg)
        datetime = DateTime.now
        date_format = datetime.strftime("%Y-%m-%d %H:%M:%S")
        log_message = "[#{date_format}] #{severity.ljust(10)} (#{progname}): #{msg}\n"
        # $stdout.puts log_message
        log_message
    end
end