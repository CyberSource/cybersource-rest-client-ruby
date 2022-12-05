#!/bin/bash
echo $0

# Delete the previously generated SDK code

rm -rf ../docs
rm -rf ../lib/cybersource_rest_client/api
rm -rf ../lib/cybersource_rest_client/models
rm -rf ../spec
rm ../lib/cybersource_rest_client.rb

# Command to generate SDK

java -jar swagger-codegen-cli-2.2.3.jar generate -t cybersource-ruby-template -i cybersource-rest-spec.json -l ruby -o ../ -c cybersource-ruby-config.json

sed -i "s|select_header_content_type(\["\'"application\/json;charset=utf-8|select_header_content_type(\["\'"\*\/\*|g" ../lib/cybersource_rest_client/api/secure_file_share_api.rb
#sed -i 's/$/\r/' ../lib/cybersource_rest_client/api/secure_file_share_api.rb

# to rename error__links to error_links

sed -i "s|cybersource_rest_client/models/error__links|cybersource_rest_client/models/error_links|g" ../lib/cybersource_rest_client.rb

# to rename long file name

mv ../lib/cybersource_rest_client/models/ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction.rb ../lib/cybersource_rest_client/models/ptsv2payments_merchant_initiated_transaction.rb

mv ../lib/cybersource_rest_client/models/reporting_v3_interchange_clearing_level_details_get200_response_interchange_clearing_level_details.rb ../lib/cybersource_rest_client/models/reporting_get200_response_interchange_clearing_level_details.rb

# mv ../lib/cybersource_rest_client/models/risk_v1_authentication_exemptions_post201_response_consumer_authentication_information_strong_authentication.rb ../lib/cybersource_rest_client/models/risk_v1_authentication_exemptions_consumer_authentication_information_strong_authentication.r

# mv ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded__embedded_instrument_identifier.rb   ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_embedded_instrument_identifier.rb

mv ../lib/cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_processing_information_authorization_options_initiator_merchant_initiated_transaction.rb  ../lib/cybersource_rest_client/models/tmsv2customers__embedded_merchant_initiated_transaction.rb

# If this line fails, it is because of the long filepath. Either manually change the filename OR reduce the directory nesting on the repository.

mv ../lib/cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_processing_information_authorization_options_initiator.rb ../lib/cybersource_rest_client/models/tmsv2customers__embedded_authorization_options_initiator.rb

# mv ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_buyer_information_personal_identification.rb   ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_personal_identification.rb

# mv ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_processing_information_bank_transfer_options.rb  ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_bank_transfer_options.rb

# mv ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_merchant_information_merchant_descriptor.rb   ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_merchant_descriptor.rb

# mv ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_buyer_information_issued_by.rb ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_buyer_information_issued_by.rb

# mv ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_instrument_identifier.rb ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_instrument_identifier.rb

# mv ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_merchant_information.rb  ../lib/cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_merchant_information.rb

mv ../lib/cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier__links_payment_instruments.rb  ../lib/cybersource_rest_client/models/tmsv2customers__embedded_payment_instruments.rb

mv ../lib/cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_processing_information.rb  ../lib/cybersource_rest_client/models/tmsv2customers__embedded_processing_information.rb

mv ../lib/cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_processing_information_authorization_options.rb  ../lib/cybersource_rest_client/models/tmsv2customers__embedded_authorization_options.rb

mv ../lib/cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_tokenized_card.rb  ../lib/cybersource_rest_client/models/tmsv2customers__embedded_tokenized_card.rb

mv ../lib/cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_tokenized_card_card.rb  ../lib/cybersource_rest_client/models/tmsv2customers__embedded_tokenized_card_card.rb

mv ../lib/cybersource_rest_client/models/pts_v2_payments_post201_response_consumer_authentication_information_strong_authentication_issuer_information.rb ../lib/cybersource_rest_client/models/pts_v2_payments_post201_response_consumer_authentication_information_issuer_information.rb

mv ../docs/Ptsv2paymentsProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.md ../docs/Ptsv2paymentsMerchantInitiatedTransaction.md

mv ../docs/Tmsv2customersEmbeddedDefaultPaymentInstrumentEmbeddedInstrumentIdentifierProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.md ../docs/Tmsv2customersEmbeddedMerchantInitiatedTransaction.md

mv ../spec/models/ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction_spec.rb ../spec/models/ptsv2payments_merchant_initiated_transaction_spec.rb

mv ../spec/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_processing_information_authorization_options_initiator_merchant_initiated_transaction_spec.rb ../spec/models/tmsv2customers__embedded_merchant_initiated_transaction_spec.rb

mv ../lib/cybersource_rest_client/models/risk_v1_address_verifications_post201_response_address_verification_information_standard_address_address1.rb ../lib/cybersource_rest_client/models/risk_v1_address_verifications_post201_response_address1.rb

mv ../lib/cybersource_rest_client/models/risk_v1_export_compliance_inquiries_post201_response_export_compliance_information_watch_list_matches.rb ../lib/cybersource_rest_client/models/risk_v1_export_compliance_inquiries_post201_response_watch_list_matches.rb

sed -i "s|cybersource_rest_client/models/ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction|cybersource_rest_client/models/ptsv2payments_merchant_initiated_transaction|g" ../lib/cybersource_rest_client.rb

# sed -i "s|cybersource_rest_client/models/risk_v1_authentication_exemptions_post201_response_consumer_authentication_information_strong_authentication|cybersource_rest_client/models/risk_v1_authentication_exemptions_consumer_authentication_information_strong_authentication|g" ../lib/cybersource_rest_client.rb

# sed -i "s|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded__embedded_instrument_identifier|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_embedded_instrument_identifier|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_processing_information_authorization_options_initiator_merchant_initiated_transaction|cybersource_rest_client/models/tmsv2customers__embedded_merchant_initiated_transaction|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/reporting_v3_interchange_clearing_level_details_get200_response_interchange_clearing_level_details|cybersource_rest_client/models/reporting_get200_response_interchange_clearing_level_details|g" ../lib/cybersource_rest_client.rb

# sed -i "s|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_processing_information_bank_transfer_options|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_bank_transfer_options|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_processing_information_authorization_options_initiator|cybersource_rest_client/models/tmsv2customers__embedded_authorization_options_initiator|g" ../lib/cybersource_rest_client.rb

# sed -i "s|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_buyer_information_personal_identification|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_personal_identification|g" ../lib/cybersource_rest_client.rb

# sed -i "s|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_merchant_information_merchant_descriptor|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_merchant_descriptor|g" ../lib/cybersource_rest_client.rb

# sed -i "s|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_buyer_information_issued_by|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_buyer_information_issued_by|g" ../lib/cybersource_rest_client.rb

# sed -i "s|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_instrument_identifier|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_instrument_identifier|g" ../lib/cybersource_rest_client.rb

# sed -i "s|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_merchant_information|cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_merchant_information|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier__links_payment_instruments|cybersource_rest_client/models/tmsv2customers__embedded_payment_instruments|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_processing_information_authorization_options|cybersource_rest_client/models/tmsv2customers__embedded_authorization_options|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_processing_information|cybersource_rest_client/models/tmsv2customers__embedded_processing_information|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_tokenized_card_card|cybersource_rest_client/models/tmsv2customers__embedded_tokenized_card_card|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/pts_v2_payments_post201_response_consumer_authentication_information_strong_authentication_issuer_information|cybersource_rest_client/models/pts_v2_payments_post201_response_consumer_authentication_information_issuer_information|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/tmsv2customers__embedded_default_payment_instrument__embedded_instrument_identifier_tokenized_card|cybersource_rest_client/models/tmsv2customers__embedded_tokenized_card|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/risk_v1_address_verifications_post201_response_address_verification_information_standard_address_address1|cybersource_rest_client/models/risk_v1_address_verifications_post201_response_address1|g" ../lib/cybersource_rest_client.rb

sed -i "s|cybersource_rest_client/models/risk_v1_export_compliance_inquiries_post201_response_export_compliance_information_watch_list_matches|cybersource_rest_client/models/risk_v1_export_compliance_inquiries_post201_response_watch_list_matches|g" ../lib/cybersource_rest_client.rb
sed -i 's/$/\r/' ../lib/cybersource_rest_client.rb

#set +v vecho off
#set +v setlocal enableextensions enabledelayedexpansion

#for -f "tokens=1* delims=\" %%A in (
#for files ../lib/AuthenticationSDK/*.rb  "cmd . echo set +v relpath"
# ) do for %%F in (^"%%B) do (
#   export original=%%~F
#   .export removed=%%original:spec=%%
#   if !removed=%%~F (
# #echo NOT PROCESSED
#   ) else (
# if "$testVar = \"!original!\"
# then
# sed -i "s+$fileContents[11]+$fileContents[11]+\"`r`nrequire 'AuthenticationSDK/\"+g;s+\"\\\"+\"/\"+g"; $fileContents ../lib/cybersource_rest_client.rb
#   )
# )

# sed -i "s+require \'\'cybersource_rest_client/api/download_dtd_api\'\'++g;s+require \'\'cybersource_rest_client/api/download_xsd_api\'\'++g" ../lib/cybersource_rest_client.rb"

# to remove beginning / from loc_var_path in all the api files

cd ../lib/cybersource_rest_client/api
for file in ./*.rb; do \
	sed -i "s|local_var_path = "\'"/|local_var_path = "\'"|g" "$file"
	sed -i 's/$/\r/' "$file"
done

cd ../../../

git checkout README.md
git checkout cybersource_rest_client.gemspec

git checkout lib/cybersource_rest_client/api/o_auth_api.rb
git checkout lib/cybersource_rest_client/models/access_token_response.rb
git checkout lib/cybersource_rest_client/models/bad_request_error.rb
git checkout lib/cybersource_rest_client/models/create_access_token_request.rb
git checkout lib/cybersource_rest_client/models/resource_not_found_error.rb
git checkout lib/cybersource_rest_client/models/unauthorized_client_error.rb

git checkout docs/OAuthApi.md
git checkout docs/AccessTokenResponse.md
git checkout docs/BadRequestError.md
git checkout docs/CreateAccessTokenRequest.md
git checkout docs/ResourceNotFoundError.md
git checkout docs/UnauthorizedClientError.md

git checkout spec/api/o_auth_api_spec.rb
git checkout spec/models/access_token_response_spec.rb
git checkout spec/models/bad_request_error_spec.rb
git checkout spec/models/create_access_token_request_spec.rb
git checkout spec/models/resource_not_found_error_spec.rb
git checkout spec/models/unauthorized_client_error_spec.rb
