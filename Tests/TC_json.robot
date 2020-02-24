*** Settings ***
Library   Jsonibrary
Library    os
Library    Collections

*** Variables ***
${base_url}   http://restapi.demoqa.com
${city}   Delhi

*** Test Cases ***
TC1
    create session   mysession    ${base_url}
    ${response}= get request   mysession    /utilities/weather/city/${city}

#
#http://jsonpath.com
#http://jsonpathfinder.com/