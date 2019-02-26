public
class MerchantConfiguration
  def merchantConfigProp()
    merchantId='testrest'
    runEnvironment='cybersource.environment.sandbox'
    timeout=1000 #In Milliseconds
    authenticationType='http_signature'   
    logDirectory='../log'
    jsonFilePath='resource/request.json'
    logSize=10485760
    enableLog=false
    # proxyAddress='userproxy.com'
    # proxyPort=123
    # HTTP Parameters
    merchantKeyId='08c94330-f618-42a3-b09d-e1e43be5efda'
    merchantSecretKey='yBJxy6LjM2TmcPGu+GaJrHtkke25fPpUX+UY6/L/1tE='
    # JWT Parameters
    keysDirectory='resource'
    keyAlias='testrest'
    keyPass='testrest'
    keyFilename='testrest'
    logFilename='cybs'
    configurationDictionary={}
    configurationDictionary['merchantID']=merchantId
    configurationDictionary['runEnvironment']=runEnvironment
    configurationDictionary['timeout']=timeout
    configurationDictionary['authenticationType']=authenticationType
    configurationDictionary['logDirectory']=logDirectory
    configurationDictionary['jsonFilePath']=jsonFilePath
    configurationDictionary['logSize']=logSize
    configurationDictionary['enableLog']=enableLog
    # configurationDictionary['proxyPort']=proxyPort
    # configurationDictionary['proxyAddress']=proxyAddress
    configurationDictionary['merchantsecretKey']=merchantSecretKey
    configurationDictionary['merchantKeyId']=merchantKeyId
    configurationDictionary['keysDirectory']=keysDirectory
    configurationDictionary['keyAlias']=keyAlias
    configurationDictionary['keyPass']=keyPass
    configurationDictionary['keyFilename'] = keyFilename
    configurationDictionary['logFilename'] = logFilename
    return configurationDictionary
  end
end
