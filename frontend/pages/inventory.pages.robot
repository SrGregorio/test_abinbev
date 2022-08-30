*** Settings ***
Resource    ../components/inventory.components.robot
Resource    ../pages/commons/hooks.page.commons.robot


*** Keywords ***
Clicar em Inventory
    Wait Until Element Is Visible    ${INVENTORY}
    Click Element    ${INVENTORY}

Clicar no botao novo inventory
    Wait Until Element Is Enabled    ${NEW_INVENTORY}
    Element Should Be Visible    ${NEW_INVENTORY}
    Press Keys    ${BODY}    ${BTN_END}
    Press Keys    ${BODY}    ${BTN_END}
    Press Keys    ${NEW_INVENTORY}    Mouse Down
    Wait Until Element Is Visible    ${VALIDA_NEW_INVENTORY}
    Page Should Contain Element    ${VALIDA_NEW_INVENTORY}

Inserir os dados do formulário
    Click Element    ${SELECT_ITEM_INVENTORY}
    Click Element    ${SELECT_DEPOSIT_INVENTORY}
    Convert To Number    ${ITEM_COUNT}
    Input Text    ${CAMPO_ITEM_COUNT}    ${ITEM_COUNT}

Clicar no botão criar inventory
    Click Element    ${BUTTON_CREATE_INVENTORY}

Validar a criação do novo inventory e voltar a página de inventory
    Wait Until Element Is Visible    ${VALIDA_CRIACAO_INVENTORY}
    Page Should Contain Element    ${VALIDA_CRIACAO_INVENTORY}
    Click Element    ${BACK_TO_INVENTORIES}

Clicar em Show This Inventory
    Element Should Be Visible    ${SHOW_INVENTORY}
    Wait Until Element Is Enabled    ${SHOW_INVENTORY}
    Press Keys    ${SHOW_INVENTORY}    Mouse Down

Click no botão destroy inventory
    Wait Until Element Is Visible    ${BUTTON_DESTROY_INVENTORY}
    Click Button    ${BUTTON_DESTROY_INVENTORY}

Validação da mensagem de inventory excluído
    Wait Until Element Is Visible    ${MSG_DESTROY_INVENTORY}
    Page Should Contain Element    ${MSG_DESTROY_INVENTORY}

Editar um Cadastro de item
    Wait Until Element Is Visible    ${EDIT_INVENTORY}
    Click Element    ${EDIT_INVENTORY}
    Wait Until Element Is Visible    ${BUTTON_UPDATE_INVENTORY}

    Click Element    ${ITEM_EDITED}
    Click Element    ${DESPOSIT_EDITED}
    Input Text    ${CAMPO_ITEM_COUNT}    ${ITEM_EDITED}

    Wait Until Element Is Visible    ${BUTTON_UPDATE_INVENTORY}
    Click Element    ${BUTTON_UPDATE_INVENTORY}

Validação da mensagem de atualização com sucesso
    Wait Until Element Is Visible    ${MSG_UPDATE}
    Page Should Contain Element    ${MSG_UPDATE}

#Gherking BDD

 Dado que esteja na página de inventário
    Clicar em Inventory

Quandro clicar no botão e preencher o formulário do novo inventory
    Clicar no botao novo inventory
    Inserir os dados do formulário

E clicar no botão para criar o iventory
    Clicar no botão criar inventory

Então será validado o novo inventory e retornará a página da listagem dos inventories
    Validar a criação do novo inventory e voltar a página de inventory

Quando clicar em visualizar o cadastro de um inventory
    Clicar em Show This Inventory

E clicar em destroy this inventory
    Click no botão destroy inventory

Então validará a mensagem de inventory excluído com sucesso
    Validação da mensagem de inventory excluído

E alterar o cadastro do iventory selecionado
    Editar um Cadastro de item

Então validará a mensagem alterado com sucesso e retornará a página da listagem de iventory
    Validação da mensagem de atualização com sucesso
