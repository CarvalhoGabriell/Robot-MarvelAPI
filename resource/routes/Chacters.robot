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

GET Character By Id
    [Arguments]        ${PERSONAGEM_ID}

    ${response}    
    ...            GET        ${BASE_URL}/characters/${PERSONAGEM_ID}
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}


DELETE Character By Id
    [Arguments]        ${PERSONAGEM_ID}

    ${response}    
    ...            DELETE        ${BASE_URL}/characters/${PERSONAGEM_ID}
    ...            headers=${HEADERS}
    ...            expected_status=any
    [Return]       ${response}