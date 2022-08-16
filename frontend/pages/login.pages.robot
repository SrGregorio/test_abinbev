*** Settings ***
Resource    ../components/login.components.robot
Resource    ../pages/commons/hooks.page.commons.robot


*** Keywords ***
Verificar pagina atraves da logomarca
    Page Should Contain Element    ${LOGO_BEES}

Inserir e-mail e senha
    Wait Until Element Is Visible    ${CAMPO_EMAIL}
    Wait Until Element Is Visible    ${CAMPO_SENHA}
    Input Text    ${CAMPO_EMAIL}    ${EMAIL_FAKE}
    Input Text    ${CAMPO_SENHA}    ${SENHA_FAKE}

Clicar no botão submit para efetuar o login
    Wait Until Element Is Visible    ${BUTTON_SUBMIT}
    Click Element    ${BUTTON_SUBMIT}

Verificar a exibição da mensagem de sucesso no login
    Page Should Contain Element    ${VALIDA_LOGIN}

# Gherking BDD

Dado que o usuario esteja na home page da Bees
    Verificar pagina atraves da logomarca

Quando inserir um usário e senha válido
    Inserir e-mail e senha

E clicar no botão submit
    Clicar no botão submit para efetuar o login

Então deverá ser exibido a mensagem Signed in successfully.
    Verificar a exibição da mensagem de sucesso no login
