*** Settings ***
Documentation    Ejercicio 3 - Busqueda de Productos
...
...              Objetivo: Ingresar a la seccion de productos, realizar una busqueda
...              y validar que los resultados mostrados sean correctos.
...
...              Sitio: https://automationexercise.com
...
Library          SeleniumLibrary
Resource         ../variables/variables.robot
Resource         ../keywords/common_keywords.robot
Resource         ../keywords/search_keywords.robot

Suite Setup      Abrir Navegador Al Sitio
Suite Teardown   Cerrar Navegador

*** Test Cases ***
TC03 - Busqueda De Productos Por Termino
    [Documentation]    Verifica que al buscar un termino en la seccion de productos
    ...                los resultados mostrados sean relevantes y correctos.
    [Tags]    ejercicio3    busqueda    productos    smoke

    # --- PASO 1: Navegar a la seccion de Productos ---
    Navegar A Pagina De Productos

    # --- PASO 2: Ingresar el termino de busqueda ---
    Buscar Producto    ${SEARCH_TERM}

    # --- VALIDACION 1: El titulo "Searched Products" es visible ---
    Verificar Titulo De Seccion Resultados

    # --- VALIDACION 2: El termino buscado aparece en los resultados ---
    Verificar Termino En Resultados    ${SEARCH_TERM}

    # --- VALIDACION 3: Existe al menos un producto en los resultados ---
    Verificar Que Existen Productos En Resultados

    # --- EVIDENCIA: Captura de los resultados de busqueda ---
    Tomar Captura De Pantalla    03_busqueda_productos_resultados
