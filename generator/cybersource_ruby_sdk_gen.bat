mkdir %~dp0Ruby
cd %~dp0
java -jar swagger-codegen-cli-2.2.3.jar generate -t cybersource-ruby-template -i cybersource-rest-spec.json -l ruby -o Ruby -c %~dp0cybersource-ruby-config.json 

pause




