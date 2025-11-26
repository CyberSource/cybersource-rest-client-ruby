# Cache value object to store MLE KID data
class CachedMLEKId
  attr_accessor :kid, :last_modified_timestamp

  def initialize(kid = nil, last_modified_timestamp = nil)
    @kid = kid
    @last_modified_timestamp = last_modified_timestamp
  end

  def to_s
    "CachedMLEKId(kid: #{@kid ? 'present' : 'nil'}, last_modified_timestamp: #{@last_modified_timestamp})"
  end

  def empty?
    @kid.nil? && @last_modified_timestamp.nil?
  end
end
