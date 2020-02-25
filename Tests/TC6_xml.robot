*** Settings ***

Library    Collections
Library    RequestsLibrary


*** Variables ***
${base_url}   http://jsonplaceholder.typicode.com
${city}   Delhi

*** Test Cases ***
TC1
     create session    mysession   ${base_url}
     ${response}= get request   mysession  /photos

     log to console    ${response.headers}

     ${Content_Type_value}= get from dictionary    ${response.headers}   Content-Type
     should be equal    ${Content_Type_value}   application/json; charset=utf-8

     ${Content_Encode_value}= get from dictionary    ${response.headers}   Content-Encoding
     should be equal    ${Content_Encode_value}   gzip

TC_cookies
     create session    mysession   ${base_url}
     ${response}= get request   mysession  /photos

     log to console    ${response.cookies}

     ${cookieValue}= get from dictionary ${response.cookies}  _cfduid
     log to console    ${cookieValue}


#Reference Link: https://robotframework.org/robotframe...
#
#Web Site: https://www.pavanonlinetrainings.com