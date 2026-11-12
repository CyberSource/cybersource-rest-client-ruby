# frozen_string_literal: true

require_relative '../lib/AuthenticationSDK/authentication/jwt/JwtToken'
require_relative '../lib/AuthenticationSDK/util/MLEUtility'
require_relative '../lib/AuthenticationSDK/util/Constants'

RSpec.describe GenerateJwtToken do
  let(:merchantconfig_obj) do
    double(
      'MerchantConfig',
      requestType: 'GET',
      requestJsonData: nil,
      requestHost: 'apitest.cybersource.com',
      requestTarget: '/pts/v2/payments',
      useMetaKey: false,
      portfolioID: nil,
      merchantId: 'testrest'
    )
  end

  describe '#getPayloadClaimSet' do
    it 'includes v-c-response-mle-algo with RSA-OAEP-256 when response MLE is enabled' do
      allow(MLEUtility).to receive(:validate_and_auto_extract_response_mle_kid).and_return('test-kid')

      payload = subject.send(:getPayloadClaimSet, merchantconfig_obj, true)

      expect(payload['v-c-response-mle-kid']).to eq('test-kid')
      expect(payload['v-c-response-mle-algo']).to eq('RSA-OAEP-256')
    end

    it 'does not include v-c-response-mle-algo/kid when response MLE is disabled (backward compatibility)' do
      payload = subject.send(:getPayloadClaimSet, merchantconfig_obj, false)

      expect(payload).not_to have_key('v-c-response-mle-algo')
      expect(payload).not_to have_key('v-c-response-mle-kid')
    end
  end
end
