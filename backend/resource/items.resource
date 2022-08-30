*** Settings ***
Resource    base.resource


*** Keywords ***    ***
GET em items
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_ITEMS}${JSON}
    Set Test Variable    ${RESPOSTA_GET}

Trazer a listagem dos items
    GET em items
    ${dict}    Set Variable    ${RESPOSTA_GET.json()}

Trazer informações de um item
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_ITEMS}${JSON}
    ${ID_TEST}=    Get Value From Json    ${RESPOSTA_GET.json()}[-1]    $.id
    ${ID_ITEM}=    Evaluate    str(${ID_TEST}).strip('[]')
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_ITEMS}/${ID_ITEM}${JSON}
    ${ID_LIST}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.id
    ${NAME_ITEM}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.name
    ${HEIGHT}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.height
    ${WIDTH}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.width
    ${WEIGHT}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.weight
    Log
    ...    ID: ${ID_ITEM} | NAME: ${NAME_ITEM} | HEIGHT: ${HEIGHT} | WIDTH: ${WIDTH} | WEIGHT: ${WEIGHT} |
    Set Global Variable    ${ID_ITEM}
    Set Global Variable    ${NAME_ITEM}

Validar deposit id 
    Trazer informações de um item
    ${dict}    Set Variable    ${RESPOSTA_GET.json()}

Fazer inclsusão de um item
    ${HEADERS}=    Create Dictionary    content-type=application/json
    ${RESPOSTA_POST}=    POST On Session
    ...    bees
    ...    ${URL_ITEMS}${JSON}
    ...    json=${ITEM_MOCK}
    ...    headers=${HEADERS}
    ...    expected_status=any
    ${ID_NEW_ITEM}=    Get Value From Json    ${RESPOSTA_POST.json()}    $..id
    ${ID_NEW_ITEM}=    Evaluate    str(${ID_NEW_ITEM}).strip('[]')
    Set Test Variable    ${RESPOSTA_POST}
    Set GLobal Variable    ${ID_NEW_ITEM}
    Set GLobal Variable    ${HEADERS}

Validar id_item cadastrado
    Fazer inclsusão de um item
    ${ID_NEW_ITEM}=    Get Value From Json    ${RESPOSTA_POST.json()}    $..id
    ${ID_NEW_ITEM}=    Evaluate    str(${ID_NEW_ITEM}).strip('[]')
    Set GLobal Variable    ${ID_NEW_ITEM}

Fazer atualização com metodo PATCH no item
    Trazer informações de um item
    ${RESPOSTA_PATCH}=    PATCH On Session
    ...    bees
    ...    ${URL_ITEMS}/${ID_ITEM}${JSON}
    ...    json=${ITEM_PATCH_UPDATE}
    ...    headers=${HEADERS}
    Set Test Variable    ${RESPOSTA_PATCH}

Validar alteração PATCH
    Fazer atualização com metodo PATCH no item
    ${dict}    Set Variable    ${RESPOSTA_PATCH.json()}

Fazer atualização com metodo PUT no item
    Trazer informações de um item
    ${RESPOSTA_PUT}=    PUT On Session
    ...    bees
    ...    ${URL_ITEMS}/${ID_ITEM}${JSON}
    ...    json=${ITEM_PUT_UPDATE}
    ...    headers=${HEADERS}
    Set Test Variable    ${RESPOSTA_PUT}

Validar atualização com metodo PUT no item
    Fazer atualização com metodo PUT no item
    ${dict}    Set Variable    ${RESPOSTA_PUT.json()}

Deletar o cadastro do item
    Validar id_item cadastrado
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_ITEMS}${JSON}
    ${RESPOSTA_DEL}=    DELETE On Session    bees    ${URL_ITEMS}/${ID_NEW_ITEM}${JSON}
    Set Test Variable    ${RESPOSTA_DEL}

Validar cadastro deletado de um item
    Deletar o cadastro do item
    ${dict}    Set Variable    ${RESPOSTA_DEL.headers}

#BDD
that a GET request is made on the items list
    GET em items

that a GET request is made on the item ID
    GET em items
    Trazer informações de um item

that a POST request is made on the item
    Fazer inclsusão de um item
    Trazer informações de um item

that a PATCH request is made on the item
    Fazer atualização com metodo PATCH no item

that a PUT request is made on the item
    Fazer atualização com metodo PUT no item

that a delete request is made on the item
    Deletar o cadastro do item

to get request status code
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_GET.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_GET.status_code}

post request status code returns
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_POST.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_POST.status_code}

patch request status code returns
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_PATCH.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_PATCH.status_code}

put request status code returns
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_PUT.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_PUT.status_code}

delete request status code returns
    [Arguments]    ${STATUSCODE_DESEJADO}
    Should Be Equal As Strings    ${RESPOSTA_DEL.status_code}    ${STATUSCODE_DESEJADO}
    Log    ${RESPOSTA_DEL.status_code}

the return of the request is ok
    Trazer a listagem dos items

the id request return is ok
    Validar id_item cadastrado

returning a new id of the created item
    Validar id_item cadastrado

the update return via patch is ok
    Validar alteração PATCH

the update return via put is ok
    Validar atualização com metodo PUT no item

the return of the request via delete is ok
    Validar cadastro deletado de um item
