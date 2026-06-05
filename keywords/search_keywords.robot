*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/variables.robot

*** Keywords ***
Navegar A Pagina De Productos
    [Documentation]    Navega a la seccion de productos del sitio
    Go To    ${BASE_URL}/products
    Wait Until Page Contains    All Products    timeout=${TIMEOUT}
    Page Should Contain    ${MSG_ALL_PRODUCTS}

Ingresar Termino De Busqueda
    [Documentation]    Escribe el termino en el campo de busqueda
    [Arguments]    ${termino}
    Wait Until Element Is Visible    id=search_product    timeout=${TIMEOUT}
    Input Text    id=search_product    ${termino}

Hacer Clic En Boton Buscar
    [Documentation]    Hace clic en el boton de busqueda y espera resultados
    Click Button    id=submit_search
    Wait Until Page Contains    ${MSG_SEARCHED}    timeout=${TIMEOUT}

Buscar Producto
    [Documentation]    Keyword compuesta: ingresa termino y ejecuta la busqueda
    [Arguments]    ${termino}
    Ingresar Termino De Busqueda    ${termino}
    Hacer Clic En Boton Buscar

Verificar Titulo De Seccion Resultados
    [Documentation]    Valida que el titulo de resultados sea "Searched Products"
    Element Should Be Visible    xpath=//h2[contains(text(),'Searched Products')]
    Page Should Contain    ${MSG_SEARCHED}

Verificar Termino En Resultados
    [Documentation]    Valida que los productos mostrados contienen el termino buscado
    [Arguments]    ${termino}
    Page Should Contain    ${termino}

Verificar Que Existen Productos En Resultados
    [Documentation]    Valida que hay al menos un producto listado en los resultados
    Page Should Contain Element    css=.productinfo
    Page Should Contain Element    css=.features_items .col-sm-4
