# frozen_string_literal: true

require 'openssl'
require 'json'
require 'jose'
require 'tmpdir'
require 'securerandom'
require_relative '../lib/AuthenticationSDK/util/MLEUtility'
require_relative '../lib/AuthenticationSDK/util/AuthJWEUtility'

# Functional tests for request Message Level Encryption (MLE) exercised through
# MLEUtility.encrypt_request_payload. Uses the shared testrest.p12 test certificate
# (same one used by the Java/.NET auth SDKs) so a regression in the encryption logic
# is caught via a real RSA-OAEP-256 + AES-256-GCM round trip, not just a structural check.
RSpec.describe MLEUtility do
  let(:p12_path) { File.expand_path('../resource/testrest.p12', __dir__) }
  let(:p12) { OpenSSL::PKCS12.new(File.binread(p12_path), 'testrest') }
  let(:certificate) { p12.certificate }
  let(:private_jwk) { JOSE::JWK.from_key(p12.key) }
  let(:expected_kid) do
    attr = certificate.subject.to_a.find { |a| a[0].include?('serialNumber') }
    attr[1]
  end
  let(:sample_payload) { '{"clientReferenceInformation":{"code":"TC-12345"}}' }

  # mleForRequestPublicCertPath expects a PEM file (see CertificateUtility.getCertificatesFromPemFile).
  let(:public_cert_path) do
    path = File.join(Dir.tmpdir, "mle-request-test-#{SecureRandom.hex}.pem")
    File.write(path, certificate.to_pem)
    path
  end

  after do
    File.delete(public_cert_path) if public_cert_path && File.exist?(public_cert_path)
  end

  def merchant_config(authentication_type: 'http_signature')
    double(
      'MerchantConfig',
      merchantId: 'testrest',
      authenticationType: authentication_type,
      mleForRequestPublicCertPath: public_cert_path,
      requestMleKeyAlias: 'testrest',
      keyAlias: 'testrest',
      p12KeyFilePath: nil,
      log_config: double(
        'LogConfiguration',
        enableLog: false,
        loggingLevel: nil,
        logDirectory: nil,
        logFilename: nil,
        maxLogSize: nil,
        maxLogFiles: nil,
        enableMasking: false
      )
    )
  end

  def decode_header(jwe_token)
    JOSE::JWE.peek_protected(jwe_token)
  end

  def extract_jwe(result)
    envelope = JSON.parse(result)
    expect(envelope.keys).to eq(['encryptedRequest'])
    envelope['encryptedRequest']
  end

  describe '.encrypt_request_payload' do
    context 'with nil request body' do
      it 'returns nil unchanged' do
        expect(MLEUtility.encrypt_request_payload(merchant_config, nil, 'application/json')).to be_nil
      end
    end

    context 'JWE "cty" (content type) header' do
      ['application/json', 'application/hal+json', 'application/json; charset=utf-8'].each do |content_type|
        it "is set to the exact selected Content-Type '#{content_type}'" do
          result = MLEUtility.encrypt_request_payload(merchant_config, sample_payload, content_type)
          jwe = extract_jwe(result)
          header = decode_header(jwe)

          expect(header['cty']).to eq(content_type)
          expect(header['alg']).to eq('RSA-OAEP-256')
          expect(header['enc']).to eq('A256GCM')
          expect(header['kid']).to eq(expected_kid)
          expect(header).not_to have_key('typ')

          decrypted = AuthJWEUtility.decrypt_jwe_using_private_key(private_jwk, jwe)
          expect(decrypted).to eq(sample_payload)
        end
      end

      it 'is omitted when the caller does not supply a content type' do
        result = MLEUtility.encrypt_request_payload(merchant_config, sample_payload)
        header = decode_header(extract_jwe(result))

        expect(header).not_to have_key('cty')
      end

      it 'is omitted when the caller supplies a blank content type' do
        result = MLEUtility.encrypt_request_payload(merchant_config, sample_payload, '   ')
        header = decode_header(extract_jwe(result))

        expect(header).not_to have_key('cty')
      end
    end

    context 'empty JSON object body' do
      it 'encrypts the bodyless-POST sentinel and decrypts back to the literal JSON object {}' do
        result = MLEUtility.encrypt_request_payload(merchant_config, '{}', 'application/json')
        jwe = extract_jwe(result)
        header = decode_header(jwe)

        expect(header['cty']).to eq('application/json')

        decrypted = AuthJWEUtility.decrypt_jwe_using_private_key(private_jwk, jwe)
        expect(decrypted).to eq('{}')
      end
    end

    context 'HTTP Signature authentication without a certificate' do
      it 'falls back to the unencrypted payload' do
        config = double(
          'MerchantConfig',
          merchantId: 'testrest',
          authenticationType: 'http_signature',
          mleForRequestPublicCertPath: nil,
          p12KeyFilePath: nil,
          log_config: double(
            'LogConfiguration', enableLog: false, loggingLevel: nil, logDirectory: nil,
            logFilename: nil, maxLogSize: nil, maxLogFiles: nil, enableMasking: false
          )
        )

        result = MLEUtility.encrypt_request_payload(config, sample_payload, 'application/json')
        expect(result).to eq(sample_payload)
      end
    end
  end
end
