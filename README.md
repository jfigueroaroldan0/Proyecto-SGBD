# Proyecto-SGBD

# Proyecto de Gestión de Bases de Datos con Python

Este repositorio contiene una implementación en Python para la conexión y gestión de múltiples Sistemas Gestores de Bases de Datos (SGBD). El proyecto está diseñado para interactuar de manera eficiente con **MariaDB**, **PostgreSQL**,  y **Oracle Database**.

## 🚀 Tecnologías Utilizadas

* **Lenguaje:** Python 3
* **SGBD Soportados:**
    * PostgreSQL (vía `psycopg2`)
    * MariaDB / MySQL (vía `mysqlclient`)
    * Oracle Database (vía `oracledb`)

## 📋 Requisitos Previos

Antes de instalar las dependencias de Python, asegúrate de tener instaladas las librerías de desarrollo en tu sistema Linux para evitar errores de compilación.

**En Ubuntu/Debian:**
```bash
sudo apt-get update
sudo apt-get install python3-dev default-libmysqlclient-dev build-essential libpq-dev
```

**1. Crear el entorno virtual llamado 'proyecto'**
```bash
python3 -m venv proyecto
```

**2. Activar el entorno virtual**
```bash
source proyecto/bin/activate
```

3. Instalar librerías para MySQL/MariaDB y PostgreSQL**
```bash
pip install mysqlclient psycopg2
```

**4. Instalar librería para Oracle Database**
```bash
python -m pip install oracledb --upgrade
```
