*** Settings ***
Resource        ../pages/deposits.pages.robot


*** Test Cases ***
Cenário 2 - Criar um novo depósito
    [Documentation]    Criação de um novo depósito e validação dos campos
    Dado que esteja na página de depositos
    Quando criar um novo depósito
    E preencher o formulário
    E clicar no botão para criar o depósito
    Então será validado o novo depósito

    