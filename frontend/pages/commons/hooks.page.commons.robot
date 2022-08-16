*** Settings ***

Resource        ../../config/config.robot

*** Keywords ***
Start Test
    Open Browser                        ${URL_HOST}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait          ${TIME_TO_WAIT}

Finish Test
    Capture Page Screenshot
    Close Browser 

   