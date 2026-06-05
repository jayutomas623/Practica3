*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/variables.robot

*** Keywords ***
Navegar A Pagina De Login
    [Documentation]    Navega a la URL del login y verifica que la pagina cargo correctamente
    Go To    ${BASE_URL}/login
    Wait Until Page Contains    Login to your account    timeout=${TIMEOUT}
    Page Should Contain    New User Signup!

Ingresar Email De Login
    [Documentation]    Escribe el email en el campo de inicio de sesion
    [Arguments]    ${email}
    Input Text    css=[data-qa="login-email"]    ${email}

Ingresar Contrasena De Login
    [Documentation]    Escribe la contrasena en el campo de inicio de sesion
    [Arguments]    ${password}
    Input Text    css=[data-qa="login-password"]    ${password}

Hacer Clic En Boton Login
    [Documentation]    Hace clic en el boton de iniciar sesion y espera respuesta
    Click Button    css=[data-qa="login-button"]
    Sleep    1s

Realizar Login Completo
    [Documentation]    Keyword compuesta: navega al login e ingresa las credenciales
    [Arguments]    ${email}    ${password}
    Navegar A Pagina De Login
    Ingresar Email De Login    ${email}
    Ingresar Contrasena De Login    ${password}
    Hacer Clic En Boton Login

Verificar Login Exitoso
    [Documentation]    Valida que el usuario ingreso correctamente al sistema
    Page Should Contain    ${MSG_LOGGED_IN}
    Element Should Be Visible    css=a[href="/logout"]

Verificar Mensaje De Error En Login
    [Documentation]    Valida que se muestra el mensaje de error de credenciales invalidas
    Page Should Contain    ${MSG_LOGIN_ERROR}
    Element Should Be Visible    xpath=//p[contains(text(),'Your email or password is incorrect!')]
