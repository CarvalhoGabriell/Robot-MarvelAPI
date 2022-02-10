*** Settings ***
Resource    ../../main.resource

*** Keywords ***
POST new personagem
    [Arguments]        ${PERSONAGEM}
    ${response}    POST    
    ...            ${BASE_URL}/characters     
    ...            json=${PERSONAGEM}  
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}