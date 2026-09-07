# CyberSource::UnifiedriskTransaction

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**transaction_id** | **String** | Unique identifier for the transaction being assessed | [optional] 
**status** | **String** | Transaction status: NEW, APPROVED, DECLINED, REVERSED, FRAUD | [optional] 
**status_reason** | **String** | Reason code for the transaction status | [optional] 
**message_type** | **String** | Message type: AUTHORIZATION, INQUIRY, ADVICE, REVERSAL | [optional] 
**type** | **String** | The type of transaction being processed | [optional] 
**attribute** | **String** | Transaction attribute: AGGREGATION, CARDLESS_ATM, etc | [optional] 
**initiator** | **String** | Who initiated transaction: MERCHANT, CUSTOMER | [optional] 
**channel** | **String** | Channel used: ONLINE, MOBILE, ATM, BRANCH, etc | [optional] 
**timestamp** | **DateTime** | Local transaction timestamp without timezone | [optional] 
**cutoff_date_time** | **DateTime** | Cutoff date/time for event or journey | [optional] 
**is_recurring** | **BOOLEAN** | Indicates if this is a recurring transaction | [optional] 
**pre_order** | **BOOLEAN** | Indicates if this is a pre-order | [optional] 
**pre_order_date** | **Date** | Expected availability date for pre-order | [optional] 
**reordered** | **BOOLEAN** | Indicates if customer is reordering | [optional] 
**destination_country** | **String** | Destination country for funds | [optional] 
**decline_phase** | **String** | Phase where transaction was declined | [optional] 
**trusted_merchant** | **BOOLEAN** | Indicates if merchant is on trusted list | [optional] 
**additional_fees** | [**UnifiedriskTransactionAdditionalFees**](UnifiedriskTransactionAdditionalFees.md) |  | [optional] 
**amount** | [**UnifiedriskTransactionAmount**](UnifiedriskTransactionAmount.md) |  | [optional] 
**recurring_details** | [**UnifiedriskTransactionRecurringDetails**](UnifiedriskTransactionRecurringDetails.md) |  | [optional] 
**direction** | **String** | Direction of the transaction flow relative to the customer&#39;s account (e.g., CREDIT for incoming funds, DEBIT for outgoing funds). Determines risk model orientation and velocity tracking | [optional] 
**is_chargeback** | **BOOLEAN** | Indicates whether this transaction represents a chargeback or dispute reversal. True signals a disputed transaction requiring fraud investigation and issuer liability assessment | [optional] 
**fraud_liability** | **String** | Indicates which party bears fraud liability for this transaction (e.g., ISSUER, MERCHANT, ACQUIRER). Liability shifts apply in 3DS-authenticated or EMV chip transactions | [optional] 
**on_us_flag** | **BOOLEAN** | Indicates whether the transaction is an on-us transaction where the issuing and acquiring institutions are the same entity. On-us transactions may follow different risk rules and processing paths | [optional] 
**number_of_transactions** | **Integer** | Total count of transactions associated with this batch, order, or session. Used for velocity-based risk rules and aggregated fraud monitoring | [optional] 
**batch_details** | [**UnifiedriskTransactionBatchDetails**](UnifiedriskTransactionBatchDetails.md) |  | [optional] 
**check_details** | [**UnifiedriskTransactionCheckDetails**](UnifiedriskTransactionCheckDetails.md) |  | [optional] 
**purpose** | **String** | Business purpose or reason code for this transaction (e.g., PURCH for purchase, SALA for salary, REFND for refund). Used for transaction classification and AML monitoring | [optional] 


