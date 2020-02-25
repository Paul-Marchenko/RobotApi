*** Settings ***
Library   XML
Library    os
Library    Collections
Library    RequestsLibrary


*** Variables ***
${base_url}   http://thomas-bayer.com
${city}   Delhi

*** Test Cases ***
TC1
     create session    mysession   ${base_url}
     ${response}= get request   mysession  /sqlrest?CUSTOMER/15
     ${xml_string}= convert to string    ${response.content}
     ${xml_obj}= parse xml    ${xml_string}

     #Check
     element text should be  ${xml_obj}  15  .//ID  #https://prnt.sc/r78w1q

     #Check multiple
     ${child_els}= get child elements  ${xml_obj}
     should not be empty  ${child_els}

     ${ID}= get element text   ${child_els[0]}
     should be equal ${ID}    15



#Reference Link: https://robotframework.org/robotframe...
#
#Web Site: https://www.pavanonlinetrainings.com