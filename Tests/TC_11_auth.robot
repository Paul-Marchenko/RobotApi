*** Settings ***

Library    Collections
Library    RequestsLibrary
Library    OperatingSystem


*** Variables ***
${base_url}   https://maps.googleapis.com  # https://developers/google.com/places/web-service/intro
${req_url}   /maps/api/places/nearbysearch/json?
${token}   "Bearer 54646664646464"  # Bearer is important

*** Test Cases ***
BearerAuthTest
     create session    mysession   ${base_url}
     ${params}= create dictionaty  location=-52.556.2555. radius=560
     ${response}= get request    mysession   ${req_url}   params=${params}

     log to console    ${response.status_code}
     log to console    ${response.content}

# TASK:
# create a new projetc in the google dev console, create api key for that project, enable API