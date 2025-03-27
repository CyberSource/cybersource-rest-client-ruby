module CyberSource    
    class TransientTokenUtility
        def parseToken(jwt)
            split_contents = jwt.split(",")
            if split_contents.length > 0
            encoded_string = split_contents[1]
            decoded_string = Base64.decode64(unescaped)
            transient_token_model = JSON.parse(decoded_string)
            end
        rescue StandardError => err 
            puts err.message
        end        
    end
end