import json

# changing the hash field name from the request json in spec file for generating the ruby sdk as
# in ruby sdk there is an issue for Hash key field name in request body.
with open("cybersource-rest-spec.json", "r") as read_file:
    spec_json = json.load(read_file)

apis = spec_json["paths"].keys()

fieldName= "hash"
replacedFieldName= "hashValue"

def replaceFieldNamefromJSONObject(jsonObject):
    fields= jsonObject.keys()
    for field in fields:
        if jsonObject[field]["type"] == "object" and "properties" in jsonObject[field]:
            jsonObject[field]["properties"]= replaceFieldNamefromJSONObject(jsonObject[field]["properties"])  
        elif jsonObject[field]["type"] == "array": 
            if jsonObject[field]["items"]["type"] == "object" and "properties" in jsonObject[field]["items"]:
                jsonObject[field]["items"]["properties"]= replaceFieldNamefromJSONObject(jsonObject[field]["items"]["properties"])
    
    result_json={}
    for field in fields:
        if field == fieldName:
            result_json[replacedFieldName]= jsonObject[field]
        else:
            result_json[field]=jsonObject[field]
    return result_json


def replaceFieldNamefromJSONObjectForResponse(jsonObject):
    fields= jsonObject.keys()
    for field in fields:
        if "properties" in jsonObject[field]:
            jsonObject[field]["properties"]= replaceFieldNamefromJSONObjectForResponse(jsonObject[field]["properties"])  
        elif jsonObject[field]["type"] == "array": 
            if "properties" in jsonObject[field]["items"]:
                jsonObject[field]["items"]["properties"]= replaceFieldNamefromJSONObjectForResponse(jsonObject[field]["items"]["properties"])
    
    result_json={}
    for field in fields:
        if field == fieldName:
            result_json[replacedFieldName]= jsonObject[field]
        else:
            result_json[field]=jsonObject[field]
    return result_json


for api in apis:
    verbs = spec_json["paths"][api].keys()
    # print api end point to check the issue for which api it occured
    print(api)
    for verb in verbs:
        # Fields contains all the tags under api-verb
        fields = spec_json["paths"][api][verb]
        try:
            fields.keys()
        except:
            continue
        
        print("req body")
        # change the hash field name in request body
        if "parameters" in fields.keys():
            new_parameters_list=[]
            parameters= spec_json["paths"][api][verb]["parameters"]
            for param in parameters:
                if param["in"] == "body":
                    jsonObject = param["schema"]
                    if jsonObject["type"] == "object" and "properties" in jsonObject:
                        jsonObject["properties"]=replaceFieldNamefromJSONObject(jsonObject["properties"])
                    param["schema"]=jsonObject
                new_parameters_list.append(param)
            spec_json["paths"][api][verb]["parameters"]= new_parameters_list

        print("res body")
        # change the hash field name in response body
        if "responses" in fields.keys():
            new_responses_object={}
            responses= spec_json["paths"][api][verb]["responses"]
            responsesKeys= responses.keys()
            for responseKey in responsesKeys:
                response=spec_json["paths"][api][verb]["responses"][responseKey]
                if "schema" in response.keys():
                    jsonObject = response["schema"]
                    if "type" in jsonObject and jsonObject["type"] == "object" and "properties" in jsonObject:
                        jsonObject["properties"]=replaceFieldNamefromJSONObjectForResponse(jsonObject["properties"])
                    response["schema"]=jsonObject
                new_responses_object[responseKey]=response
            spec_json["paths"][api][verb]["responses"]= new_responses_object



with open("rest-api-spec-ruby.json", "w") as outfile:
     json.dump(spec_json, outfile,indent=4)           



