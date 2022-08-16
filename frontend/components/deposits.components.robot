*** Settings ***
Documentation       Components File


*** Variables ***
${DEPOSITS}                     xpath://a[contains(.,'Deposits')]
${teste}                        id:deposits
${NEW_DEPOSIT}                  css:div.container:nth-child(2) > a
${VALIDA_NEW_DEPOSIT}           xpath://h1[contains(.,'New deposit')]
${CAMPO_NAME_DEPOSIT}           xpath://input[contains(@name,'deposit[name]')]
${NAME_DEPOSIT}                 Bar Vitoria
${CAMPO_ADRESS_DEPOSIT}         xpath://input[contains(@name,'deposit[address]')]
${ADRESS_DEPOSIT}               Rua Franco Velasco
${CAMPO_CITY_DEPOSIT}           xpath://input[contains(@name,'deposit[city]')]
${CITY_DEPOSIT}                 Salvador
${CAMPO_STATE_DEPOSIT}          xpath://input[contains(@name,'deposit[state]')]
${STATE_DEPOSIT}                Bahia
${CAMPO_ZIPCODE_DEPOSIT}        xpath://input[contains(@name,'deposit[zipcode]')]
${ZIPCODE_DEPOSIT}              40000000
${BUTTON_NEW_DEPOSIT}           xpath://input[contains(@type,'submit')]
${VALIDA_CRIACAO_DEPOSITO}      xpath://p[contains(.,'Deposit was successfully created.')]
${VOLTAR_PARA_DEPOSITO}         //a[contains(.,'Back to deposits')]
