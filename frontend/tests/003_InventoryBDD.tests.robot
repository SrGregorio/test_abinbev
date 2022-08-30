*** Settings ***
Resource            ../pages/inventory.pages.robot

Test Setup          Start Test
Test Teardown       Finish Test


*** Test Cases ***
Cenário 1 - Criar um novo item
    [Documentation]    Criação de um novo iventário e validação
    [Tags]    new_inventory
    Dado que esteja na página de inventário
    Quandro clicar no botão e preencher o formulário do novo inventory
    E clicar no botão para criar o iventory
    Então será validado o novo inventory e retornará a página da listagem dos inventories

Cenário 2 - Excluir o cadastro de um inventory
    [Documentation]    Exclusão de um cadastro de depósito e validação
    [Tags]    exclusion_inventory
    Dado que esteja na página de inventário
    Quando clicar em visualizar o cadastro de um inventory
    E clicar em destroy this inventory
    Então validará a mensagem de inventory excluído com sucesso

Cenário 3 - Atualizar o cadastro de um item
    [Documentation]    Atualização do cadastro de um item e validar alteração
    [Tags]    update_inventory
    Dado que esteja na página de inventário
    Quando clicar em visualizar o cadastro de um inventory
    E alterar o cadastro do iventory selecionado
    Então validará a mensagem alterado com sucesso e retornará a página da listagem de iventory
