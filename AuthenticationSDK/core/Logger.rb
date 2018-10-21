require_relative '../util/ApiException.rb'
require 'logger'
public 
# Logger Class
class Log
  def initialize(logDirectory, logFilename, logSize, enableLog)
    #log
    if enableLog == true
      filename = logDirectory + '/' + logFilename + '.log'
      datetime = DateTime.now
      if File.exist?(filename) && File.size(filename) >= logSize
        updatedFileName = logDirectory + '/' + logFilename + '_' + datetime.strftime('%Y%m%d%H%M%S') + '.log'
        File.rename(filename, updatedFileName)
      end
      @logger = Logger.new(STDOUT)
      @logger = Logger.new(filename, logSize)
      @logger.datetime_format = datetime.strftime('%Y-%m-%d %H:%M:%S')
    else
      @logger = Logger.new(false)
    end
  rescue StandardError => err
    puts err
    exit!
  end
  attr_accessor :logger
end
