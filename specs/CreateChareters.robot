*** Settings ***
Documentation        Suite de teste para cadastrar personagem na API da marvel.
Resource       ../resource/Base.robot

Suite Setup        Super Setup        gabiru@gmail.com  
*** Test Cases ***
Cenário 1: Deve Cadastrar personagem
   
    # arquivo json criado pra ir no Body do POST
    ${characters}       Create Characters 
    
    ${response}         POST new personagem    ${characters}
    Status Should Be    200     ${response}

Cenário 2: Nao deve cadastra personagem com mesmo Nome
    
    ${characters}       Create Heroe
    POST new personagem    ${characters} 

    ${response}         POST new personagem    ${characters}
    Status Should Be    409    ${response}
    Should Be Equal     Character already exists :(    ${response.json()}[error]