*** Settings ***
Resource    ../components/items.components.robot
Resource    ../pages/commons/hooks.page.commons.robot


*** Keywords ***
Clicar em Items
    Wait Until Element Is Visible    ${ITEMS}
    Click Element    ${ITEMS}

Clicar no botao novo item
    Sleep    2
    Wait Until Element Is Enabled    ${NEW_ITEM}
    Element Should Be Visible    ${NEW_ITEM}
    Press Keys    ${BODY}    ${BTN_END}
    Press Keys    ${BODY}    ${BTN_END}
    Press Keys    ${NEW_ITEM}    Mouse Down
    Wait Until Element Is Visible    ${VALIDA_NEW_ITEM}
    Page Should Contain Element    ${VALIDA_NEW_ITEM}

Inserir os dados do formulário
    Input Text    ${CAMPO_NAME_ITEM}    ${NAME_ITEM}
    Input Text    ${CAMPO_HEIGHT_ITEM}    ${HEIGTH_ITEM}
    Input Text    ${CAMPO_WIDTH}    ${WIDTH_ITEM}
    Input Text    ${CAMPO_WEIGHT}    ${WEIGHT_ITEM}

Clicar no botão criar item
    Click Element    ${BUTTON_CREATE_ITEM}

Validar a criação do novo item e voltar a página de items
    Wait Until Element Is Visible    ${VALIDA_CRIACAO_ITEM}
    Page Should Contain Element    ${VALIDA_CRIACAO_ITEM}
    Click Element    ${VOLTAR_PARA_ITEMS}

Clicar em Show This Item
    Element Should Be Visible    ${SHOW_ITEM}
    Wait Until Element Is Enabled    ${SHOW_ITEM}
    Press Keys    ${SHOW_ITEM}    Mouse Down

Editar um Cadastro de item
    Wait Until Element Is Visible    ${EDIT_ITEM}
    Click Element    ${EDIT_ITEM}
    Wait Until Element Is Visible    ${BOTAO_UPDATE_ITEM}

    Press Keys    ${CAMPO_NAME_EDIT}    CTRL+A+DELETE
    Input Text    ${CAMPO_NAME_EDIT}    ${NAME_EDITED}

    Press Keys    ${CAMPO_HEIGHT_EDIT}    CTRL+A+DELETE
    Input Text    ${CAMPO_HEIGHT_EDIT}    ${HEIGHT_EDITED}

    Press Keys    ${CAMPO_WIDTH_EDIT}    CTRL+A+DELETE
    Input Text    ${CAMPO_WIDTH_EDIT}    ${WIDTH_EDITED}

    Press Keys    ${CAMPO_WEIGHT_EDIT}    CTRL+A+DELETE
    Input Text    ${CAMPO_WEIGHT_EDIT}    ${WEIGHT_EDITED}

    Wait Until Element Is Visible    ${BOTAO_UPDATE_ITEM}
    Click Element    ${BOTAO_UPDATE_ITEM}

Validação da mensagem de atualização com sucesso
    Page Should Contain Element    ${MSG_UPDATE}
    Wait Until Element Is Visible    ${BACK_TO_ITEM}
    Click Element    ${BACK_TO_ITEM}

Click no botão destroy item
    Wait Until Element Is Visible    ${BTN_DESTROY_ITEM}
    Click Button    ${BTN_DESTROY_ITEM}

Validação da mensagem de item excluído
    Wait Until Element Is Visible    ${MSG_DESTROY_ITEM}
    Page Should Contain Element    ${MSG_DESTROY_ITEM}

# Gherking BDD

Dado que esteja na página de items
    Clicar em Items

Quandro clicar no botão e preencher o formulário do novo item
    Clicar no botao novo item
    Inserir os dados do formulário

E clicar no botão para criar o item
    Clicar no botão criar item

Então será validado o novo item e retornará a páginas items
    Validar a criação do novo item e voltar a página de items

Quando clicar em visualizar o cadastro de um item
    Clicar em Show This Item

 E alterar o cadastro do item selecionado
    Editar um Cadastro de item

Então validará a mensagem de item alterado com sucesso e retornará a página de item
    Validação da mensagem de atualização com sucesso

E clicar em destroy this item
    Click no botão destroy item

Então validará a mensagem de item excluído com sucesso
    Validação da mensagem de item excluído
