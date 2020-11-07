# CyberSource::RiskV1AuthenticationSetupsPost201ResponseConsumerAuthenticationInformation

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**access_token** | **String** | JSON Web Token (JWT) used to authenticate the consumer with the authentication provider, such as, CardinalCommerce or Rupay. Note - Max Length of this field is 2048 characters.  | [optional] 
**reference_id** | **String** | This identifier represents cardinal has started device data collection session and this must be passed in Authentication JWT to Cardinal when invoking the deviceDataCollectionUrl.  | [optional] 
**device_data_collection_url** | **String** | The deviceDataCollectionUrl is the location to send the Authentication JWT when invoking the Device Data collection process.  | [optional] 


