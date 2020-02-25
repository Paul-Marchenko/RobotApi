*** Settings ***
Library   JsonLibrary
Library    os
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}   http://restapi.demoqa.com
${city}   Delhi

*** Test Cases ***
Get_countryInfo
    create session    mysession   ${base_url}
    ${response}= get request   mysession  /rest/v2/alpha/IN

    ${json_obj}= to json   ${response.content}

    # Single data validation
    ${name_country}= get value from json  ${json_obj}   $.name
    log to console ${name_country[0]}
    should be equal ${name_country[0]}    India

    # Single data in array
    ${border}= get value from json  ${json_obj}   $.borders[0]  #https://prnt.sc/r78a6g
    log to console ${border[0]}
    should be equal ${border[0]}    AFG    BGD    BTN
    should not contain any  ${border[0]}    afg    dce    cgh

    # Multiply data in array
    ${borders}= get value from json  ${json_obj}   $.borders  #https://prnt.sc/r78a6g
    log to console ${borders[0]}
    should be equal ${borders[0]}    AFG


    ${json_obj}= load json from file    C:/User....
    ${name_value}= get value from json   ${json_obj}  $.firstName   # https://prnt.sc/r783yv
    log to console ${name_value[0]}
    should be equal ${name_value[0]}    John

    ${street_value}= get value from json   ${json_obj}  $.address.streetAddress
    log to console ${street_value[0]}
    should be equal ${street_value[0]}    21 2nd Street  #https://prnt.sc/r7847e

    ${faxnub_value}= get value from json   ${json_obj}  $.phoneNumber[1].number
    log to console ${faxnub_value[0]}
    should be equal ${faxnub_value[0]}    6465554567

#
#http://jsonpath.com
#http://jsonpathfinder.com/Q
# create json file
