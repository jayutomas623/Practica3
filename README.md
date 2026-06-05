# Práctica 3 - Robot Framework
## Automatización de Pruebas - automationexercise.com

---

## Ejercicios Implementados

| # | Ejercicio | Archivo |
|---|-----------|---------|
| 1 | Login Correcto | tests/login_correcto.robot |
| 2 | Login Incorrecto | tests/login_incorrecto.robot |
| 3 | Búsqueda de Productos | tests/busqueda_productos.robot |

---

## Estructura del Proyecto

```
robot_project/
├── tests/
│   ├── login_correcto.robot       # TC01 - Login con credenciales válidas
│   ├── login_incorrecto.robot     # TC02 - Login con credenciales inválidas
│   └── busqueda_productos.robot   # TC03 - Búsqueda de productos
├── keywords/
│   ├── common_keywords.robot      # Keywords reutilizables comunes
│   ├── login_keywords.robot       # Keywords específicas de login
│   └── search_keywords.robot      # Keywords específicas de búsqueda
├── variables/
│   └── variables.robot            # Variables globales del proyecto
├── screenshots/                   # Capturas generadas automáticamente
├── reports/                       # Reportes de ejecución
└── README.md
```

---

## Instalación y Configuración

### Paso 1: Instalar Python
Descargar Python 3.8+ desde https://www.python.org/downloads/

### Paso 2: Instalar Robot Framework y SeleniumLibrary
```bash
pip install robotframework
pip install robotframework-seleniumlibrary
```

### Paso 3: Instalar ChromeDriver
```bash
pip install webdriver-manager
```
O descargar manualmente desde: https://chromedriver.chromium.org/downloads  
(debe coincidir con la versión de tu Chrome)

### Paso 4: Configurar credenciales
Editar el archivo `variables/variables.robot` y reemplazar:
```
${VALID_EMAIL}     tu_correo@ejemplo.com    <-- Tu email registrado
${VALID_PASSWORD}  tu_contraseña123          <-- Tu contraseña
```
> **NOTA:** Primero debes registrar una cuenta en https://automationexercise.com

---

## Ejecución de Pruebas

### Ejecutar todos los ejercicios
```bash
cd robot_project
robot --outputdir reports tests/
```

### Ejecutar un ejercicio específico
```bash
# Ejercicio 1
robot --outputdir reports tests/login_correcto.robot

# Ejercicio 2
robot --outputdir reports tests/login_incorrecto.robot

# Ejercicio 3
robot --outputdir reports tests/busqueda_productos.robot
```

### Ejecutar por etiqueta
```bash
robot --include smoke --outputdir reports tests/
```

---

## Ver Reportes
Después de ejecutar, abrir en el navegador:
- `reports/report.html` → Reporte visual completo
- `reports/log.html` → Log detallado con capturas
- `reports/output.xml` → Output en formato XML

---

## Capturas de Pantalla
Las capturas se guardan automáticamente en la carpeta `screenshots/`:
- `01_login_correcto_exitoso.png`
- `02_login_incorrecto_error.png`
- `03_busqueda_productos_resultados.png`
