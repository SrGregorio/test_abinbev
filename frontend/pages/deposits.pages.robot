*** Settings ***
Resource    ../components/deposits.components.robot
Resource    ../pages/commons/hooks.page.commons.robot


*** Keywords ***
Clicar em Deposits
    Wait Until Element Is Visible    ${DEPOSITS}
    Click Element    ${DEPOSITS}

Clicar no botao novo depósito
    Sleep    2
    Wait Until Element Is Enabled    ${NEW_DEPOSIT}
    Element Should Be Visible    ${NEW_DEPOSIT}
    Press Keys    ${BODY}    ${BTN_END}
    Press Keys    ${BODY}    ${BTN_END}
    Press Keys    ${NEW_DEPOSIT}    Mouse Down
    Wait Until Element Is Visible    ${VALIDA_NEW_DEPOSIT}
    Page Should Contain Element    ${VALIDA_NEW_DEPOSIT}

Inserir os dados do formulário
    Input Text    ${CAMPO_NAME_DEPOSIT}    ${NAME_DEPOSIT}
    Input Text    ${CAMPO_ADRESS_DEPOSIT}    ${ADRESS_DEPOSIT}
    Input Text    ${CAMPO_CITY_DEPOSIT}    ${CITY_DEPOSIT}
    Input Text    ${CAMPO_STATE_DEPOSIT}    ${STATE_DEPOSIT}
    Input Text    ${CAMPO_ZIPCODE_DEPOSIT}    ${ZIPCODE_DEPOSIT}

Clicar no botão criar depósito
    Click Element    ${BUTTON_NEW_DEPOSIT}

Validar a criação do novo depósito e voltar a página de depositos
    Wait Until Element Is Visible    ${VALIDA_CRIACAO_DEPOSITO}
    Page Should Contain Element    ${VALIDA_CRIACAO_DEPOSITO}
    Click Element    ${VOLTAR_PARA_DEPOSITO}

Clicar em Show This Deposit
    Element Should Be Visible    ${SHOW_DEPOSIT}
    Wait Until Element Is Enabled    ${SHOW_DEPOSIT}
    Press Keys    ${SHOW_DEPOSIT}    Mouse Down

Clicar em Show This Deposit a ser excluido
    Element Should Be Visible    ${SHOW_DEPOSIT_DESTROY}
    Wait Until Element Is Enabled    ${SHOW_DEPOSIT_DESTROY}
    Press Keys    ${SHOW_DEPOSIT_DESTROY}    Mouse Down

Editar um Cadastro de depósito
    Wait Until Element Is Visible    ${EDIT_DEPOSIT}
    Click Element    ${EDIT_DEPOSIT}
    Wait Until Element Is Visible    ${BOTAO_UPDATE_DEPOSIT}

    Press Keys    ${CAMPO_NAME_EDIT}    CTRL+A+DELETE
    Input Text    ${CAMPO_NAME_EDIT}    ${NAME_EDITED}

    Press Keys    ${CAMPO_ADRESS_EDIT}    CTRL+A+DELETE
    Input Text    ${CAMPO_ADRESS_EDIT}    ${ADRESS_EDITED}

    Press Keys    ${CAMPO_CITY_EDIT}    CTRL+A+DELETE
    Input Text    ${CAMPO_CITY_EDIT}    ${CITY_EDITED}

    Press Keys    ${CAMPO_STATE_EDIT}    CTRL+A+DELETE
    Input Text    ${CAMPO_STATE_EDIT}    ${STATE_EDITED}

    Press Keys    ${CAMPO_ZIPCODE_EDIT}    CTRL+A+DELETE
    Input Text    ${CAMPO_ZIPCODE_EDIT}    ${ZIPCODE_EDITED}

    Wait Until Element Is Visible    ${BOTAO_UPDATE_DEPOSIT}
    Click Element    ${BOTAO_UPDATE_DEPOSIT}

Validação da mensagem de atualização com sucesso
    Wait Until Element Is Visible    ${MSG_UPDATED_SUCESS}
    Page Should Contain Element    ${MSG_UPDATED_SUCESS}

    Wait Until Element Is Visible    ${BACK_TO_DEPOSITS}
    Click Element    ${BACK_TO_DEPOSITS}

Click no botão destroy deposit
    Wait Until Element Is Visible    ${BTN_DESTROY_DEPOSIT}
    Click Button    ${BTN_DESTROY_DEPOSIT}

Validação da mensagem de depósito excluído
    Wait Until Element Is Visible    ${MSG_DESTROY_DEPOSIT}
    Page Should Contain Element    ${MSG_DESTROY_DEPOSIT}

# Gherking BDD

Dado que esteja na página de depositos
    Clicar em Deposits

Quando clicar no botão para criar um novo depósito
    Clicar no botao novo depósito

E preencher o formulário
    Inserir os dados do formulário

E clicar no botão para criar o depósito
    Clicar no botão criar depósito

Então será validado o novo depósito e retornará a pagina deposit
    Validar a criação do novo depósito e voltar a página de depositos

Quando clicar em visualizar o cadastro de um depósito a ser excluído
    Clicar em Show This Deposit a ser excluido

Quando clicar em visualizar o cadastro de um depósito
    Clicar em Show This Deposit
    
E alterar o cadastro do depósito selecionado
    Editar um Cadastro de depósito

Então validará a mensagem de deposito alterado com sucesso e retornará a lista de depósito
    Validação da mensagem de atualização com sucesso

E clicar em destroy this deposit
    Click no botão destroy deposit

Então validará a mensagem de depósito excluído com sucesso
    Validação da mensagem de depósito excluído
