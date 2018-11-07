require_relative '../../util/Constants.rb'
require_relative '.././payloadDigest/digest.rb'
require 'openssl'
# This function returns value for paramter Signature which is then passed to Signature header
# paramter 'Signature' is calucated based on below key values and then signed with SECRET KEY -
# host: Sandbox (apitest.cybersource.com) or Production (api.cybersource.com) hostname
# date: "HTTP-date" format as defined by RFC7231.
# (request-target): Should be in format of httpMethod: path
# Example: "post /pts/v2/payments"
# Digest: Only needed for POST calls.
# digestString = BASE64( HMAC-SHA256 ( Payload ));
# Digest: “SHA-256=“ + digestString;
# v-c-merchant-id: set value to Cybersource Merchant ID
# This ID can be found on EBC portal*/
class SignatureParameter
  def generateSignatureParameter(merchantconfig_obj, gmtdatetime, log_obj)
    request_type = merchantconfig_obj.requestType.upcase
    merchantSecretKey = merchantconfig_obj.merchantSecretKey
    signatureString = Constants::HOST + ': ' + merchantconfig_obj.requestHost
    signatureString << "\n"+ Constants::DATE + ': ' + gmtdatetime
    signatureString << "\n(request-target): "
    if request_type == Constants::GET_REQUEST_TYPE || request_type == Constants::DELETE_REQUEST_TYPE
      targetUrl=gettargetUrlForGetDelete(request_type,merchantconfig_obj)
      signatureString << targetUrl + "\n"
    elsif request_type == Constants::POST_REQUEST_TYPE || request_type == Constants::PUT_REQUEST_TYPE || request_type == Constants::PATCH_REQUEST_TYPE
      targetUrl=gettargetUrlForPutPost(request_type,merchantconfig_obj)
      signatureString << targetUrl + "\n"
      payload = merchantconfig_obj.requestJsonData
      digest = DigestGeneration.new.generateDigest(payload, log_obj)
      digest_payload = Constants::SHA256 + digest
      signatureString << Constants::DIGEST + ': ' + digest_payload + "\n"
    end
    signatureString << Constants::V_C_MERCHANT_ID + ': ' + merchantconfig_obj.merchantId
    encodedSignatureString = signatureString.force_encoding(Encoding::UTF_8)
    decodedKey = Base64.decode64(merchantSecretKey)
    base64EncodedSignature = Base64.strict_encode64(OpenSSL::HMAC.digest('sha256', decodedKey, encodedSignatureString))
    return base64EncodedSignature
  rescue StandardError => err
    log_obj.logger.error(err.message)
    log_obj.logger.error(err.backtrace)
    puts 'Check log for more details.'
    exit!
  end
  def gettargetUrlForGetDelete(request_type, merchantconfig_obj)
    targetUrlForGetDelete = ''
    if request_type == Constants::DELETE_REQUEST_TYPE
      targetUrlForGetDelete = Constants::DELETE_REQUEST_TYPE_LOWER + ' ' + merchantconfig_obj.requestTarget
    elsif request_type == Constants::GET_REQUEST_TYPE
      targetUrlForGetDelete = Constants::GET_REQUEST_TYPE_LOWER + ' ' + merchantconfig_obj.requestTarget
    end
    return targetUrlForGetDelete
  end
  def gettargetUrlForPutPost(request_type, merchantconfig_obj)
    targetUrlForPutPost = ''
    if request_type == Constants::POST_REQUEST_TYPE
      targetUrlForPutPost = Constants::POST_REQUEST_TYPE_LOWER + ' ' + merchantconfig_obj.requestTarget
    elsif request_type == Constants::PUT_REQUEST_TYPE
      targetUrlForPutPost = Constants::PUT_REQUEST_TYPE_LOWER + ' ' + merchantconfig_obj.requestTarget
    elsif request_type == Constants::PATCH_REQUEST_TYPE
      targetUrlForPutPost = Constants::PATCH_REQUEST_TYPE_LOWER + ' ' + merchantconfig_obj.requestTarget
    end
    return targetUrlForPutPost
  end
end
