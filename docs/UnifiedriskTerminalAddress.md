# CyberSource::UnifiedriskTerminalAddress

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**address_line1** | **String** | First line of the terminal&#39;s physical address (street number and name), used for geographic risk analysis and terminal location verification | [optional] 
**address_line2** | **String** | Second line of the terminal&#39;s address for additional location details (building name, floor, suite) | [optional] 
**address_line3** | **String** | Third line of the terminal&#39;s address for further location details | [optional] 
**address_type** | **String** | Type classification of the terminal address (e.g., BRANCH, ATM_INDOOR, ATM_OUTDOOR, KIOSK). Used for terminal risk profiling | [optional] 
**country** | **String** | ISO 3166-1 alpha-3 country code for the terminal&#39;s physical location (e.g., GBR, USA, AUS) | [optional] 
**administrative_area** | **String** | State, province, or region of the terminal&#39;s physical location, used for regional fraud pattern analysis | [optional] 
**latitude** | **Float** | Geographic latitude coordinate of the terminal&#39;s physical location in decimal degrees, used for proximity and geolocation risk signals | [optional] 
**longitude** | **Float** | Geographic longitude coordinate of the terminal&#39;s physical location in decimal degrees, used for proximity and geolocation risk signals | [optional] 
**postal_code** | **String** | Postal code of the terminal&#39;s physical location, used for geographic risk clustering and distance-to-home fraud signals | [optional] 
**locality** | **String** | City or town of the terminal&#39;s physical location, used for regional risk analysis and cardholder distance calculation | [optional] 
**full_address** | **String** | Complete concatenated address of the terminal as a single string, including all lines, locality, postcode, and country | [optional] 


