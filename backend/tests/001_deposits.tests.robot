*** Settings ***
Resource        ../resource/deposits.resource

Test Setup      Create the session


*** Test Cases ***
Cenário 1 - Buscar lista de depositos (GET)
    Given that a GET request is made on the deposits list
    When to get request status code  200
    Then the return of the request is ok

Cenário 2 - Buscar cadastro de deposito (GET)
    Given that a GET request is made on the deposity ID
    When to get request status code  200
    Then the id request return is ok
    
Cenário 3 - Criar um novo deposito (POST)
    Given that a POST request is made on the deposity
    When post request status code returns  201
    Then returning a new id of the created item
    
Cenário 4 - Atualizar as informações de um deposito (PATCH)
    Given that a PATCH request is made on the deposity
    When patch request status code returns  200
    Then the update return via patch is ok
    
Cenário 5 - Atualizar as informações de deposito (PUT)
    Given that a PUT request is made on the deposity
    When put request status code returns  200
    Then the update return via put is ok
    
Cemário 6 - Deletar o cadastro de um deposito (DELETE)
    Given that a delete request is made on the deposity
    When delete request status code returns  204
    Then the return of the request via delete is ok
    