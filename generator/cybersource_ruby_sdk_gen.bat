mkdir %~dp0Ruby
cd %~dp0
 
java -jar swagger-codegen-cli-2.2.3.jar generate -t cybersource-ruby-template -i cybersource-rest-spec.json -l ruby -o Ruby -c %~dp0cybersource-ruby-config.json 

powershell -Command "(Get-Content .\Ruby\lib\cybersource_rest_client.rb) | ForEach-Object { $_ -replace 'cybersource_rest_client/models/error__links', 'cybersource_rest_client/models/error_links' } | Set-Content .\Ruby\lib\cybersource_rest_client.rb"

cd Ruby\lib\cybersource_rest_client\api
powershell -Command "&{$configFiles = Get-ChildItem . *.rb -rec;  foreach ($file in $configFiles){ (Get-Content $file.PSPath) | Foreach-Object { $_ -replace 'local_var_path = ''/', 'local_var_path = '''} | Set-Content $file.PSPath }}"

pause