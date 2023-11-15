
module CyberSource
    public
    class SdkTracker
        @@inclusion_list = [
            "CreateP12KeysRequest",
            "DeleteBulkP12KeysRequest",
            "CapturePaymentRequest",
            "CreateCreditRequest",
            "AddNegativeListRequest",
            "CreateBundledDecisionManagerCaseRequest",
            "FraudMarkingActionRequest",
            "CheckPayerAuthEnrollmentRequest",
            "PayerAuthSetupRequest",
            "ValidateRequest",
            "CreatePaymentRequest",
            "IncrementAuthRequest",
            "CreatePlanRequest",
            "RefundCaptureRequest",
            "RefundPaymentRequest",
            "AuthReversalRequest",
            "MitReversalRequest",
            "CreateSubscriptionRequest",
            "UpdateSubscription",
            "CreateSharedSecretKeysRequest",
            "CreateSharedSecretKeysVerifiRequest",
            "DeleteBulkSymmetricKeysRequest",
            "TaxRequest",
            "VoidTaxRequest",
            "ValidateExportComplianceRequest",
            "VerifyCustomerAddressRequest",
            "MitVoidRequest",
            "VoidCaptureRequest",
            "VoidCreditRequest",
            "VoidPaymentRequest",
            "VoidRefundRequest"
        ]

        def insert_developer_id_tracker(requestObj, requestClass, runEnvironment)
            if @@inclusion_list.include? requestClass
                developer_id_value = ''

                if runEnvironment == 'apitest.cybersource.com'
                    developer_id_value = '0KFKGFGT'
                else
                    developer_id_value = 'YDZP7DRQ'
                end

                tester = JSON.parse requestObj
                
                if !tester.include? "clientReferenceInformation"
                    tester['clientReferenceInformation'] = {}
                end

                if !tester['clientReferenceInformation'].include? "partner"
                    tester['clientReferenceInformation']['partner'] = {}
                end

                if !tester['clientReferenceInformation']['partner'].include? "developerId" ||
                    tester['clientReferenceInformation']['partner']['developerId'].nil? ||
                    tester['clientReferenceInformation']['partner']['developerId'].empty?
                    tester['clientReferenceInformation']['partner']['developerId'] = developer_id_value
                end

                requestObj = JSON.dump tester
            end

            return requestObj
        end
    end
end