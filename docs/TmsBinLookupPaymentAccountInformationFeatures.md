# CyberSource::TmsBinLookupPaymentAccountInformationFeatures

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**account_funding_source** | **String** | This field contains the account funding source. Possible values:   - &#x60;CREDIT&#x60;   - &#x60;DEBIT&#x60;   - &#x60;PREPAID&#x60;   - &#x60;DEFERRED DEBIT&#x60;   - &#x60;CHARGE&#x60;  | [optional] 
**account_funding_source_sub_type** | **String** | This field contains the type of prepaid card. Possible values:   - &#x60;Reloadable&#x60;   - &#x60;Non-reloadable&#x60;  | [optional] 
**card_product** | **String** | This field contains the type of issuer product. Example values:   - Visa Classic   - Visa Signature   - Visa Infinite  | [optional] 
**message_type** | **String** | This field contains the type of BIN based authentication. Possible values:   - &#x60;S&#x60;: Single Message   - &#x60;D&#x60;: Dual Message  | [optional] 
**acceptance_level** | **String** | This field contains the acceptance level of the PAN. Possible values:   - &#x60;0&#x60; : Normal   - &#x60;1&#x60; : Monitor   - &#x60;2&#x60; : Refuse   - &#x60;3&#x60; : Not Allowed   - &#x60;4&#x60; : Private   - &#x60;5&#x60; : Test  | [optional] 
**card_platform** | **String** | This field contains the type of card platform. Possible values:   - &#x60;BUSINESS&#x60;   - &#x60;CONSUMER&#x60;   - &#x60;CORPORATE&#x60;   - &#x60;COMMERCIAL&#x60;   - &#x60;GOVERNMENT&#x60;  | [optional] 
**combo_card** | **String** | This field indicates the type of combo card. Possible values:   - 0 (Not a combo card)   - 1 (Credit and Prepaid Combo card)   - 2 (Credit and Debit Combo card)   - 3 (Prepaid Credit and Prepaid Debit combo card)  | [optional] 
**corporate_purchase** | **BOOLEAN** | This field indicates if the instrument can be used for corporate purchasing. This field is only applicable for American Express cards. Possible values:   - &#x60;true&#x60;   - &#x60;false&#x60;  | [optional] 
**health_card** | **BOOLEAN** | This field indicates if the BIN is for healthcare (HSA/FSA). Currently, this field is only supported for Visa BINs. Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**shared_bin** | **BOOLEAN** | This field indicates if the BIN is shared by multiple issuers Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**pos_domestic_only** | **BOOLEAN** | This field indicates if the BIN is valid only for POS domestic usage. Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**gambling_allowed** | **BOOLEAN** | This field indicates if gambling transactions are allowed on the BIN. Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**commercial_card_level2** | **BOOLEAN** | This field indicates if a transaction on the instrument qualifies for level 2 interchange rates. Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**commercial_card_level3** | **BOOLEAN** | This field indicates if a transaction on the instrument qualifies for level 3 interchange rates. Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**exempt_bin** | **BOOLEAN** | This field indicates if a transaction on the instrument qualifies for government exempt interchange fee. Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**account_level_management** | **BOOLEAN** | This field indicates if the BIN participates in Account Level Management (ALM). Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**online_gambling_block** | **BOOLEAN** | This field indicates if online gambling is blocked on the BIN. Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**auto_substantiation** | **BOOLEAN** | This field indicates if auto-substantiation is enabled on the BIN. Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 
**flex_credential** | **BOOLEAN** | This field indicates if the instrument is a flex credential. Possible values:     - &#x60;true&#x60;     - &#x60;false&#x60;  | [optional] 


