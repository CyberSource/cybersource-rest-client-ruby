# CyberSource::PaymentsProductsSecureAcceptanceConfigurationInformationConfigurationsNotificationsMerchantNotifications

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**backoffice_post_enabled** | **BOOLEAN** | Enables Webhook transaction confirmation messages sent to URL defined in backofficePostUrl. Usually enabled by web developers integrating to Secure Acceptance. | [optional] 
**backoffice_email_address** | **String** | Email address to receive transaction confirmation messages. | [optional] 
**backoffice_email_enabled** | **BOOLEAN** | Enables email transaction confirmation messages, sent to the address specified in backofficeEmailAddress. | [optional] 
**backoffice_post_url** | **String** | Webhook URL to which transaction confirmation is sent. Usually completed by the web developers integrating to Secure Acceptance. | [optional] 
**card_number_format** | **String** | Format in which the card number should be masked in the notifications.   Valid values: &#x60;1&#x60; - Display first 6 digits only (e.g. \&quot;444433**********\&quot;)  &#x60;2&#x60; - Display last four digits only (e.g. \&quot;************1111\&quot;)  &#x60;3&#x60; - Display First six and last four digits (e.g. \&quot;444433******1111\&quot;)  | [optional] 


