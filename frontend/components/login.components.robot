*** Settings ***
Documentation       Components File


*** Variables ***
${LOGO_BEES}                    xpath:/html/body/nav/div/a/img
${CAMPO_EMAIL}                  id:user_email
${EMAIL_FAKE}                   renatogregorio@protonmail.com
${CAMPO_SENHA}                  id:user_password
${SENHA_FAKE}                   Renato2409@
${BUTTON_SUBMIT}                xpath://input[contains(@type,'submit')]
${VALIDA_LOGIN}                 xpath://p[contains(.,'Signed in successfully.')]
