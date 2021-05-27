  class Constants

      GET_REQUEST_TYPE_LOWER = 'get' unless const_defined?(:GET_REQUEST_TYPE_LOWER)
      
      POST_REQUEST_TYPE_LOWER = 'post' unless const_defined?(:POST_REQUEST_TYPE_LOWER)
      
      PUT_REQUEST_TYPE_LOWER = 'put' unless const_defined?(:PUT_REQUEST_TYPE_LOWER)

      PATCH_REQUEST_TYPE_LOWER = 'patch' unless const_defined?(:PATCH_REQUEST_TYPE_LOWER)
      
      DELETE_REQUEST_TYPE_LOWER = 'delete' unless const_defined?(:DELETE_REQUEST_TYPE_LOWER)

      GET_REQUEST_TYPE = 'GET' unless const_defined?(:GET_REQUEST_TYPE)
      
      POST_REQUEST_TYPE = 'POST' unless const_defined?(:POST_REQUEST_TYPE)
      
      PUT_REQUEST_TYPE = 'PUT' unless const_defined?(:PUT_REQUEST_TYPE)

      PATCH_REQUEST_TYPE = 'PATCH' unless const_defined?(:PATCH_REQUEST_TYPE)
      
      DELETE_REQUEST_TYPE = 'DELETE' unless const_defined?(:DELETE_REQUEST_TYPE)

      V_C_MERCHANT_ID = 'v-c-merchant-id' unless const_defined?(:V_C_MERCHANT_ID)
      
      HOST = 'host' unless const_defined?(:HOST)
      
      DATE = 'date' unless const_defined?(:DATE)
      
      REQUEST_TARGET = '(request-target)' unless const_defined?(:REQUEST_TARGET)
      
      DIGEST = 'digest' unless const_defined?(:DIGEST)
      
      SIGNATURE = 'Signature' unless const_defined?(:SIGNATURE)
      
      HTTPS_URI_PREFIX = 'https://' unless const_defined?(:HTTPS_URI_PREFIX)
      
      BEARER = 'Bearer' unless const_defined?(:BEARER)
      
      MEDIA_TYPE_JSON = 'application/json' unless const_defined?(:MEDIA_TYPE_JSON)
      
      SIGNATURE_ALGORITHM = 'HmacSHA256' unless const_defined?(:SIGNATURE_ALGORITHM)
      
      ALGORITHM = "algorithm=\"" unless const_defined?(:ALGORITHM)
      
      SHA256 = 'SHA-256=' unless const_defined?(:SHA256)
      
      CONTENT_TYPE = 'Content-Type' unless const_defined?(:CONTENT_TYPE)
      
      USER_AGENT = 'User-Agent' unless const_defined?(:USER_AGENT)
      
      USER_AGENT_VALUE = 'Mozilla/5.0' unless const_defined?(:USER_AGENT_VALUE)
      
      KEY_ID = "keyid=\"" unless const_defined?(:KEY_ID)
      
      HEADERS_PARAM = "headers=\"" unless const_defined?(:HEADERS_PARAM)
      
      SIGNATURE_PARAM = "signature=\"" unless const_defined?(:SIGNATURE_PARAM)

      AUTH_TYPE_HTTP = 'HTTP_SIGNATURE' unless const_defined?(:AUTH_TYPE_HTTP)
      
      AUTH_TYPE_JWT = 'JWT' unless const_defined?(:AUTH_TYPE_JWT)

      AUTH_TYPE_OAUTH = 'OAUTH' unless const_defined?(:AUTH_TYPE_OAUTH)

      AUTH_TYPE_MUTUAL_AUTH = 'MUTUAL_AUTH' unless const_defined?(:AUTH_TYPE_MUTUAL_AUTH)

      RUN_ENV_SANDBOX = 'CYBERSOURCE.ENVIRONMENT.SANDBOX' unless const_defined?(:RUN_ENV_SANDBOX)

      RUN_ENV_MUTUAL_AUTH_SANDBOX = 'CYBERSOURCE.ENVIRONMENT.MUTUALAUTH.SANDBOX' unless const_defined?(:RUN_ENV_MUTUAL_AUTH_SANDBOX)
      
      RUN_ENV_PROD = 'CYBERSOURCE.ENVIRONMENT.PRODUCTION'unless const_defined?(:RUN_ENV_PROD)

      RUN_ENV_MUTUAL_AUTH_PROD = 'CYBERSOURCE.ENVIRONMENT.MUTUALAUTH.PRODUCTION' unless const_defined?(:RUN_ENV_MUTUAL_AUTH_PROD)

      RUN_ENV_SIT = 'CYBERSOURCE.ENVIRONMENT.SIT' unless const_defined?(:RUN_ENV_SIT)

      RUN_ENV_MUTUAL_AUTH_SIT = 'CYBERSOURCE.ENVIRONMENT.MUTUALAUTH.SIT' unless const_defined?(:RUN_ENV_MUTUAL_AUTH_SIT)

      SANDBOX_URL = 'apitest.cybersource.com' unless const_defined?(:SANDBOX_URL)

      SIT_URL = 'pnrstage.ic3.com:7448' unless const_defined?(:SIT_URL)

      MA_SIT_URL = 'pnrstage.ic3.com:8451' unless const_defined?(:MA_SIT_URL)

      MA_SANDBOX_URL = 'api-matest.cybersource.com' unless const_defined?(:MA_SANDBOX_URL)
      
      PRODUCTION_URL = 'api.cybersource.com' unless const_defined?(:PRODUCTION_URL)

      MA_PRODUCTION_URL = 'api-ma.cybersource.com' unless const_defined?(:MA_PRODUCTION_URL)

      BOA_RUN_ENV_SANDBOX = 'BANKOFAMERICA.ENVIRONMENT.SANDBOX' unless const_defined?(:BOA_RUN_ENV_SANDBOX)
      
      BOA_RUN_ENV_PROD = 'BANKOFAMERICA.ENVIRONMENT.PRODUCTION' unless const_defined?(:BOA_RUN_ENV_PROD)

      BOA_SANDBOX_URL = 'apitest.merchant-services.bankofamerica.com' unless const_defined?(:BOA_SANDBOX_URL)
      
      BOA_PRODUCTION_URL = 'api.merchant-services.bankofamerica.com' unless const_defined?(:BOA_PRODUCTION_URL)

      IDC_RUN_ENV_SANDBOX = 'CYBERSOURCE.IN.ENVIRONMENT.SANDBOX' unless const_defined?(:IDC_RUN_ENV_SANDBOX)

      IDC_RUN_ENV_PROD = 'CYEBRSOURCE.IN.ENVIRONMENT.PRODUCTION' unless const_defined?(:IDC_RUN_ENV_PROD)

      IDC_SANDBOX_URL = 'apitest.cybersource.com' unless const_defined?(:IDC_SANDBOX_URL)

      IDC_PRODUCTION_URL = 'api.in.cybersource.com' unless const_defined?(:IDC_PRODUCTION_URL)	    

      # constants for fall back logic

      DEFAULT_LOG_SIZE = 10485760 unless const_defined?(:DEFAULT_LOG_SIZE)
      
      DEFAULT_PROXY_ADDRESS = 'userproxy.visa.com' unless const_defined?(:DEFAULT_PROXY_ADDRESS)
      
      DEFAULT_PROXY_PORT = '443' unless const_defined?(:DEFAULT_PROXY_PORT)
      
      DEFAULT_TIMEOUT = '1000' unless const_defined?(:DEFAULT_TIMEOUT)
      
      DEFAULT_LOG_DIRECTORY = '../log' unless const_defined?(:DEFAULT_LOG_DIRECTORY)
      
      DEFAULT_KEY_DIRECTORY = 'resource' unless const_defined?(:DEFAULT_KEY_DIRECTORY)
      
      DEFAULT_LOGFILE_NAME = 'cybs' unless const_defined?(:DEFAULT_LOGFILE_NAME)

      # Constant for Fall back logic and Exception Handling

      REQUEST_JSON_ERROR = 'Request Json File missing. File Path :: ' unless const_defined?(:REQUEST_JSON_ERROR)
      
      INVALID_ENABLE_LOG = 'EnableLog should be (True/False) in cybs.yml' unless const_defined?(:INVALID_ENABLE_LOG)
      
      REFER_LOG = 'Please refer Log for details' unless const_defined?(:REFER_LOG)
      
      MERCHANT_ID_NULL = 'MerchantID is mandatory' unless const_defined?(:MERCHANT_ID_NULL)
      
      INCORRECT_KEY_PASS = 'The keyPass Entered is Incorrect' unless const_defined?(:INCORRECT_KEY_PASS)
      
      AUTH_TYPE_MANDATORY= 'AuthenticationType is Mandatory' unless const_defined?(:AUTH_TYPE_MANDATORY)
      
      MERCHANT_KEY_ID_MANDATORY = 'MerchantKeyId is Mandatory' unless const_defined?(:MERCHANT_KEY_ID_MANDATORY)
      
      MERCHANT_SECRET_KEY_MANDATORY = 'MerchantSecretKey is Mandatory' unless const_defined?(:MERCHANT_SECRET_KEY_MANDATORY)

      PORTFOLIO_ID_MANDATORY = 'PortfolioID is Mandatory' unless const_defined?(:PORTFOLIO_ID_MANDATORY)
      
      KEY_PASS_NULL = 'keyPass is empty, Assigining merchantID value' unless const_defined?(:KEY_PASS_NULL)
      
      REQUEST_JSON_PATH_EMPTY = 'RequestJsonPath not provided. Using Default Value:'unless const_defined?(:REQUEST_JSON_PATH_EMPTY)
      
      REQUEST_TYPE_EMPTY = 'RequestType Property of Merchant Config Not Set' unless const_defined?(:REQUEST_TYPE_EMPTY)
      
      INVALID_REQUEST_TYPE_METHOD = 'Entered Request Type should be (GET/POST/PUT)' unless const_defined?(:INVALID_REQUEST_TYPE_METHOD)
      
      INVALID_LOG_DIRECTORY = 'Entered LogDirectory is Incorrect. Using Default Path: ' unless const_defined?(:INVALID_LOG_DIRECTORY)
      
      RUN_ENVIRONMENT_ERROR = 'Entered RunEnvironment is Incorrect.' unless const_defined?(:RUN_ENVIRONMENT_ERROR)
      
      PROPERTY_FILE_NOT_FOUND = 'Cybs.yml file not found' unless const_defined?(:PROPERTY_FILE_NOT_FOUND)

      ERROR_PREFIX = 'Error: ' unless const_defined?(:ERROR_PREFIX)
      
      WARNING_PREFIX = 'Warning: ' unless const_defined?(:WARNING_PREFIX)
      
      HIDDEN_MERCHANT_PROPERTIES = 'merchantID,merchantKeyId,merchantsecretKey,keyAlias,keyPass' unless const_defined?(:HIDDEN_MERCHANT_PROPERTIES)
      
      RUN_ENVIRONMENT = 'RunEnvironment is Mandatory' unless const_defined?(:RUN_ENVIRONMENT)
      
      KEY_DIRECTORY_EMPTY = 'KeysDirectory not provided. Using Default Path:' unless const_defined?(:KEY_DIRECTORY_EMPTY)
      
      FILE_NOT_FOUND = 'File not found, Re-Enter path/file name, Entered path/file name :: ' unless const_defined?(:FILE_NOT_FOUND)
      
      AUTH_ERROR = 'Check Authentication Type (HTTP_Signature/JWT) in cybs.yml.' unless const_defined?(:AUTH_ERROR)
      
      KEY_FILE_NAME_NULL_EMPTY = 'KeyFilename Empty/Null. Assigining merchantID value' unless const_defined?(:KEY_FILE_NAME_NULL_EMPTY)
      
      KEY_ALIAS_NULL_EMPTY = 'KeyAlias Empty/Null. Assigining merchantID value' unless const_defined?(:KEY_ALIAS_NULL_EMPTY)
      
      INCORRECT_KEY_ALIAS = 'The Entered KeyAlias is Incorrect. Assigining merchantID value' unless const_defined?(:INCORRECT_KEY_ALIAS)

      ENABLE_CLIENT_CERT_EMPTY = 'Enable Clientcert is Empty/Null.' unless const_defined?(:ENABLE_CLIENT_CERT_EMPTY)
      
      CLIENT_CERT_DIR_EMPTY = 'Client Cert Directory is Empty/Null' unless const_defined?(:CLIENT_CERT_DIR_EMPTY)
      
      SSL_CLIENT_CERT_EMPTY = 'SSL Client Cert is Empty/Null' unless const_defined?(:SSL_CLIENT_CERT_EMPTY)

      PRIVATE_KEY_EMPTY = 'Private Key is Empty/Null' unless const_defined?(:PRIVATE_KEY_EMPTY)
      
      SSL_KEY_PASSWORD_EMPTY = 'SSL Key Password is Empty/Null' unless const_defined?(:SSL_KEY_PASSWORD_EMPTY)
      
      CLIENT_ID_EMPTY = 'Client Id is Empty/Null' unless const_defined?(:CLIENT_ID_EMPTY)
      
      CLIENT_SECRET_EMPTY = 'Client Secret is Empty/Null' unless const_defined?(:CLIENT_SECRET_EMPTY)
      
      ACCESS_TOKEN_EMPTY = 'AccessToken is Empty/Null' unless const_defined?(:ACCESS_TOKEN_REQ)
      
      REFRESH_TOKEN_EMPTY = 'RefreshToken is Empty/Null' unless const_defined?(:REFRESH_TOKEN_REQ)
  end