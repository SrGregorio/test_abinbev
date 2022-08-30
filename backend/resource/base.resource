*** Settings ***
Library         RequestsLibrary
Library         Collections
Library         JSONLibrary
Library         OperatingSystem
Library         SeleniumLibrary
Library         factories/inventory.py
Variables       constants.py



*** Keywords ***

Create the session
    Create Session    bees    ${BASE_URL}    verify=true

Busca id_item disponivél para utilizar em um inventário
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_ITEMS}${JSON}
    @{ID_RES}=    Set Variable    ${RESPOSTA_GET.json()}
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_INVENTORIES}${JSON}
    @{ID_ITEM_INVENTORY}=    Set Variable    ${RESPOSTA_GET.json()}

    FOR    ${ITEM}    IN    @{ID_RES}
        ${ITEM_LIST}=    Evaluate    str(${ITEM}[id])
        Append To List    ${CAD_ITEM_LIST}    ${ITEM_LIST}
    END

    FOR    ${ITEM_INVENT}    IN    @{ID_ITEM_INVENTORY}
        ${ITEM_INVENT_LIST}=    Evaluate    str(${ITEM_INVENT}[item_id])
        Append To List    ${CAD_ITEM_INVENT}    ${ITEM_INVENT_LIST}
    END

    ${COMBINED_LIST}=    Combine Lists    ${CAD_ITEM_LIST}    ${CAD_ITEM_INVENT}
    ${SET_LIST}=    Evaluate    set(${COMBINED_LIST})
    ${AVALIABLE_ID_LIST}=    Evaluate    ${SET_LIST}.difference(${CAD_ITEM_INVENT})
    ${AVALIABLE_ID_LIST}=    Evaluate    list(${AVALIABLE_ID_LIST})[-1]
    ${AVALIABLE_ID_ITEM}=    Evaluate    str(${AVALIABLE_ID_LIST}).strip('[]')
    ${AVALIABLE_ID_ITEM}=     Convert To Integer    ${AVALIABLE_ID_ITEM}
    Set Global Variable    ${AVALIABLE_ID_ITEM}

Busca id_deposit disponivél para utilizar em um inventário
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_DEPOSITS}${JSON}
    @{ID_RES}=    Set Variable    ${RESPOSTA_GET.json()}
    ${RESPOSTA_GET}=    GET On Session    bees    ${URL_INVENTORIES}${JSON}
    @{ID_ITEM_INVENTORY}=    Set Variable    ${RESPOSTA_GET.json()}

    FOR    ${DEPOSIT}    IN    @{ID_RES}
        ${DEPOSIT_LIST}=    Evaluate    str(${DEPOSIT}[id])
        Append To List    ${CAD_DEPOSIT_LIST}    ${DEPOSIT_LIST}
    END

    FOR    ${DEPOSIT_INVENT}    IN    @{ID_ITEM_INVENTORY}
        ${DEPOSIT_INVENT_LIST}=    Evaluate    str(${DEPOSIT_INVENT}[deposit_id])
        Append To List    ${CAD_DEPOSIT_INVENT}    ${DEPOSIT_INVENT_LIST}
    END

    ${COMBINED_LIST}=    Combine Lists    ${CAD_DEPOSIT_LIST}    ${CAD_DEPOSIT_INVENT}
    ${SET_LIST}=    Evaluate    set(${COMBINED_LIST})
    ${AVALIABLE_ID_LIST}=    Evaluate    ${SET_LIST}.difference(${CAD_DEPOSIT_INVENT})
    ${AVALIABLE_ID_LIST}=    Evaluate    list(${AVALIABLE_ID_LIST})[-1]
    ${AVALIABLE_ID_DEPOSIT}=    Evaluate    str(${AVALIABLE_ID_LIST}).strip('[]')
     ${AVALIABLE_ID_DEPOSIT}=    Convert To Integer    ${AVALIABLE_ID_DEPOSIT}
    Set Global Variable    ${AVALIABLE_ID_DEPOSIT}
