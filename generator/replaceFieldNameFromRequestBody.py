#this script is written for changing the hash field name from the request json in spec file for generating the ruby sdk as
# in ruby sdk there is an issue for Hash key field name in request & response body.

import json
import sys, getopt


# fieldNames in request and response body structure and change with the value of it.
# eg: fieldNames ={
#     "fieldName" : "changed sdk field name to be used",
#     "fieldName1" :"changed field name to be used in sdk"
# }

fieldNames = {
    "hash": "sdkHashValue"
}




def getSpecJson():
    argumentList = sys.argv[1:]

    # Short Options
    # Short Options are `-h`, `-i`
    options = "hi:"

    # Long Options
    # Long Options are `--help`, `--inputFile = `
    long_options = ["Help", "inputFile = "]
    inputFile = ""

    try:
        opts, args = getopt.getopt(argumentList, options, long_options)

        if not opts:
            print("Error : Missing Arguments")
            raise getopt.GetoptError("Usage Error")

        for opt, arg in opts:
            if opt in ("-h", "--Help"):
                print("Command Usage : main.py [-h | -i <inputFile>]")
                sys.exit()
            elif opt in ("-i", "--inputFile"):
                inputFile = arg.strip()
                if(inputFile == ""):
                    print("Error : Missing input file")
                    raise getopt.GetoptError("Filename cannot be blank")
                print(f"Using input file: {arg}")
    except getopt.GetoptError:
        print("Command Usage : main.py [-h | -i <inputFile>]")
        sys.exit()

    try:
        f = open(inputFile, encoding = "utf-8")
    except FileNotFoundError:
        print("Error : File not found")
        sys.exit()

    spec_json = json.load(f)
    return spec_json


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
        if field in fieldNames.keys():
            result_json[fieldNames[field]]= jsonObject[field]
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
        if field in fieldNames.keys():
            result_json[fieldNames[field]]= jsonObject[field]
        else:
            result_json[field]=jsonObject[field]
    return result_json

spec_json= getSpecJson()
apis = spec_json["paths"].keys()
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



with open("cybersource-rest-spec-ruby.json", "w") as outfile:
     json.dump(spec_json, outfile,indent=4)           



