*** Settings ***
Documentation    Suite de testes responsável por deletar um personagem 
Resource        ../resource/Base.robot
Suite Setup        Super Setup        gabQA123@gmail.com  


*** Test Cases ***
Cenario 5: Deve Remover um personagem cadastrado pelo ID
    
    ${character}          Create Viuva
    ${result}             POST new personagem    ${character}
    ${viuva_id}           Set Variable    ${result.json()}[_id]

    ${response}           DELETE Character By Id   ${viuva_id}  
    Status Should Be      204     ${response}
    
    ${response_search}            GET Character By Id    ${viuva_id}  
    Status Should Be    404     ${response_search}


Cenario 6: Remover um personagem não cadastrado
    
    ${character_id}        Set Variable    621567cf4c6fdf0016dcd385

    ${response}            GET Character By Id    ${character_id}
    Status Should Be    404

   

