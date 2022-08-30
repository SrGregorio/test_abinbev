*** Settings ***
Resource    base.resource


*** Keywords ***    ***
GET em deposits
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_DEPOSITS}${JSON}
    Set Test Variable    ${RESPOSTA_GET}

Trazer a listagem dos depositos
    GET em deposits
    ${dict}    Set Variable    ${RESPOSTA_GET.json()}

Trazer informações de um deposito
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_DEPOSITS}${JSON}
    ${ID_TEST}=    Get Value From Json    ${RESPOSTA_GET.json()}[-1]    $.id
    ${ID_DEPOSIT}=    Evaluate    str(${ID_TEST}).strip('[]')
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_DEPOSITS}/${ID_DEPOSIT}${JSON}
    ${ID_LIST}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.id
    ${NAME_DEPOSIT}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.name
    ${ADDRESS}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.address
    ${CITY}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.city
    ${STATE}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.state
    ${ZIPCODE}=    Get Value From Json    ${RESPOSTA_GET.json()}    $.zipcode
    Log
    ...    ID: ${ID_LIST} | NAME: ${NAME_DEPOSIT} | ADDRESS: ${ADDRESS} | CITY: ${CITY} | STATE: ${STATE} | ZIPCODE: ${ZIPCODE}
    Set Global Variable    ${ID_DEPOSIT}
    Set Global Variable    ${NAME_DEPOSIT}
    #Set Global Variable    ${RESPOSTA_GET}

Validar deposit id 
    Trazer informações de um deposito
    ${dict}    Set Variable    ${RESPOSTA_GET.json()}

Fazer inclusão de um deposito
    ${HEADERS}=    Create Dictionary    content-type=application/json
    ${RESPOSTA_POST}=    POST On Session
    ...    bees
    ...    ${URL_DEPOSITS}${JSON}
    ...    json=${DEPOSIT_MOCK}
    ...    headers=${HEADERS}
    ...    expected_status=any
    ${ID_NEW_DEPOSIT}=    Get Value From Json    ${RESPOSTA_POST.json()}    $..id
    ${ID_NEW_DEPOSIT}=    Evaluate    str(${ID_NEW_DEPOSIT}).strip('[]')
    Set Test Variable    ${RESPOSTA_POST}
    Set GLobal Variable    ${ID_NEW_DEPOSIT}
    Set GLobal Variable    ${HEADERS}

Validar id_deposit cadastrado
    Fazer inclusão de um deposito
    ${ID_NEW_DEPOSIT}=    Get Value From Json    ${RESPOSTA_POST.json()}    $..id
    ${ID_NEW_DEPOSIT}=    Evaluate    str(${ID_NEW_DEPOSIT}).strip('[]')
    Set Test Variable    ${ID_NEW_DEPOSIT}

Fazer atualização com metodo PATCH no deposito
    Trazer informações de um deposito
    ${RESPOSTA_PATCH}=    PATCH On Session
    ...    bees
    ...    ${URL_DEPOSITS}/${ID_DEPOSIT}${JSON}
    ...    json=${DEPOSIT_PATCH_UPDATE}
    ...    headers=${HEADERS}
    Set Test Variable    ${RESPOSTA_PATCH}

Validar alteração PATCH
    Fazer atualização com metodo PATCH no deposito
    ${dict}    Set Variable    ${RESPOSTA_PATCH.json()}

Fazer atualização com metodo PUT no deposito
    Trazer informações de um deposito
    ${RESPOSTA_PUT}=    PUT On Session
    ...    bees
    ...    ${URL_DEPOSITS}/${ID_DEPOSIT}${JSON}
    ...    json=${DEPOSIT_PUT_UPDATE}
    ...    headers=${HEADERS}
    Set Test Variable    ${RESPOSTA_PUT}

Validar atualização com metodo PUT no deposito
    Fazer atualização com metodo PUT no deposito
    ${dict}    Set Variable    ${RESPOSTA_PUT.json()}

Deletar o cadastro do deposito
    Validar id_deposit cadastrado
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_DEPOSITS}${JSON}
    ${RESPOSTA_DEL}=    DELETE On Session    bees    ${URL_DEPOSITS}/${ID_NEW_DEPOSIT}${JSON}
    Set Test Variable    ${RESPOSTA_DEL}

Validar cadastro deletado de um inventory
    Deletar o cadastro do deposito
    ${dict}    Set Variable    ${RESPOSTA_DEL.headers}

# BDD

that a GET request is made on the deposits list
    GET em deposits

that a GET request is made on the deposity ID
    GET em deposits
    Trazer informações de um deposito

that a POST request is made on the deposity
    Fazer inclusão de um deposito
    Trazer informações de um deposito

that a PATCH request is made on the deposity
    Fazer atualização com metodo PATCH no deposito

that a PUT request is made on the deposity
    Fazer atualização com metodo PUT no deposito

that a delete request is made on the deposity
    Deletar o cadastro do deposito

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
    Trazer a listagem dos depositos

the id request return is ok
    Validar id_deposit cadastrado

returning a new id of the created item
    Validar id_deposit cadastrado

the update return via patch is ok
    Validar alteração PATCH

the update return via put is ok
    Validar atualização com metodo PUT no deposito

the return of the request via delete is ok
    Validar cadastro deletado de um inventory