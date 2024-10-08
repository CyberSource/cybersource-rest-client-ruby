# CyberSource::Ptsv2paymentsidClientReferenceInformationPartner

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**original_transaction_id** | **String** | Value that links the previous transaction to the current follow-on request. This value is assigned by the client software that is installed on the POS terminal, which makes it available to the terminal&#39;s software and to CyberSource. Therefore, you can use this value to reconcile transactions between CyberSource and the terminal&#39;s software.  CyberSource does not forward this value to the processor. Instead, the value is forwarded to the CyberSource reporting functionality.  This field is supported only on these processors: - American Express Direct - Credit Mutuel-CIC - FDC Nashville Global - OmniPay Direct - SIX  Optional field.  | [optional] 
**developer_id** | **String** | Identifier for the developer that helped integrate a partner solution to CyberSource.  Send this value in all requests that are sent through the partner solutions built by that developer. CyberSource assigns the ID to the developer.  **Note** When you see a developer ID of 999 in reports, the developer ID that was submitted is incorrect.  | [optional] 
**solution_id** | **String** | Identifier for the partner that is integrated to CyberSource.  Send this value in all requests that are sent through the partner solution. CyberSource assigns the ID to the partner.  **Note** When you see a solutionId of 999 in reports, the solutionId that was submitted is incorrect.  | [optional] 


