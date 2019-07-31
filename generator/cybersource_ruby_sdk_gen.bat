@echo off 

cd %~dp0

REM Delete the previously generated SDK code

rd /s /q ..\docs
rd /s /q ..\lib\cybersource_rest_client
rd /s /q ..\spec
del ..\lib\cybersource_rest_client.rb

REM Command to generate SDK
 
java -jar swagger-codegen-cli-2.2.3.jar generate -t cybersource-ruby-template -i cybersource-rest-spec.json -l ruby -o ../ -c %~dp0cybersource-ruby-config.json 

REM to rename error__links to error_links
powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/error__links', 'cybersource_rest_client/models/error_links' } | Set-Content ..\lib\cybersource_rest_client.rb"

 REM accept type header modifications
powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\capture_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\capture_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\credit_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\credit_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\payments_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\payments_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\payouts_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\payouts_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\refund_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\refund_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\reversal_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\reversal_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\transaction_details_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\transaction_details_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\user_management_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\user_management_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\void_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\void_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\search_transactions_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json;charset=utf-8', 'select_header_accept([''*/*'} | Set-Content ..\lib\cybersource_rest_client\api\search_transactions_api.rb"

REM powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\payer_authentication_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json;charset=utf-8', 'select_header_accept([''application/hal+json;charset=utf-8'} | Set-Content ..\lib\cybersource_rest_client\api\payer_authentication_api.rb"

 REM to change accept type header
powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\secure_file_share_api.rb) | ForEach-Object { $_ -replace 'select_header_content_type\(\[''application/json;charset=utf-8', 'select_header_content_type([''*/*' } | Set-Content ..\lib\cybersource_rest_client\api\secure_file_share_api.rb"

REM to rename long file name

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction.rb  -newname ptsv2payments_merchant_initiated_transaction.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_post200_response_processing_information_authorization_options_initiator_merchant_initiated_transaction.rb  -newname tms_v1_instrument_identifiers_post200_response_merchant_initiated_transaction.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_post200_response_processing_information_authorization_options_initiator.rb  -newname tms_v1_instrument_identifiers_post200_response_authorization_options_initiator.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_buyer_information_personal_identification.rb  -newname tms_v1_instrument_identifiers_payment_instruments_get200_response_personal_identification.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_processing_information_bank_transfer_options.rb  -newname tms_v1_instrument_identifiers_payment_instruments_get200_response_bank_transfer_options.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_merchant_information_merchant_descriptor.rb  -newname tms_v1_instrument_identifiers_payment_instruments_get200_response_merchant_descriptor.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_buyer_information_issued_by.rb  -newname tms_v1_instrument_identifiers_payment_instruments_get200_response_buyer_information_issued_by.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_instrument_identifier.rb  -newname tms_v1_instrument_identifiers_payment_instruments_get200_response_instrument_identifier.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_merchant_information.rb  -newname tms_v1_instrument_identifiers_payment_instruments_get200_response_merchant_information.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_payment_instruments.rb  -newname tms_v1_instrument_identifiers_payment_instruments_get200_response_payment_instruments.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_processing_information.rb  -newname tms_v1_instrument_identifiers_payment_instruments_get200_response_processing_information.rb"

powershell -Command " rename-item -Path ..\docs\Ptsv2paymentsProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.md  -newname Ptsv2paymentsMerchantInitiatedTransaction.md"

powershell -Command " rename-item -Path ..\docs\TmsV1InstrumentIdentifiersPost200ResponseProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.md  -newname TmsV1InstrumentIdentifiersPost200ResponseMerchantInitiatedTransaction.md"

powershell -Command " rename-item -Path ..\spec\models\ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction_spec.rb  -newname ptsv2payments_merchant_initiated_transaction_spec.rb"

powershell -Command " rename-item -Path ..\spec\models\tms_v1_instrument_identifiers_post200_response_processing_information_authorization_options_initiator_merchant_initiated_transaction_spec.rb  -newname tmsv1instrumentidentifiers_merchant_initiated_transaction_spec.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction', 'cybersource_rest_client/models/ptsv2payments_merchant_initiated_transaction' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_post200_response_processing_information_authorization_options_initiator', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_post200_response_authorization_options_initiator' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_processing_information_bank_transfer_options', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_bank_transfer_options' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_post200_response_authorization_options_initiator_merchant_initiated_transaction', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_post200_response_merchant_initiated_transaction' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_buyer_information_personal_identification', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_personal_identification' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_merchant_information_merchant_descriptor', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_merchant_descriptor' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_buyer_information_issued_by', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_buyer_information_issued_by' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_instrument_identifier', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_instrument_identifier' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_merchant_information', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_merchant_information' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_payment_instruments', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_payment_instruments' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response__embedded_processing_information', 'cybersource_rest_client/models/tms_v1_instrument_identifiers_payment_instruments_get200_response_processing_information' } | Set-Content ..\lib\cybersource_rest_client.rb"

REM @echo off
@setlocal enableextensions enabledelayedexpansion

for /f "tokens=1* delims=\" %%A in (
  'forfiles /s /m *.rb /p ..\lib\AuthenticationSDK /c "cmd /c echo @relpath"'
) do for %%F in (^"%%B) do (
  set original=%%~F
  call set removed=%%original:spec=%%
  if not !removed!==%%~F (
	REM echo NOT PROCESSED
  ) else (
	powershell -Command "$testVar = \"!original!\" ; $fileContents = (get-content ..\lib\cybersource_rest_client.rb) ; $fileContents[11] = $fileContents[11]+\"`r`nrequire 'AuthenticationSDK/\"+$testVar.replace(\"\\\",\"/\")+\"'\"; $fileContents|Set-Content ..\lib\cybersource_rest_client.rb"
  )
)

powershell -Command "(get-content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'require ''cybersource_rest_client/api/download_dtd_api''', '' } | ForEach-Object { $_ -replace 'require ''cybersource_rest_client/api/download_xsd_api''', '' } | Set-Content ..\lib\cybersource_rest_client.rb"

REM to remove beginning / from loc_var_path in all the api files
cd ..\lib\cybersource_rest_client\api
powershell -Command "&{$configFiles = Get-ChildItem . *.rb -rec;  foreach ($file in $configFiles){ (Get-Content $file.PSPath) | Foreach-Object { $_ -replace 'local_var_path = ''/', 'local_var_path = '''} | Set-Content $file.PSPath }}"

cd %~dp0\..

git checkout README.md
git checkout cybersource_rest_client.gemspec

pause