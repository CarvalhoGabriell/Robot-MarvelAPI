*** Settings ***
Documentation        Suite de teste para cadastrar personagem na API da marvel.

Library        ${CURDIR}/factories/factory_character.py
Library        RequestsLibrary


*** Test Cases ***
Deve Cadastrar personagem
    # os dados dessa variavel representam o body da requisição
    &{account}    Create Dictionary    email=gabiru@gmail.com
    
    ${payload}    
    ...           POST    
    ...           http://marvel.qaninja.academy/accounts    
    ...           json=${account}
    
    ${client_key}    Set Variable    ${payload.json()}[client_key]
    
    ${header}     Create Dictionary    client_key=${client_key}

    # os dados dessa variavel representam o body do POST de cadastro
    &{characters}        Create Characters 
    
   POST    
    ...           http://marvel.qaninja.academy/characters     
    ...           json=${characters}  
    ...           headers=${header}


