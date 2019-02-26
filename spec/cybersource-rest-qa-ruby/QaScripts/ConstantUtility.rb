class ConstantUtility
    STATUS_AUTHORIZED = 'AUTHORIZED' unless const_defined?(:STATUS_AUTHORIZED)
    MESSAGE_AUTHORIZE = 'Assertion Failed since Status is UNAUTHORIZED' unless const_defined?(:MESSAGE_AUTHORIZE)

    STATUS_PENDING = 'PENDING' unless const_defined?(:STATUS_PENDING)
    MESSAGE_PENDING = 'Assertion Failed since Status is not PENDING' unless const_defined?(:MESSAGE_PENDING)

    STATUS_REVERSED = 'REVERSED' unless const_defined?(:STATUS_REVERSED)
    MESSAGE_REVERSED = 'Assertion Failed since Status is not REVERSED' unless const_defined?(:MESSAGE_REVERSED)

    STATUS_VOIDED = 'VOIDED' unless const_defined?(:STATUS_VOIDED)
    MESSAGE_VOIDED = 'Assertion Failed since Status is not VOIDED' unless const_defined?(:MESSAGE_VOIDED)

    STATUS_ACCEPTED = 'ACCEPTED' unless const_defined?(:STATUS_ACCEPTED)
    MESSAGE_ACCEPTED = 'Assertion Failed since Status is not ACCEPTED' unless const_defined?(:MESSAGE_ACCEPTED)

    STATE_ACTIVE = 'ACTIVE' unless const_defined?(:STATE_ACTIVE)
    MESSAGE_ACTIVE = 'Assertion Failed since Status is not ACTIVE' unless const_defined?(:MESSAGE_ACTIVE)
    
    MESSAGE_RESPONSE_CODE = 'Assertion Failed in Response code validation' unless const_defined?(:MESSAGE_RESPONSE_CODE)
    MESSAGE_NULL_ID = 'Assertion Failed since Payment ID is null' unless const_defined?(:MESSAGE_NULL_ID)
end