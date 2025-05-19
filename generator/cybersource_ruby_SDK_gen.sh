#!/bin/bash
echo $0
set -xe
python replaceFieldNameFromRequestBody.py -i cybersource-rest-spec.json > replaceFieldLogs.log
set +xe
rm replaceFieldLogs.log


# Delete the previously generated SDK code

rm -rf ../docs
rm -rf ../lib/cybersource_rest_client/api
rm -rf ../lib/cybersource_rest_client/models
rm -rf ../spec
rm ../lib/cybersource_rest_client.rb

# Command to generate SDK

java -jar swagger-codegen-cli-2.4.38.jar generate -t cybersource-ruby-template -i cybersource-rest-spec-ruby.json -l ruby -o ../ -c cybersource-ruby-config.json

sed -i "s|select_header_content_type(\["\'"application\/json;charset=utf-8|select_header_content_type(\["\'"\*\/\*|g" ../lib/cybersource_rest_client/api/secure_file_share_api.rb
#sed -i 's/$/\r/' ../lib/cybersource_rest_client/api/secure_file_share_api.rb

# to rename error__links to error_links

sed -i "s|cybersource_rest_client/models/error__links|cybersource_rest_client/models/error_links|g" ../lib/cybersource_rest_client.rb


sed -i 's/$/\r/' ../lib/cybersource_rest_client.rb

# to rename long file name
mv ../lib/cybersource_rest_client/models/ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction.rb ../lib/cybersource_rest_client/models/ptsv2payments_merchant_initiated_transaction.rb
mv ../spec/models/ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction_spec.rb ../spec/models/ptsv2payments_merchant_initiated_transaction_spec.rb
sed -i "s|cybersource_rest_client/models/ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction|cybersource_rest_client/models/ptsv2payments_merchant_initiated_transaction|g" ../lib/cybersource_rest_client.rb

mv ../lib/cybersource_rest_client/models/reporting_v3_interchange_clearing_level_details_get200_response_interchange_clearing_level_details.rb ../lib/cybersource_rest_client/models/reporting_get200_response_interchange_clearing_level_details.rb
sed -i "s|cybersource_rest_client/models/reporting_v3_interchange_clearing_level_details_get200_response_interchange_clearing_level_details|cybersource_rest_client/models/reporting_get200_response_interchange_clearing_level_details|g" ../lib/cybersource_rest_client.rb

mv ../lib/cybersource_rest_client/models/risk_v1_address_verifications_post201_response_address_verification_information_standard_address_address1.rb ../lib/cybersource_rest_client/models/risk_v1_address_verifications_post201_response_address1.rb
sed -i "s|cybersource_rest_client/models/risk_v1_address_verifications_post201_response_address_verification_information_standard_address_address1|cybersource_rest_client/models/risk_v1_address_verifications_post201_response_address1|g" ../lib/cybersource_rest_client.rb

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

# replace hashValue fieldName to hash for supporting hash field name in request body
cd ./lib/cybersource_rest_client/models
echo "starting of replacing the hash keyword in models"
for file in ./*.rb; do \
    sed -i 's/attr_accessor :sdk_hash_value/attr_accessor :hash \n \t alias :sdk_hash_value :hash/g' "$file"
    sed -i "s/:'sdk_hash_value' => :'sdkHashValue'/:'sdk_hash_value' => :'hash'/g" "$file"
    sed -i "s/:'sdk_hash_value' => :'sdk_hash_value'/:'sdk_hash_value' => :'hash'/g" "$file"
done
echo "completed the task of replacing the hash keyword in models"
