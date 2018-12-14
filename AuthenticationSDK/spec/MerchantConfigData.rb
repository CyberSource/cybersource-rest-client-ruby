public
class MerchantConfigData
    def merchantConfigProp()
        merchantId='testrest'
        runEnvironment='cybersource.environment.sandbox'
        timeout=1000 #In Milliseconds
        authenticationType='JWT' #'HTTP_Signature'
        logDirectory='../../../AuthenticationSDK/src/log'
        logDirectory=File.expand_path(logDirectory,__FILE__)
        jsonFilePath='./PostRequestData.json'
        logSize=10485760
        enableLog=true
        proxyAddress='userproxy.visa.com'
        proxyPort=443
        # HTTP Parameters
        merchantSecretKey='yBJxy6LjM2TmcPGu+GaJrHtkke25fPpUX+UY6/L/1tE='
        merchantKeyId='08c94330-f618-42a3-b09d-e1e43be5efda'
        # JWT Parameters
        keysDirectory='../../../AuthenticationSDK/resource'
        keysDirectory=File.expand_path(keysDirectory,__FILE__)
        keyAlias='testrest'
        keyPass='testrest'
        keyFilename='testrest'
        logFilename='Cybs'
        configurationDictionary={}
        configurationDictionary['merchantID']=merchantId
        configurationDictionary['runEnvironment']=runEnvironment
        configurationDictionary['timeout']=timeout
        configurationDictionary['authenticationType']=authenticationType
        configurationDictionary['logDirectory']=logDirectory
        configurationDictionary['jsonFilePath']=jsonFilePath
        configurationDictionary['logSize']=logSize
        configurationDictionary['enableLog']=enableLog
        configurationDictionary['proxyPort']=proxyPort
        configurationDictionary['merchantsecretKey']=merchantSecretKey
        configurationDictionary['merchantKeyId']=merchantKeyId
        configurationDictionary['keysDirectory']=keysDirectory
        configurationDictionary['keyAlias']=keyAlias
        configurationDictionary['keyPass']=keyPass
        configurationDictionary['keyFilename'] = keyFilename
        configurationDictionary['logFilename'] = logFilename
        return configurationDictionary
    end
    def setLog(logDirectory, logFilename, logSize, enableLog)
        if enableLog == true
            filename = logDirectory + '/' + logFilename + '.log'
            datetime = DateTime.now
            if File.exist?(filename) && File.size(filename) >= logSize
              updatedFileName = logDirectory + '/' + logFilename + '_' + datetime.strftime('%Y%m%d%H%M%S') + '.log'
              File.rename(filename, updatedFileName)
            end
            @logger = Logger.new(STDOUT)
            @logger = Logger.new(filename, logSize)
            @logger.datetime_format = datetime.strftime('%Y-%m-%d %H:%M:%S')
        else
            @logger = Logger.new(false)
        end
    end
end