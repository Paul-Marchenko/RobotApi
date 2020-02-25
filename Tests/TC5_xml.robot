*** Settings ***
Library   XML
Library    os
Library    Collections


*** Variables ***
${base_url}   http://restapi.demoqa.com
${city}   Delhi

*** Test Cases ***
TC1
     ${xml_obj}= parse xml    C:/User....

     # Validations1
     ${emp_firstname}= get element text  ${xml_obj}  .//employee[1]/firstname  #https://prnt.sc/r78g43
     should be equal ${emp_firstname}    John

     # Validations2
     ${emp_firstname}= get element  ${xml_obj}  .//employee[1]/firstname  #https://prnt.sc/r78g43
     should be equal ${emp_firstname.text}    John

     # Validations3
     element text should be  ${xml_obj}  John  .//employee[1]/firstname  #https://prnt.sc/r78g43

     # Validations4
     ${count}= get element count  ${xml_obj}  .//employee  #https://prnt.sc/r78g43
     should be equal as integers ${count}    6

     # Validations5
     element attribute should be  ${xml_obj}  id  be129  .//employee[1]  #https://prnt.sc/r78g43
     element attribute should be  ${xml_obj}  id  be135  .//employee[6]  #https://prnt.sc/r78g43

     # Validations6
     ${child_els}= get child elements   ${xml_obj}  .//employee[1]  #https://prnt.sc/r78m6c
     should not be empty  ${child_els}
     ${f_name}=get element text   ${child_els[0]}
     ${l_name}=get element text   ${child_els[1]}
     ${title}=get element text   ${child_els[2]}
     log to console   ${f_name}
     log to console   ${l_name}
     log to console   ${title}
     should be equal    ${f_name}   John
     should be equal    ${l_name}   Doe
     should be equal    ${title}   Engineer



#Reference Link: https://robotframework.org/robotframe...
#
#Web Site: https://www.pavanonlinetrainings.com