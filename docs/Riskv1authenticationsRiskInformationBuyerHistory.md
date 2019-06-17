# CyberSource::Riskv1authenticationsRiskInformationBuyerHistory

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**customer_account** | [**Riskv1authenticationsRiskInformationBuyerHistoryCustomerAccount**](Riskv1authenticationsRiskInformationBuyerHistoryCustomerAccount.md) |  | [optional] 
**account_history** | [**Riskv1authenticationsRiskInformationBuyerHistoryAccountHistory**](Riskv1authenticationsRiskInformationBuyerHistoryAccountHistory.md) |  | [optional] 
**account_purchases** | **Integer** | Number of purchases with this cardholder account during the previous six months. Recommended for Discover ProtectBuy.  | [optional] 
**add_card_attempts** | **Integer** | Number of add card attempts in the last 24 hours. Recommended for Discover ProtectBuy.  | [optional] 
**prior_suspicious_activity** | **BOOLEAN** | Indicates whether the merchant experienced suspicious activity (including previous fraud) on the account. Recommended for Discover ProtectBuy.  | [optional] 
**payment_account_history** | **String** | This only applies for NEW_ACCOUNT and EXISTING_ACCOUNT in creationHistory. Possible values are: - PAYMENT_ACCOUNT_EXISTS - PAYMENT_ACCOUNT_ADDED_NOW  | [optional] 
**payment_account_date** | **Integer** | Date applicable only for PAYMENT_ACCOUNT_EXISTS in paymentAccountHistory  | [optional] 
**transaction_count_day** | **Integer** | Number of transaction (successful or abandoned) for this cardholder account within the last 24 hours. Recommended for Discover ProtectBuy.  | [optional] 
**transaction_count_year** | **Integer** | Number of transaction (successful or abandoned) for this cardholder account within the last year. Recommended for Discover ProtectBuy.  | [optional] 


