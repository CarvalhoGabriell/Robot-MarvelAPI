*** Settings ***
Documentation       Documento com informações base para o teste todo

Resource        ../main.resource

*** Variables ***
${BASE_URL}         http://marvel.qaninja.academy               


*** Keywords ***
Super Setup
    [Arguments]        ${email_user}
    Authentification Key User         ${email_user}
    Back To the Past 


Authentification Key User
    [Arguments]        ${email_user}
    
    # os dados dessa variavel representam o body da requisição
    &{account}    Create Dictionary    email=${email_user}
    ${response}    
    ...           POST    
    ...           ${BASE_URL}/accounts    
    ...           json=${account}
    
    ${client_key}     Set Variable            ${response.json()}[client_key]
    ${HEADERS}        Create Dictionary       client_key=${client_key}
    Set Suite Variable    ${HEADERS}

Back To the Past
    DELETE        ${BASE_URL}/delorean        headers=${HEADERS}