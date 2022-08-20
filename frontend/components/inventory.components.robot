*** Settings ***
Documentation       Components File


*** Variables ***
# Registration new inventory
${INVENTORY}                    xpath=//div[@id="navbarSupportedContent"]//a[contains(text(),"Inventory")]
${VALIDA_NEW_INVENTORY}         xpath=//h1[contains(.,'New inventory')]
${NEW_INVENTORY}                xpath=//div[@class="container"]//a[contains(text(),"New inventory")]
${SELECT_ITEM_INVENTORY}        xpath=//option[contains(@value,'416')]
${SELECT_DEPOSIT_INVENTORY}     xpath=//option[contains(@value,'205')]
${CAMPO_ITEM_COUNT}             xpath=//input[contains(@name,'count]')]
${BUTTON_CREATE_INVENTORY}      xpath=//input[contains(@type,'submit')]
${VALIDA_CRIACAO_INVENTORY}     xpath=//p[contains(.,'Inventory was successfully created.')]
${BACK_TO_INVENTORIES}          xpath=//a[contains(.,'Back to inventories')]
${TELA_INVENTORY}               xpath=//h1[contains(.,'Inventories')]
${ITEM_COUNT}                   5
${BTN_END}                      \ue010
${BODY}                         xpath://body

# Exclusion inventory
${SHOW_INVENTORY}               xpath=(//a[contains(.,'Show this inventory')])[1]
${BUTTON_DESTROY_INVENTORY}     xpath=//button[@type='submit'][contains(.,'Destroy this inventory')]
${MSG_DESTROY_INVENTORY}        xpath=//p[contains(.,'Inventory was successfully destroyed.')]

# Update inventory
${EDIT_INVENTORY}               xpath=//a[contains(.,'Edit this inventory')]
${BUTTON_UPDATE_INVENTORY}      xpath=//input[contains(@type,'submit')]
${ITEM_EDITED}                  xpath=//option[contains(@value,'410')]
${DESPOSIT_EDITED}              xpath=//option[contains(@value,'530')]
${ITEM_COUNT_EDITED}            5
${MSG_UPDATE}                   xpath=//p[contains(.,'Inventory was successfully updated.')]
