import sys
import MySQLdb
import psycopg2
import oracledb 

separador = "=" * 60

def conectar_mysql():
    try:
        db = MySQLdb.connect(host="localhost", user="hotel", passwd="passwd", db="gestionhotel")
        print(">> Conectado a MySQL/MariaDB correctamente.")
        return db
    except MySQLdb.Error as error:
        print("Error al conectar a MySQL:", error)
        return None

def conectar_postgresql():
    try:
        db = psycopg2.connect(host="localhost", database="gestionhotel", user="hotel", password="password")
        print(">> Conectado a PostgreSQL correctamente.")
        return db
    except psycopg2.Error as error:
        print("Error al conectar a PostgreSQL:", error)
        return None

def conectar_oracle():
    try:
        dsn_str = "192.168.122.167:1521/xe"
        
        db = oracledb.connect(
            user="hotel", 
            password="passwd", 
            dsn=dsn_str
        )
        print(">> Conectado a Oracle correctamente.")
        return db
    except oracledb.Error as error:
        print("Error al conectar a Oracle:", error)
        return None

def desconectar_bd(db):
    if db:
        db.close()
        print(">> Base de datos desconectada.")


def Sistema_DB():
    opcion = 0
    db = None
    tipo_db = ""
    
    menu_principal = f'''
{separador}
MENÚ DE CONEXIÓN A SGBD
{separador}
    1. MySQL / MariaDB
    2. PostgreSQL
    3. Oracle
    4. Salir
    '''

    while opcion != 4:
        print(menu_principal)
        
        try:
            opcion = int(input("Introduce una opción: "))
            
            if opcion == 1:
                db = conectar_mysql()
                tipo_db = "mysql"
            elif opcion == 2:
                db = conectar_postgresql()
                tipo_db = "postgres"
            elif opcion == 3:
                db = conectar_oracle()
                tipo_db = "oracle"
            elif opcion == 4:
                print("Has salido del programa, ¡Hasta luego!")
                sys.exit(0)
            
            if db:
                menu_operaciones(db, tipo_db)
                desconectar_bd(db)
                db = None 

        except ValueError:
            print("Opción incorrecta, introduzca un número válido.")

def menu_operaciones(db, tipo_db):
    opcion = 0
    
    menu_operaciones = f'''
{separador}
OPERACIONES DML ({tipo_db})
{separador}
    1. Listar tipos de habitaciones
    2. Buscar habitaciones por precio
    3. Ver reservas de un cliente
    4. Registrar nuevo cliente
    5. Eliminar servicios de reserva
    6. Subir precios por piso
    7. Volver al menú de SGBD
    '''
    
    while opcion != 7:
        print(menu_operaciones)
        
        try:
            opcion = int(input("Introduce una opción: "))

            if opcion == 1:
                listar_habitaciones_por_tipo(db, tipo_db)

            elif opcion == 2:
                buscar_habitaciones_disponibles(db, tipo_db)

            elif opcion == 3:
                buscar_reservas_cliente(db, tipo_db)

            elif opcion == 4:
                registrar_nuevo_cliente(db, tipo_db)

            elif opcion == 5:
                eliminar_servicios_reserva(db, tipo_db)

            elif opcion == 6:
                actualizar_precio_piso(db, tipo_db)
            
        except ValueError:
            print("No has introducido una opción correcta.")

def listar_habitaciones_por_tipo(db, tipo_db):
    try:
        cursor = db.cursor()
        
        if tipo_db == "oracle":
            sentencia = "SELECT tipo, COUNT(*) FROM habitaciones GROUP BY tipo"
            cursor.execute(sentencia)
        else:
            sentencia = "SELECT tipo, COUNT(*) FROM habitaciones GROUP BY tipo"
            cursor.execute(sentencia)
            
        registros = cursor.fetchall()
        
        print("\n--- Resumen de Habitaciones ---")
        
        if not registros:
            print("No se encontraron registros.")
        else:
            for r in registros:
                print(f"Tipo: {r[0]} | Cantidad: {r[1]}")
            
        cursor.close() 
    except Exception as e:
        print("Error en la consulta:", e)

def buscar_habitaciones_disponibles(db, tipo_db):
    try:
        p_min = float(input("Precio mínimo: "))
        p_max = float(input("Precio máximo: "))
        
        cursor = db.cursor()
        
        if tipo_db == "oracle":
            sentencia = "SELECT numero, tipo, precio_noche FROM habitaciones WHERE precio_noche BETWEEN :pmin AND :pmax AND disponible = 'S'"
            cursor.execute(sentencia, {'pmin': p_min, 'pmax': p_max})

        else:
            sentencia = "SELECT numero, tipo, precio_noche FROM habitaciones WHERE precio_noche BETWEEN %s AND %s AND disponible = 'S'" % (p_min, p_max)
            cursor.execute(sentencia)

        registros = cursor.fetchall()
        
        print("--- Habitaciones Disponibles ---")

        if not registros:
            print("No se encontraron registros.")
        else:
            for r in registros:
                print(f"Habitación: {r[0]} | Tipo: {r[1]} | Precio: {r[2]}")
        
        cursor.close()

    except ValueError:
        print("Error: Debes introducir números para el precio.")
    except Exception as e:
        print("Error en la base de datos:", e)

def buscar_reservas_cliente(db, tipo_db):
    dnibusqueda = input("Introduce el DNI del cliente: ")
    try:
        cursor = db.cursor()
        
        if tipo_db == "oracle":
            sentencia = "SELECT c.nombre, r.fecha_entrada, h.numero FROM clientes c, reservas r, habitaciones h WHERE c.id_cliente = r.id_cliente AND r.id_habitacion = h.id_habitacion AND c.dni = :dni"
            cursor.execute(sentencia, {'dni': dnibusqueda})
        else:
            sentencia = "SELECT c.nombre, r.fecha_entrada, h.numero FROM clientes c, reservas r, habitaciones h WHERE c.id_cliente = r.id_cliente AND r.id_habitacion = h.id_habitacion AND c.dni = '%s'" % dnibusqueda
            cursor.execute(sentencia)

        registros = cursor.fetchall()
        
        if not registros:
            print("No se encontraron reservas para este cliente.")
        else:
            print("\n--- Reservas encontradas ---")
            for i in registros:
                print(f"Nombre: {i[0]} | Fecha entrada: {i[1]} | Habitación: {i[2]}")
        
        cursor.close()
    except Exception as e:
        print("Error en la consulta:", e)

def registrar_nuevo_cliente(db, tipo_db):
    print("\n--- Registro de Nuevo Cliente ---")
    try:
        id_cli = int(input("ID Cliente: "))
        nombre = input("Nombre: ")
        email = input("Email: ")
        telefono = input("Teléfono: ")
        dni = input("DNI: ")

        cursor = db.cursor()
        
        if tipo_db == "oracle":
            sentencia = "INSERT INTO clientes (id_cliente, nombre, email, telefono, dni, fecha_registro) VALUES (:id, :nom, :mail, :tel, :dni, SYSDATE)"
            cursor.execute(sentencia, {'id': id_cli, 'nom': nombre, 'mail': email, 'tel': telefono, 'dni': dni})
        else:
            sentencia = "INSERT INTO clientes (id_cliente, nombre, email, telefono, dni, fecha_registro) VALUES (%s, '%s', '%s', '%s', '%s', CURRENT_DATE)" % (id_cli, nombre, email, telefono, dni)
            cursor.execute(sentencia)

        db.commit() 
        print(">> Cliente registrado correctamente.")
        cursor.close()
        
    except ValueError:
        print("Error: El ID debe ser un número.")
    except Exception as e:
        db.rollback() 
        print("Error al insertar:", e)

def eliminar_servicios_reserva(db, tipo_db):
    try:
        id_reserva = int(input("Introduce ID de reserva para borrar sus servicios: "))
        cursor = db.cursor()
        
        if tipo_db == "oracle":
            sentencia = "DELETE FROM servicios_reserva WHERE id_reserva = :id"
            cursor.execute(sentencia, {'id': id_reserva})
        else:
            sentencia = "DELETE FROM servicios_reserva WHERE id_reserva = %s" % id_reserva
            cursor.execute(sentencia)

        db.commit()
        print(f">> Servicios eliminados. Filas afectadas: {cursor.rowcount}")
        cursor.close()
        
    except ValueError:
        print("Error: El ID debe ser numérico.")
    except Exception as e:
        db.rollback()
        print("Error al borrar:", e)

def actualizar_precio_piso(db, tipo_db):
    try:
        piso = int(input("Número de piso a actualizar: "))
        porcentaje = float(input("Porcentaje de incremento (ej: 10): "))
        
        cursor = db.cursor()
        
        if tipo_db == "oracle":
            sentencia = "UPDATE habitaciones SET precio_noche = precio_noche * (1 + (:porc / 100)) WHERE piso = :piso"
            cursor.execute(sentencia, {'porc': porcentaje, 'piso': piso})
        else:  
            sentencia = "UPDATE habitaciones SET precio_noche = precio_noche * (1 + (%s / 100)) WHERE piso = %s"
            cursor.execute(sentencia, (porcentaje, piso))  

        db.commit()

        if cursor.rowcount == 0:
            print("No se encontró ningún piso con ese número.")
        else:
            print(f">> Precios actualizados. Filas actualizadas: {cursor.rowcount}")

        cursor.close()
        
    except ValueError:
        print("Error: Introduce valores numéricos válidos.")
    except Exception as e:
        db.rollback()
        print("Error al actualizar:", e)
