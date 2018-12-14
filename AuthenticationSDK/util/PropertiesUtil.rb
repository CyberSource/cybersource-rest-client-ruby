require 'yaml'
require_relative './Constants.rb'
public
# Method for reading Cybs.yml file
class PropertiesUtil
  def getCybsProp()
    # Give the path of cybs properties file which needs to be read.
    cybs_path = '../resource/cybs.yml'
    if File.exist?(cybs_path)
      # Reading Merchant Config from Cybs.yml File"
      cybsproperty_obj = YAML.load(File.read(cybs_path))
      return cybsproperty_obj
    elsif !File.exist?(cybs_path)
      raise Constants::ERROR_PREFIX + Constants::PROPERTY_FILE_NOT_FOUND
    end
  rescue StandardError => err
    puts err.message
    exit!
  end
end
