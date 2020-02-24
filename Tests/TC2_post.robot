*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}   http://restapi.demoqa.com
${city}   Delhi

*** Test Cases ***
Put_custom_registr
    create session   mysession    ${base_url}
    ${body}= create dictionary   FisrtName=m LastName=r
    ${header}= create dictionary    Content-Type=application/json
    ${response}=post request    mysession    /register    data=${body}   headers=${header}


    log to console   ${response.status_code}
    log to console   ${response.content}
    log to console   ${response.headers}

    # Validations
    ${resp_body}= convert to string  ${response.content}
    should contain    ${resp_body}   Success
    should contain    ${resp_body}   operation completed sccessfully

    ${status_code}= convert to string  ${response.status_code}
    should be equal    ${status_code}   201
