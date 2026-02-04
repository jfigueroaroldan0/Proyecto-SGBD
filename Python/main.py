from funciones import *

# Creación usuario y base de datos MariaDB

# CREATE USER 'hotel'@'localhost' IDENTIFIED BY 'passwd'; 
# CREATE DATABASE gestionhotel;
# GRANT ALL PRIVILEGES ON gestionhotel.* TO 'hotel'@'localhost';

# Creación usuario y base de datos PostgreSQL

# CREATE user hotel WITH PASSWORD 'password';
# CREATE DATABASE gestionhotel OWNER hotel;
# GRANT ALL PRIVILEGES ON DATABASE gestionhotel TO hotel;

# Creación usuario Oracle

# ALTER SESSION SET "_ORACLE_SCRIPT"=True;
# CREATE USER hotel IDENTIFIED BY passwd;
# GRANT connect, resource TO hotel;
# GRANT CREATE VIEW TO hotel;
# GRANT UNLIMITED TABLESPACE TO hotel;

Sistema_DB()

