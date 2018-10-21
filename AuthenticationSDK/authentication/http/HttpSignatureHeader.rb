require 'base64'
require_relative '../../core/ITokenGeneration.rb'
require_relative '../../util/Constants.rb'
require_relative '../../util/ApiException.rb'
require_relative '.././payloadDigest/digest.rb'
require_relative '.././http/GetSignatureParameter.rb'
public
#  SignatureHeader return SignatureHeader Value that contains following paramters
#  * keyid     -- Merchant ID obtained from EBC portal
#  * algorithm -- Should have value as "HmacSHA256"
#  * headers   -- List of all header name passed in the Signature paramter below
#                 String getHeaders = "host date (request-target)" + " " + "v-c-merchant-id";
#                 String postHeaders = "host date (request-target) digest v-c-merchant-id";
#                 Note: Digest is not passed for GET calls
#  * signature -- Signature header has paramter called signature
#                 Paramter 'Signature' must contain all the paramters mentioned in header above in given order
class GenerateHttpSignature
  # Generates Signature based on the requestType
  def getToken(merchantconfig_obj, gmtdatetime, log_obj)
    request_type = merchantconfig_obj.requestType.upcase
    signatureHeaderValue =''
    signatureHeaderValue << Constants::KEY_ID + merchantconfig_obj.merchantKeyId + "\""
    # Algorithm should be always HmacSHA256 for http signature
    signatureHeaderValue << ', ' + Constants::ALGORITHM + Constants::SIGNATURE_ALGORITHM + "\""
    # Headers - list is choosen based on HTTP method
    signatureheader=getsignatureHeader(request_type)
    signatureHeaderValue << ', ' + Constants::HEADERS_PARAM + signatureheader + "\""
    # Get Value for parameter 'Signature' to be passed to Signature Header
    signature_value = SignatureParameter.new.generateSignatureParameter(merchantconfig_obj, gmtdatetime, log_obj)
    signatureHeaderValue << ', ' + Constants::SIGNATURE_PARAM + signature_value + "\""
    return signatureHeaderValue
  rescue StandardError => err
    ApiException.new.apiexception(err,log_obj)
    exit!
  end
  def getsignatureHeader(request_type)
    headers = ''
    if request_type == Constants::POST_REQUEST_TYPE
      headers = 'host date (request-target) digest ' + Constants::V_C_MERCHANT_ID
    elsif request_type == Constants::GET_REQUEST_TYPE || request_type == Constants::DELETE_REQUEST_TYPE
      headers = 'host date (request-target)' + ' ' + Constants::V_C_MERCHANT_ID
    elsif request_type == Constants::PUT_REQUEST_TYPE
      headers = 'host date (request-target) digest ' + Constants::V_C_MERCHANT_ID
     else
      raise StandardError.new(Constants::ERROR_PREFIX + Constants::INVALID_REQUEST_TYPE_METHOD)
    end
    return headers
  end
  implements TokenInterface
end
