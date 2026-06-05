*** Settings ***
Documentation    Ejercicio 1 - Login Correcto
...
...              Objetivo: Automatizar el inicio de sesion con credenciales validas
...              y validar el acceso exitoso al sistema.
...
...              Sitio: https://automationexercise.com
...              Prerequisito: Tener una cuenta registrada en el sitio.
...
Library          SeleniumLibrary
Resource         ../variables/variables.robot
Resource         ../keywords/common_keywords.robot
Resource         ../keywords/login_keywords.robot

Suite Setup      Abrir Navegador Al Sitio
Suite Teardown   Cerrar Navegador

*** Test Cases ***
TC01 - Login Con Credenciales Validas
    [Documentation]    Verifica que un usuario puede iniciar sesion exitosamente
    ...                con email y contraseña correctos registrados en el sistema.
    [Tags]    ejercicio1    login    positivo    smoke

    # --- PASO 1: Navegar a la pagina de login ---
    Navegar A Pagina De Login

    # --- PASO 2: Ingresar credenciales validas ---
    Ingresar Email De Login         ${VALID_EMAIL}
    Ingresar Contrasena De Login    ${VALID_PASSWORD}

    # --- PASO 3: Hacer clic en el boton de login ---
    Hacer Clic En Boton Login

    # --- VALIDACION 1: La pagina contiene "Logged in as" ---
    Page Should Contain    ${MSG_LOGGED_IN}

    # --- VALIDACION 2: El boton Logout esta visible (sesion activa) ---
    Element Should Be Visible    css=a[href="/logout"]

    # --- EVIDENCIA: Captura de pantalla del login exitoso ---
    Tomar Captura De Pantalla    01_login_correcto_exitoso
