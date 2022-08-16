*** Settings ***
Resource    ../components/deposits.components.robot
Resource    ../pages/commons/hooks.page.commons.robot


*** Keywords ***
Clicar em Deposits
    Click Element    ${DEPOSITS}

Clicar no botao novo depósito
    Wait Until Element Is Visible    ${NEW_DEPOSIT}
    Element Should Be Visible    ${NEW_DEPOSIT}
    #Scroll Element Into View    ${teste}
    Click Link  ${NEW_DEPOSIT}
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
    Page Should Contain Element    ${VALIDA_CRIACAO_DEPOSITO}
    Click Element    ${VOLTAR_PARA_DEPOSITO}

# Gherking BDD

Dado que esteja na página de depositos
    Clicar em Deposits

Quando criar um novo depósito
    Clicar no botao novo depósito

E preencher o formulário
    Inserir os dados do formulário

E clicar no botão para criar o depósito
    Clicar no botão criar depósito

Então será validado o novo depósito
    Validar a criação do novo depósito e voltar a página de depositos
