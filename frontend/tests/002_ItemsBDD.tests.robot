*** Settings ***
Resource            ../pages/items.pages.robot

Test Setup          Start Test
Test Teardown       Finish Test


*** Test Cases ***
Cenário 1 - Criar um novo item
    [Documentation]    Criação de um novo item e validação
    [Tags]    new_item
    Dado que esteja na página de items
    Quandro clicar no botão e preencher o formulário do novo item
    E clicar no botão para criar o item
    Então será validado o novo item e retornará a páginas items

Cenário 2 - Atualizar o cadastro de um item
    [Documentation]    Atualização do cadastro de um item e validar alteração
    [Tags]    update_item
    Dado que esteja na página de items
    Quando clicar em visualizar o cadastro de um item
    E alterar o cadastro do item selecionado
    Então validará a mensagem de item alterado com sucesso e retornará a página de item

Cenário 3 - Excluir o cadastro de um item
    [Documentation]    Exclusão do cadastro de um item e validação
    [Tags]    exclusion_item
    Dado que esteja na página de items
    Quando clicar em visualizar o cadastro de um item
    E clicar em destroy this item
    Então validará a mensagem de item excluído com sucesso
