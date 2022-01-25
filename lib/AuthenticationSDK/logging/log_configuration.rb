require_relative '../util/Constants.rb'

public
    class LogConfiguration
        # Setter/Getter
        attr_accessor :enableLog
        attr_accessor :loggingLevel
        attr_accessor :logDirectory
        attr_accessor :logFilename
        attr_accessor :maxLogSize
        attr_accessor :maxLogFiles
        attr_accessor :enableMasking

        def initialize(log_config)
            @enableLog = log_config['enableLog']
            @loggingLevel = log_config['loggingLevel']
            @logDirectory = log_config['logDirectory']
            @logFilename = log_config['logFilename']
            @maxLogSize = log_config['maxLogSize']
            @maxLogFiles = log_config['maxLogFiles']
            @enableMasking = log_config['enableMasking']

        def validate(log_message)
            if @enableLog == "true"
                @enableLog = true
            elsif @enableLog == true
                @enableLog = true
            else
                @enableLog = false
            end
            if @enableLog
                if !Constants::LOG_LEVELS.include? @loggingLevel
                    @loggingLevel = Constants::DEFAULT_LOG_LEVEL
                    log_message += Constants::WARNING_PREFIX + Constants::INVALID_LOG_LEVEL + @loggingLevel
                end
                if @logDirectory.to_s.empty? # || !Dir.exist?(@logDirectory)
                    @logDirectory = Constants::DEFAULT_LOG_DIRECTORY
                    unless Dir.exist?(@logDirectory)
                        Dir.mkdir(Constants::DEFAULT_LOG_DIRECTORY)
                    end
                    log_message += Constants::WARNING_PREFIX + Constants::INVALID_LOG_DIRECTORY + File.expand_path(@logDirectory)
                end
                if @logFilename.to_s.empty?
                    @logFilename = Constants::DEFAULT_LOGFILE_NAME
                elsif !@logFilename.instance_of? String
                    @logFilename = @logFilename.to_s
                end
                if @maxLogSize.nil? || @maxLogSize.to_s.empty?
                    @maxLogSize = Constants::DEFAULT_LOG_SIZE
                    log_message += Constants::WARNING_PREFIX + Constants::INVALID_MAX_LOG_SIZE + @maxLogSize
                elsif !@maxLogSize.instance_of? Integer
                    @maxLogSize = @maxLogSize.to_i
                end
                if @maxLogFiles.nil? || @maxLogFiles.to_s.empty?
                    @maxLogFiles = Constants::DEFAULT_MAX_LOG_FILES
                    log_message += Constants::WARNING_PREFIX + Constants::INVALID_MAX_LOG_FILES + @maxLogFiles
                elsif !@maxLogFiles.instance_of? Integer
                    @maxLogFiles = @maxLogFiles.to_i
                end
                if @enableMasking == "true"
                    @enableMasking = true
                elsif @enableMasking == true
                    @enableMasking = true
                else
                    @enableMasking = false
                end
            end
            return log_message
        end
    end
end