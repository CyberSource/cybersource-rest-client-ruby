public
class VerifyToken
  def verify(public_key, post_param)
    post_param = JSON.parse(post_param)
    signed_fields = Array.new
    get_signed_fields =  Array.new
    signed_values = ""
    signature = ""
    if post_param['signedFields'].to_s.empty?
      raise StandardError.new("Missing required field: signed_fields")
    else
      signed_fields = post_param['signedFields'].split(',')
    end
    signed_fields.each do |value|
      signed_values << ','
      signed_values << post_param[value].to_s
    end
    if signed_values.length > 0
      signed_values.slice!(0)
    end
    if post_param['signature'].to_s.empty?
      raise StandardError.new("Missing required field: signature")
    else
      signature = post_param['signature']
    end
    string_to_pem = "-----BEGIN PUBLIC KEY-----\n#{public_key}\n-----END PUBLIC KEY-----\n"
    public_key_to_pem = OpenSSL::PKey::RSA.new(string_to_pem)
    verify = public_key_to_pem.verify(OpenSSL::Digest::SHA512.new, Base64.decode64(signature), signed_values)
  rescue StandardError => err 
    puts err.message
  end
  # Converting response field from camelCase to Underscore
  def CamelCasetoUnderscore(str)
    str.gsub(/::/, '/').
    gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
    gsub(/([a-z\d])([A-Z])/,'\1_\2').
    tr("-", "_").
    downcase
  end
end