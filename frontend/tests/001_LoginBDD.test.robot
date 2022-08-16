*** Settings ***
Resource        ../pages/login.pages.robot

Test Setup      Start Test


*** Test Cases ***
Cenário 01 - Fazer login com sucesso
    [Documentation]    Fazer login na home page Bees com sucesso
    [Tags]    login_usuario
    Dado que o usuario esteja na home page da Bees
    Quando inserir um usário e senha válido
    E clicar no botão submit
    Então deverá ser exibido a mensagem Signed in successfully.
