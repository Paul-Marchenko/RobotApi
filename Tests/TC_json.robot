*** Settings ***
Library   Jsonibrary
Library    os
Library    Collections

*** Variables ***
${base_url}   http://restapi.demoqa.com
${city}   Delhi

*** Test Cases ***
TC1
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

