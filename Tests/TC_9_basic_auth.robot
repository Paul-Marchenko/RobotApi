*** Settings ***

Library    Collections
Library    RequestsLibrary


*** Variables ***
${base_url}   http://restapi.demoqa.com
${city}   Delhi

*** Test Cases ***
Basic_auth
     ${auth}= create list   ToolsQA   TestPassword
     create session    mysession   ${base_url}   auth=${auth}
     ${response}= get request   mysession  /authentication/CheckForAuthentication

     log to console    ${response.content}
     should be equal as strings    ${response.status_code}   200



#Reference Link: https://robotframework.org/robotframe...
# https://certtransaction.elementexpress.com - FOR TOKEN
