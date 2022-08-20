*** Settings ***

Resource        ../../config/config.robot
Resource        ../../pages/login.pages.robot

*** Keywords ***
Start Test
    Open Browser                        ${URL_HOST}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait          ${TIME_TO_WAIT}
    Fazer login com sucesso

Finish Test
    Capture Page Screenshot
    Close Browser 

Fazer login com sucesso
    Dado que o usuario esteja na home page da Bees
    Quando inserir um usário e senha válido
    E clicar no botão submit
    Então deverá ser exibido a mensagem Signed in successfully.
    