*** Settings ***
Documentation       Components File


*** Variables ***
# Registration new item
${ITEMS}                    xpath=//div[@id="navbarSupportedContent"]//a[contains(text(),"Items")]
${NEW_ITEM}                 xpath=//div[@class="container"]//a[contains(text(),"New item")]
${VALIDA_NEW_ITEM}          xpath=//h1[contains(.,'New item')]
${CAMPO_NAME_ITEM}          xpath=//input[contains(@name,'item[name]')]
${CAMPO_HEIGHT_ITEM}        xpath=//input[contains(@name,'item[height]')]
${CAMPO_WIDTH}              xpath=//input[contains(@name,'item[width]')]
${CAMPO_WEIGHT}             xpath=//input[contains(@name,'item[weight]')]
${BUTTON_CREATE_ITEM}       xpath=//input[contains(@type,'submit')]
${VALIDA_CRIACAO_ITEM}      xpath=//p[contains(.,'Item was successfully created.')]
${VOLTAR_PARA_ITEMS}        xpath=//a[contains(.,'Back to items')]
${BTN_END}                  \ue010
${BODY}                     xpath://body
${NAME_ITEM}                Cerveja Skol
${HEIGTH_ITEM}              10.0
${WIDTH_ITEM}               3.0
${WEIGHT_ITEM}              1.0

# Update item
${SHOW_ITEM}                xpath=(//a[contains(.,'Show this item')])[4]
${EDIT_ITEM}                xpath=//a[contains(.,'Edit this item')]
${CAMPO_NAME_EDIT}          xpath=//input[@name='item[name]']
${CAMPO_HEIGHT_EDIT}        xpath=//input[@name='item[height]']
${CAMPO_WIDTH_EDIT}         xpath=//input[@name='item[width]']
${CAMPO_WEIGHT_EDIT}        xpath=//input[@name='item[weight]']
${BOTAO_UPDATE_ITEM}        xpath=//input[contains(@type,'submit')]
${MSG_UPDATE}               xpath=//p[contains(.,'Item was successfully updated.')]
${BACK_TO_ITEM}             xpath=//a[contains(.,'Back to items')]
${NAME_EDITED}              Test
${HEIGHT_EDITED}            35.2
${WIDTH_EDITED}             22.3
${WEIGHT_EDITED}            30.2

#Destroy item
${BTN_DESTROY_ITEM}          xpath=//button[@type='submit'][contains(.,'Destroy this item')]
${MSG_DESTROY_ITEM}          xpath=//p[contains(.,'Item was successfully destroyed.')]
