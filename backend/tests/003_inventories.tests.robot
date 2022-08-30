*** Settings ***
Resource        ../resource/inventories.resource

Test Setup      Create the session


*** Test Cases ***
Cenário 1 - Buscar lista de inventários (GET)
    Given that a GET request is made on the inventory list
    When to get request status code   200
    Then the return of the request is ok

Cenário 2 - Buscar cadastro de inventário (GET)
    Given that a GET request is made on the inventory ID
    When to get request status code    200
    Then the id request return is ok
    
Cenário 3 - Criar um novo inventário (POST)
    Given that a POST request is made on the inventory
    When post request status code returns   201
    Then returning a new id of the created item
    
Cenário 4 - Atualizar as informações de um inventário (PATCH)
    Given that a PATCH request is made on the inventory
    When patch request status code returns  200
    Then the update return via patch is ok
    
Cenário 5 - Atualizar as informações de inventário (PUT)
    Given that when you make a PUT request on inventories
    When put request status code returns  200
    Then the update return via put is ok
    
Cemário 6 - Deletar o cadastro de um inventário (DELETE)
    Given that when you make a DELETE request on an inventory
    When delete request status code returns  204
    Then the return of the request via delete is ok
