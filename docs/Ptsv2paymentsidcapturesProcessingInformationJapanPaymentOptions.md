# CyberSource::Ptsv2paymentsidcapturesProcessingInformationJapanPaymentOptions

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**payment_method** | **String** | This value is a 2-digit code indicating the payment method. Use Payment Method Code value that applies to the tranasction. - 10 (One-time payment) - 21, 22, 23, 24  (Bonus(one-time)payment) - 61 (Installment payment) - 31, 32, 33, 34  (Integrated (Bonus + Installment)payment) - 80 (Revolving payment)  | [optional] 
**bonuses** | **String** | Field contains the number of bonuses.  | [optional] 
**installments** | **String** | Number of Installments.  | [optional] 
**first_billing_month** | **String** | Billing month in MM format.  | [optional] 
**bonus_amount** | **String** | This field contains the bonus amount.  | [optional] 
**bonus_month** | **String** | This field contains the Japan specific first bonus month.  | [optional] 
**second_bonus_amount** | **String** | Field contains the second bonus amount.  | [optional] 
**second_bonus_month** | **String** | Field contains the Japan specific second bonus month.  | [optional] 


