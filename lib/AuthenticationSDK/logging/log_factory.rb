require 'logger'
require 'fileutils'
require_relative 'sensitive_logging.rb'

# module CyberSource
public
# Logger Class
  class Log
    @logger
    def initialize(logConfiguration, callingProgram = '')
        enableLog = logConfiguration.enableLog
        loggingLevel = logConfiguration.loggingLevel
        logDirectory = logConfiguration.logDirectory
        logFilename = logConfiguration.logFilename
        maxLogSize = logConfiguration.maxLogSize
        maxLogFiles = logConfiguration.maxLogFiles
        enableMasking = logConfiguration.enableMasking

        callingProgram = "Generic" if callingProgram.nil? || callingProgram.empty?

        #log
        if enableLog == true
            filename = File.join logDirectory, logFilename + '.log' # logDirectory + '/' + logFilename + '.log'
            datetime = DateTime.now
            if File.exist?(logDirectory)
                if File.exist?(logFilename)
                    if File.size(filename) >= maxLogSize
                        updatedFileName = File.join logDirectory, logFilename + '_' + datetime.strftime('%Y%m%d%H%M%S') + '.log'
                        File.rename(filename, updatedFileName)
                    end
                end
            elsif !File.exist?(logDirectory)
                FileUtils.mkdir_p logDirectory
                File.new(filename, "w")
            end

            STDOUT.sync = true

            @logger = Logger.new(STDOUT, progname: callingProgram)
            @logger = Logger.new(filename, shift_age = maxLogFiles, shift_size = maxLogSize, progname: callingProgram)
            @logger.level = loggingLevel
            @logger.datetime_format = datetime.strftime('%Y-%m-%d %H:%M:%S')

            if enableMasking
                @logger.formatter = SensitiveDataFilter.new
            else
                @logger.formatter = proc do |severity, datetime, progname, msg|
                    date_format = datetime.strftime("%Y-%m-%d %H:%M:%S")
                    log_message = "[#{date_format}] #{severity.ljust(10)} (#{progname}): #{msg}\n"
                    # $stdout.puts log_message
                    log_message
                end
            end
        else
            @logger = Logger.new(false)
        end
    rescue StandardError => err
        # puts err
        raise err
        # exit!
    end

    attr_accessor :logger
  end
# end