*** Settings ***
Resource    base.resource


*** Keywords ***    ***
GET em invetários
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_INVENTORIES}${JSON}
    Set Test Variable    ${RESPOSTA_GET}

Trazer a listagem dos inventários
    GET em invetários
    ${dict}    Set Variable    ${RESPOSTA_GET.json()}

Trazer informações de um inventory
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_INVENTORIES}${JSON}
    ${ID_TEST}=    Get Value From Json    ${RESPOSTA_GET.json()}[0]    $.id
    ${ID_INVENTORY}=    Evaluate    str(${ID_TEST}).strip('[]')
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_INVENTORIES}/${ID_INVENTORY}${JSON}
    ${ID_LIST}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.id
    ${ITEM_ID}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.item_id
    ${DEPOSIT_ID}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.deposit_id
    ${ITEM_COUNT}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.item_count
    &{INFOS}=    Create Dictionary
    ...    ID=${ID_INVENTORY}
    ...    ITEM_ID=${ITEM_ID}
    ...    DEPOSIT_ID=${DEPOSIT_ID}
    ...    ITEM_COUNT=${ITEM_COUNT}
    Log    ${INFOS}

    Set Suite Variable    ${ID_INVENTORY}
    Set Test Variable    ${ITEM_ID}
    Set Test Variable    ${DEPOSIT_ID}
    Set Test Variable    ${ITEM_COUNT}

Validar inventário id 
    Trazer informações de um inventory
    ${dict}    Set Variable    ${RESPOSTA_GET.json()}

Fazer inclsusão de um inventory
    Busca id_item disponivél para utilizar em um inventário
    Busca id_deposit disponivél para utilizar em um inventário
    ${HEADERS}=    Create Dictionary    content-type=application/json
    ${inventory}=    inventory    ${AVALIABLE_ID_ITEM}    ${AVALIABLE_ID_DEPOSIT}
    ${RESPOSTA_POST}=    POST On Session
    ...    bees
    ...    ${URL_INVENTORIES}${JSON}
    ...    json=${inventory}
    ...    headers=${HEADERS}
    ...    expected_status=any
    Set Global Variable    ${HEADERS}
    Set Global Variable    ${inventory}
    Set Test Variable    ${RESPOSTA_POST}

Validar id_inventory cadastrado
    Fazer inclsusão de um inventory
    ${ID_NEW_INVENTORY}=    Get Value From Json    ${RESPOSTA_POST.json()}    $..id
    ${ID_NEW_INVENTORY}=    Evaluate    str(${ID_NEW_INVENTORY}).strip('[]')
    Set Test Variable    ${ID_NEW_INVENTORY}

Fazer atualização de um inventory via PATCH
    Trazer informações de um inventory
    Busca id_item disponivél para utilizar em um inventário
    Busca id_deposit disponivél para utilizar em um inventário
    Validar id_inventory cadastrado
    ${HEADERS}=    Create Dictionary    content-type=application/json
    ${RESPOSTA_PATCH}=    PATCH On Session
    ...    bees
    ...    ${URL_INVENTORIES}/${ID_NEW_INVENTORY}${JSON}
    ...    json=${inventory}
    ...    headers=${HEADERS}
    ...    expected_status=any
    Set Test Variable    ${RESPOSTA_PATCH}
    Set Test Variable    ${AVALIABLE_ID_ITEM}
    Set Test Variable    ${AVALIABLE_ID_DEPOSIT}

Validar alteração PATCH
    Fazer atualização de um inventory via PATCH
    ${dict}    Set Variable    ${RESPOSTA_PATCH.json()}

Fazer atualização de um inventory via PUT
    Trazer informações de um inventory
    Busca id_item disponivél para utilizar em um inventário
    Busca id_deposit disponivél para utilizar em um inventário
    Validar id_inventory cadastrado
    ${HEADERS}=    Create Dictionary    content-type=application/json
    ${RESPOSTA_PUT}=    PATCH On Session
    ...    bees
    ...    ${URL_INVENTORIES}/${ID_NEW_INVENTORY}${JSON}
    ...    json=${inventory}
    ...    headers=${HEADERS}
    ...    expected_status=any
    Set Test Variable    ${RESPOSTA_PUT}

Validar atualização de um inventory via PUT
    Fazer atualização de um inventory via PUT
    ${dict}    Set Variable    ${RESPOSTA_PUT.json()}

Deletar o cadastro de um inventory
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_INVENTORIES}${JSON}
    ${ID_TEST}=    Get Value From Json    ${RESPOSTA_GET.json()}[0]    $.id
    ${ID_INVENTORY}=    Evaluate    str(${ID_TEST}).strip('[]')
    ${RESPOSTA_DEL}=    DELETE On Session    bees    ${URL_INVENTORIES}/${ID_INVENTORY}${JSON}
    Set Test Variable    ${RESPOSTA_DEL}

Validar cadastro deletado de um inventory
    Deletar o cadastro de um inventory
    ${dict}    Set Variable    ${RESPOSTA_DEL.headers}

#BDD

that a GET request is made on the inventory list
    GET em invetários

that a GET request is made on the inventory ID
    GET em invetários
    Trazer informações de um inventory

to get request status code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_GET.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_GET.status_code}

that a POST request is made on the inventory
    Fazer inclsusão de um inventory
    Validar id_inventory cadastrado

post request status code returns
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_POST.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_POST.status_code}

that a PATCH request is made on the inventory
    Fazer atualização de um inventory via PATCH

patch request status code returns
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_PATCH.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_PATCH.status_code}

that when you make a PUT request on inventories
    Fazer atualização de um inventory via PUT

put request status code returns
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_PUT.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_PUT.status_code}

that a PUT request is made on the inventory
    Fazer atualização de um inventory via PUT

that when you make a DELETE request on an inventory
    Deletar o cadastro de um inventory

delete request status code returns
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_DEL.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_DEL.status_code}

the return of the request is ok
    Trazer a listagem dos inventários

returning a new id of the created item
    Validar id_inventory cadastrado

the id request return is ok
    Validar id_inventory cadastrado

the return of the request via delete is ok
    Validar cadastro deletado de um inventory

the update return via patch is ok
    Validar alteração PATCH

the update return via put is ok
    Validar atualização de um inventory via PUT
