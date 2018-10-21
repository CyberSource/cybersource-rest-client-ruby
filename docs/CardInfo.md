# CyberSource::CardInfo

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**card_number** | **String** | Encrypted or plain text card number. If the encryption type of “None” was used in the Generate Key request, this value can be set to the plaintext card number/Personal Account Number (PAN). If the encryption type of RsaOaep256 was used in the Generate Key request, this value needs to be the RSA OAEP 256 encrypted card number. The card number should be encrypted on the cardholders’ device. The [WebCrypto API] (https://github.com/CyberSource/cybersource-flex-samples/blob/master/java/spring-boot/src/main/resources/public/flex.js) can be used with the JWK obtained in the Generate Key request. | [optional] 
**card_expiration_month** | **String** | Two digit expiration month | [optional] 
**card_expiration_year** | **String** | Four digit expiration year | [optional] 
**card_type** | **String** | Card Type. This field is required. Refer to the CyberSource Credit Card Services documentation for supported card types. | [optional] 


