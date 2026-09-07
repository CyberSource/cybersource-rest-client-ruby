# CyberSource::UnifiedriskPaymentCheck

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**check_number** | **String** | Serial number printed on the physical check, used for duplicate detection, check fraud prevention, and reconciliation | [optional] 
**deposit_slip_id** | **String** | Unique identifier for the deposit slip associated with the check deposit, used for linking deposited checks to branch transactions | [optional] 
**deposit_location** | [**UnifiedriskPaymentCheckDepositLocation**](UnifiedriskPaymentCheckDepositLocation.md) |  | [optional] 
**micr_account_number** | **String** | Account number encoded in the MICR (Magnetic Ink Character Recognition) line at the bottom of the check, used for automated account identification | [optional] 
**routing_transit_number** | **String** | Bank routing and transit number (RTN) encoded in the MICR line of the check, identifying the financial institution on which the check is drawn | [optional] 
**split_deposit_flag** | **BOOLEAN** | Indicates whether the check deposit has been split across multiple accounts. Split deposits may indicate structuring or kiting attempts | [optional] 
**split_account_id1** | **String** | First destination account ID in a split check deposit, used for tracking the allocation of funds across multiple accounts | [optional] 
**split_account_id2** | **String** | Second destination account ID in a split check deposit | [optional] 
**split_account_id3** | **String** | Third destination account ID in a split check deposit | [optional] 
**split_account_id4** | **String** | Fourth destination account ID in a split check deposit | [optional] 


