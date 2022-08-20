*** Settings ***
Resource            ../pages/deposits.pages.robot

Test Setup          Start Test
Test Teardown       Finish Test


*** Test Cases ***
Cenário 1 - Criar um novo depósito
    [Documentation]    Criação de um novo depósito e validação dos campos
    [Tags]    new_deposit
    Dado que esteja na página de depositos
    Quando clicar no botão para criar um novo depósito
    E preencher o formulário
    E clicar no botão para criar o depósito
    Então será validado o novo depósito e retornará a pagina deposit

Cenário 2 - Excluir o cadastro de um depósito
    [Documentation]    Exclusão de um cadastro de depósito e validação
    [Tags]    exclusion_deposit
    Dado que esteja na página de depositos
    Quando clicar em visualizar o cadastro de um depósito a ser excluído
    E clicar em destroy this deposit
    Então validará a mensagem de depósito excluído com sucesso

Cenário 3 - Atualizar o cadastro de um depósito
    [Documentation]    Atualização do cadastro de um depósito e validar alteração
    [Tags]    update_deposit
    Dado que esteja na página de depositos
    Quando clicar em visualizar o cadastro de um depósito
    E alterar o cadastro do depósito selecionado
    Então validará a mensagem de deposito alterado com sucesso e retornará a lista de depósito
