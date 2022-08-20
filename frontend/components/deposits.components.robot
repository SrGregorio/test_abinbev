*** Settings ***
Documentation       Components File


*** Variables ***
#Registration New Deposits
${DEPOSITS}                     xpath=//div[@id="navbarSupportedContent"]//a[contains(text(),"Deposits")]
${NEW_DEPOSIT}                  xpath=//div[@class="container"]//a[contains(text(),"New deposit")]
${VALIDA_NEW_DEPOSIT}           xpath=//h1[contains(.,'New deposit')]
${CAMPO_NAME_DEPOSIT}           xpath://input[contains(@name,'deposit[name]')]
${CAMPO_ADRESS_DEPOSIT}         xpath://input[contains(@name,'deposit[address]')]
${CAMPO_CITY_DEPOSIT}           xpath://input[contains(@name,'deposit[city]')]
${CAMPO_STATE_DEPOSIT}          xpath://input[contains(@name,'deposit[state]')]
${CAMPO_ZIPCODE_DEPOSIT}        xpath://input[contains(@name,'deposit[zipcode]')]
${BUTTON_NEW_DEPOSIT}           xpath://input[contains(@type,'submit')]
${VALIDA_CRIACAO_DEPOSITO}      xpath://p[contains(.,'Deposit was successfully created.')]
${VOLTAR_PARA_DEPOSITO}         //a[contains(.,'Back to deposits')]
${BTN_END}                      \ue010
${BODY}                         xpath://body
${NAME_DEPOSIT}                 Bar Vitoria
${ADRESS_DEPOSIT}               Rua Franco Velasco
${CITY_DEPOSIT}                 Salvador
${STATE_DEPOSIT}                Bahia
${ZIPCODE_DEPOSIT}              40000000

#Update Deposity
${SHOW_DEPOSIT}                 xpath=(//a[contains(.,'Show this deposit')])[1]
${EDIT_DEPOSIT}                 xpath=//a[contains(.,'Edit this deposit')]
${CAMPO_NAME_EDIT}              xpath=//input[@name='deposit[name]']
${CAMPO_ADRESS_EDIT}            xpath=//input[@name='deposit[address]']
${CAMPO_CITY_EDIT}              xpath=//input[@name='deposit[city]']
${CAMPO_STATE_EDIT}             xpath=//input[@name='deposit[state]']
${CAMPO_ZIPCODE_EDIT}           xpath=//input[@name='deposit[zipcode]']
${BOTAO_UPDATE_DEPOSIT}         xpath=//input[contains(@type,'submit')]
${MSG_UPDATED_SUCESS}           xpath=//p[contains(.,'Deposit was successfully updated.')]
${BACK_TO_DEPOSITS}             xpath=//a[contains(.,'Back to deposits')]
${NAME_EDITED}                  Barão Distribuidora
${ADRESS_EDITED}                Av. Luis Embriane
${CITY_EDITED}                  Araraquara
${STATE_EDITED}                 São Paulo
${ZIPCODE_EDITED}               01311100

#Destroy Deposit
${SHOW_DEPOSIT_DESTROY}         xpath=(//a[contains(.,'Show this deposit')])[10]
${BTN_DESTROY_DEPOSIT}          xpath=//button[@type='submit'][contains(.,'Destroy this deposit')]
${MSG_DESTROY_DEPOSIT}          xpath=//p[contains(.,'Deposit was successfully destroyed.')]
