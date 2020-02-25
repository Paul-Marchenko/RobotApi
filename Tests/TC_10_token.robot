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



     log to console    ${response.content}
     should be equal as strings    ${response.status_code}   200



#Reference Link: https://robotframework.org/robotframe...
# https://certtransaction.elementexpress.com - FOR TOKEN
