*** Settings ***
Documentation    Suite de testes responsável por pesquisar um personagem 
Resource        ../resource/Base.robot
Suite Setup        Super Setup        gabiru@gmail.com  


*** Test Cases ***
Cenario 3: Deve pesquisar um personagem cadastrado pelo ID
    
    ${character}          Create Tocha
    ${result}             POST new personagem    ${character}

    ${tocha_id}           Set Variable    ${result.json()}[_id]

    ${response}           GET Character By Id    ${tocha_id}
    Status Should Be      200
    
    Should Not Be Empty   ${response.json()}[owner]
    Should Be Equal       ${response.json()}[name]         ${character}[name]
    Should Be Equal       ${response.json()}[team]         ${character}[team]
    Should Be Equal       ${response.json()}[aliases]      ${character}[aliases]
    Should Be Equal       ${response.json()}[age]          ${character}[age]
    Log                   ${response.json()}[_id]

Cenario 4: Pesquisa de personagem não cadastrado
    
    ${character_id}        Set Variable    621567cf4c6fdf0016dcd385

    ${response}            GET Character By Id    ${character_id}
    Status Should Be    404

