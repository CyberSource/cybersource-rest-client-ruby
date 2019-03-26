@echo off 

cd %~dp0
 
java -jar swagger-codegen-cli-2.2.3.jar generate -t cybersource-ruby-template -i cybersource-rest-spec.json -l ruby -o ../ -c %~dp0cybersource-ruby-config.json 

 REM to rename error__links to error_links
powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/error__links', 'cybersource_rest_client/models/error_links' } | Set-Content ..\lib\cybersource_rest_client.rb"

 REM accept type header modifications
powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\capture_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\capture_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\credit_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\credit_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\payments_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\payments_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\process_a_payout_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\process_a_payout_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\refund_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\refund_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\reversal_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\reversal_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\transaction_details_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\transaction_details_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\user_management_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\user_management_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\void_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json', 'select_header_accept([''application/hal+json' } | Set-Content ..\lib\cybersource_rest_client\api\void_api.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\search_transactions_api.rb) | ForEach-Object { $_ -replace 'select_header_accept\(\[''application/json;charset=utf-8', 'select_header_accept([''*/*'} | Set-Content ..\lib\cybersource_rest_client\api\search_transactions_api.rb"

 REM to change accept type header
powershell -Command "(Get-Content ..\lib\cybersource_rest_client\api\secure_file_share_api.rb) | ForEach-Object { $_ -replace 'select_header_content_type\(\[''application/json;charset=utf-8', 'select_header_content_type([''*/*' } | Set-Content ..\lib\cybersource_rest_client\api\secure_file_share_api.rb"

REM to rename long file name

del ..\lib\cybersource_rest_client\models\ptsv2payments_merchant_initiated_transaction.rb
del ..\lib\cybersource_rest_client\models\tmsv1instrumentidentifiers_merchant_initiated_transaction.rb
del ..\docs\Ptsv2paymentsMerchantInitiatedTransaction.md
del ..\docs\Tmsv1instrumentidentifiersMerchantInitiatedTransaction.md
del ..\spec\models\ptsv2payments_merchant_initiated_transaction_spec.rb
del ..\spec\models\tmsv1instrumentidentifiers_merchant_initiated_transaction_spec.rb

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction.rb  -newname ptsv2payments_merchant_initiated_transaction.rb"

powershell -Command " rename-item -Path ..\lib\cybersource_rest_client\models\tmsv1instrumentidentifiers_processing_information_authorization_options_initiator_merchant_initiated_transaction.rb  -newname tmsv1instrumentidentifiers_merchant_initiated_transaction.rb"

powershell -Command " rename-item -Path ..\docs\Ptsv2paymentsProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.md  -newname Ptsv2paymentsMerchantInitiatedTransaction.md"

powershell -Command " rename-item -Path ..\docs\Tmsv1instrumentidentifiersProcessingInformationAuthorizationOptionsInitiatorMerchantInitiatedTransaction.md  -newname Tmsv1instrumentidentifiersMerchantInitiatedTransaction.md"

powershell -Command " rename-item -Path ..\spec\models\ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction_spec.rb  -newname ptsv2payments_merchant_initiated_transaction_spec.rb"

powershell -Command " rename-item -Path ..\spec\models\tmsv1instrumentidentifiers_processing_information_authorization_options_initiator_merchant_initiated_transaction_spec.rb  -newname tmsv1instrumentidentifiers_merchant_initiated_transaction_spec.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/ptsv2payments_processing_information_authorization_options_initiator_merchant_initiated_transaction', 'cybersource_rest_client/models/ptsv2payments_merchant_initiated_transaction' } | Set-Content ..\lib\cybersource_rest_client.rb"

powershell -Command "(Get-Content ..\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/tmsv1instrumentidentifiers_processing_information_authorization_options_initiator_merchant_initiated_transaction', 'cybersource_rest_client/models/tmsv1instrumentidentifiers_merchant_initiated_transaction' } | Set-Content ..\lib\cybersource_rest_client.rb"

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

REM to remove beginning / from loc_var_path in all the api files
cd ..\lib\cybersource_rest_client\api
powershell -Command "&{$configFiles = Get-ChildItem . *.rb -rec;  foreach ($file in $configFiles){ (Get-Content $file.PSPath) | Foreach-Object { $_ -replace 'local_var_path = ''/', 'local_var_path = '''} | Set-Content $file.PSPath }}"

cd %~dp0\..

git checkout README.md
git checkout cybersource_rest_client.gemspec

pause