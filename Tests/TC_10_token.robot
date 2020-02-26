*** Settings ***

Library    Collections
Library    RequestsLibrary
Library    OperatingSystem


*** Variables ***
${base_url}   https://certtransaction.elementexpress.com
${token}   "Bearer 54646664646464"  # Bearer is important

*** Test Cases ***
BearerAuthTest
     create session    mysession   ${base_url}

     ${headers}= create dictionaty    Authorization={token}  Content-Type=text/xml

     ${request_body}= get file   C:/User/....
     ${response}= post request    mysession   /    data=${request_body}   headers= ${headers}
     log to console    ${response.status_code}
     log to console    ${response.content}


#Reference Link: https://robotframework.org/robotframe...
# https://certtransaction.elementexpress.com - FOR TOKEN
