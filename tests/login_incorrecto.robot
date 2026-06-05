*** Settings ***
Documentation    Ejercicio 2 - Login Incorrecto
...
...              Objetivo: Automatizar un inicio de sesion con credenciales invalidas
...              y validar el mensaje de error mostrado por la aplicacion.
...
...              Sitio: https://automationexercise.com
...
Library          SeleniumLibrary
Resource         ../variables/variables.robot
Resource         ../keywords/common_keywords.robot
Resource         ../keywords/login_keywords.robot

Suite Setup      Abrir Navegador Al Sitio
Suite Teardown   Cerrar Navegador

*** Test Cases ***
TC02 - Login Con Credenciales Invalidas
    [Documentation]    Verifica que al ingresar un email o contrasena incorrectos
    ...                el sistema muestra un mensaje de error apropiado.
    [Tags]    ejercicio2    login    negativo

    # --- PASO 1: Navegar a la pagina de login ---
    Navegar A Pagina De Login

    # --- PASO 2: Ingresar credenciales invalidas ---
    Ingresar Email De Login         ${INVALID_EMAIL}
    Ingresar Contrasena De Login    ${INVALID_PASSWORD}

    # --- PASO 3: Hacer clic en el boton de login ---
    Hacer Clic En Boton Login

    # --- VALIDACION 1: La pagina contiene el mensaje de error esperado ---
    Page Should Contain    ${MSG_LOGIN_ERROR}

    # --- VALIDACION 2: El elemento del mensaje de error es visible ---
    Element Should Be Visible    xpath=//p[contains(text(),'Your email or password is incorrect!')]

    # --- EVIDENCIA: Captura de pantalla mostrando el error ---
    Tomar Captura De Pantalla    02_login_incorrecto_error
