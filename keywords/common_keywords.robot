*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/variables.robot

*** Keywords ***
Abrir Navegador Al Sitio
    [Documentation]    Abre el navegador Chrome y navega a la URL base del sitio
    Open Browser    ${BASE_URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Implicit Wait    ${TIMEOUT}

Cerrar Navegador
    [Documentation]    Cierra completamente el navegador al finalizar la suite
    Close Browser

Tomar Captura De Pantalla
    [Documentation]    Guarda una captura de pantalla en la carpeta screenshots
    [Arguments]    ${nombre_archivo}
    Capture Page Screenshot    screenshots/${nombre_archivo}.png

Ir A URL
    [Documentation]    Navega a una URL especifica y espera a que cargue el cuerpo
    [Arguments]    ${url}
    Go To    ${url}
    Wait Until Page Contains Element    tag:body    timeout=${TIMEOUT}

Verificar Titulo De La Pagina
    [Documentation]    Verifica que el titulo de la pagina coincida con el valor esperado
    [Arguments]    ${titulo_esperado}
    Title Should Be    ${titulo_esperado}

Esperar Y Verificar Elemento Visible
    [Documentation]    Espera y verifica que un elemento sea visible en la pagina
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=${TIMEOUT}
    Element Should Be Visible    ${locator}
