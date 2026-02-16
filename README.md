# Proyecto de Gestión de Bases de Datos con Python

Este repositorio contiene una implementación en Python para la conexión y gestión de múltiples Sistemas Gestores de Bases de Datos (SGBD). El proyecto está diseñado para interactuar de manera eficiente con **MariaDB**, **PostgreSQL**,  y **Oracle Database**.

## 🚀 Tecnologías Utilizadas

* **Lenguaje:** Python 3
* **SGBD Soportados:**
    * MariaDB / MySQL (`mysqlclient`)
    * PostgreSQL (`psycopg2`)
    * Oracle Database (`oracledb`)

## 📋 Requisitos Previos

Antes de instalar las dependencias de Python, asegúrate de tener instaladas las librerías en tu sistema Linux para evitar errores de compilación si lo quieres hacer con estas dependencias, otra opción es hacerlo todo con entorno virtual que es como yo lo he hecho en la documentación para tenerlo aislado de mi sistema.

**En Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install python3-dev default-libmysqlclient-dev build-essential libpq-dev
```

**1. Clonar el repositorio y entrar en el directorio**
```bash
git clone https://github.com/jfigueroaroldan0/Proyecto-SGBD
cd Proyecto-SGBD
```

**2. Crear el entorno virtual llamado 'proyecto'**
```bash
python3 -m venv proyecto
```

**3. Activar el entorno virtual**
```bash
source proyecto/bin/activate
```

**4. Para hacerlo automático instalando todas las dependencias del fichero requeriments**
```bash
pip install -r requeriments.txt
```

**5. Para hacerlo de manera manual instalamos librerías para MySQL/MariaDB y PostgreSQL**
```bash
pip install mysqlclient psycopg2
```

**6. Instalamos librería para Oracle Database**
```bash
python3 -m pip install oracledb --upgrade
```
