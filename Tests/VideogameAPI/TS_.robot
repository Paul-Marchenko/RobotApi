*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_url}    http://localhost:8080
${city}   Delhi

*** Test Cases ***
Return all games
    create session   mysession    ${base_url}
    ${response}= get request    mysession   /app/videogames
    log to console   ${response.status_code}
    log to console   ${response.content}


    # Validations
    ${status_code}= convert to string  ${response.status_code}
    should be equal    ${status_code}   200


Add games
    create session   mysession    ${base_url}
    ${body}= create dictionary   GameName=mark id=100
    ${header}= create dictionary    Content-Type=application/json
    ${response}= post request    mysession    /app/videogames    data=${body}   headers=${header}
    log to console   ${response.status_code}
    log to console   ${response.content}

    # Validations
    ${status_code}= convert to string  ${response.status_code}
    should be equal    ${status_code}   201

    ${resp_body}= convert to string  ${response.content}
    should contain    ${resp_body}   Success
    should contain    ${resp_body}   operation completed sccessfully

Return detail of games
   create session   mysession    ${base_url}
    ${response}= get request    mysession   /app/videogames/100
    log to console   ${response.status_code}
    log to console   ${response.content}


    # Validations
    ${status_code}= convert to string  ${response.status_code}
    should be equal    ${status_code}   200
    ${resp_body}= convert to string   ${response.content}
    should contain    ${resp_body}   mark


Update games
    create session   mysession    ${base_url}
    ${body}= create dictionary   GameName=tarta id=100
    ${header}= create dictionary    Content-Type=application/json
    ${response}= put request    mysession    /app/videogames/100    data=${body}   headers=${header}
    log to console   ${response.status_code}
    log to console   ${response.content}

    # Validations
    ${status_code}= convert to string  ${response.status_code}
    should be equal    ${status_code}   201

    ${resp_body}= convert to string  ${response.content}
    should contain    ${resp_body}   tatra
    should contain    ${resp_body}   updated successfully

Delete all games
    create session   mysession    ${base_url}
    ${response}= delete request    mysession   /app/videogames/100
    log to console   ${response.status_code}


    # Validations
    ${status_code}= convert to string  ${response.status_code}
    should be equal    ${status_code}   200
    ${resp_body}= convert to string  ${response.content}
    should contain    ${resp_body}   Deleted successfully

# install gradle, add to env *** variables ***
# load videogame api 1) Pre-Requisite: Install Gradle on Windows
                     #2) Graddle Download link:  https://gradle.org/releases/
                     #3) VideoGameDB API Download Link: https://github.com/james-willett/Vide...
                     #4) How to run application using graddle?
                     # E:\VideoGameDB-master\gradlew bootRun
                     #5)  URL:  http://localhost:8080/swagger-ui/inde...
                     #
                     #Web Site: https://www.pavanonlinetrainings.com
                     #Software Testing Blog: http://www.pavantestingtools.com/
                     #YouTube Channel : https://www.youtube.com/pavanoltraining