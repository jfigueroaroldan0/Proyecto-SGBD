-- =====================
-- CREATE TABLES
-- =====================

CREATE TABLE clientes (
    id_cliente NUMBER(5),
    nombre VARCHAR2(50),
    email VARCHAR2(50) UNIQUE,
    telefono VARCHAR2(15),
    dni VARCHAR2(15) UNIQUE,
    fecha_registro DATE,
    CONSTRAINT pk_clientes PRIMARY KEY (id_cliente)
);

CREATE TABLE habitaciones (
    id_habitacion NUMBER(5),
    numero NUMBER(5),
    tipo VARCHAR2(20),
    piso NUMBER(2),
    capacidad NUMBER(1),
    precio_noche NUMBER(6,2),
    disponible VARCHAR2(1),
    CONSTRAINT pk_habitaciones PRIMARY KEY (id_habitacion),
    CONSTRAINT ck_habitacion_disponible CHECK (disponible IN ('S','N'))
);

CREATE TABLE reservas (
    id_reserva NUMBER(5),
    fecha_entrada DATE,
    fecha_salida DATE,
    estado VARCHAR2(10),
    id_cliente NUMBER(5),
    id_habitacion NUMBER(5),
    CONSTRAINT pk_reservas PRIMARY KEY (id_reserva),
    CONSTRAINT fk_reserva_cliente FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    CONSTRAINT fk_reserva_habitacion FOREIGN KEY (id_habitacion) REFERENCES habitaciones(id_habitacion)
);

CREATE TABLE servicios_reserva (
    id_servicio NUMBER(5),
    id_reserva NUMBER(5),
    servicio VARCHAR2(20),
    precio NUMBER(5,2),
    fecha_servicio DATE,
    CONSTRAINT pk_servicios PRIMARY KEY (id_servicio),
    CONSTRAINT fk_servicio_reserva FOREIGN KEY (id_reserva) REFERENCES reservas(id_reserva)
);

-- =====================
-- INSERTS
-- =====================

-- CLIENTES
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (1,'Ana López','ana.lopez@mail.com','600111222','12345678A',TO_DATE('2024-01-01','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (2,'Carlos Ruiz','carlos.ruiz@mail.com','600333444','23456789B',TO_DATE('2024-01-02','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (3,'María Pérez','maria.perez@mail.com','600555666','34567890C',TO_DATE('2024-01-03','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (4,'Luis Gómez','luis.gomez@mail.com','600777888','45678901D',TO_DATE('2024-01-04','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (5,'Laura Martín','laura.martin@mail.com','600999000','56789012E',TO_DATE('2024-01-05','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (6,'Pedro Sánchez','pedro.sanchez@mail.com','601111222','67890123F',TO_DATE('2024-01-06','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (7,'Sofía Torres','sofia.torres@mail.com','601333444','78901234G',TO_DATE('2024-01-07','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (8,'Javier Molina','javier.molina@mail.com','601555666','89012345H',TO_DATE('2024-01-08','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (9,'Elena Navarro','elena.navarro@mail.com','601777888','90123456J',TO_DATE('2024-01-09','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (10,'Raúl Castro','raul.castro@mail.com','602111222','01234567K',TO_DATE('2024-01-10','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (11,'Marta Jiménez','marta.jimenez@mail.com','602333444','11223344L',TO_DATE('2024-01-11','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (12,'Fernando Ruiz','fernando.ruiz@mail.com','602555666','22334455M',TO_DATE('2024-01-12','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (13,'Clara Vega','clara.vega@mail.com','602777888','33445566N',TO_DATE('2024-01-13','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (14,'Diego Torres','diego.torres@mail.com','602999000','44556677O',TO_DATE('2024-01-14','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (15,'Isabel Rojas','isabel.rojas@mail.com','603111222','55667788P',TO_DATE('2024-01-15','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (16,'Antonio Molina','antonio.molina@mail.com','603333444','66778899Q',TO_DATE('2024-01-16','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (17,'Patricia Ortiz','patricia.ortiz@mail.com','603555666','77889900R',TO_DATE('2024-01-17','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (18,'José Ramírez','jose.ramirez@mail.com','603777888','88990011S',TO_DATE('2024-01-18','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (19,'Lucía Herrera','lucia.herrera@mail.com','604111222','99001122T',TO_DATE('2024-01-19','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (20,'Manuel Delgado','manuel.delgado@mail.com','604333444','10111213U',TO_DATE('2024-01-20','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (21,'Sara Morales','sara.morales@mail.com','604555666','12131415V',TO_DATE('2024-01-21','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (22,'Jorge Castillo','jorge.castillo@mail.com','604777888','14151617W',TO_DATE('2024-01-22','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (23,'Elisa Medina','elisa.medina@mail.com','605111222','16171819X',TO_DATE('2024-01-23','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (24,'Héctor Navarro','hector.navarro@mail.com','605333444','18192021Y',TO_DATE('2024-01-24','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (25,'Verónica Campos','veronica.campos@mail.com','605555666','22232425Z',TO_DATE('2024-01-25','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (26,'Miguel Torres','miguel.torres@mail.com','605777888','26272829A',TO_DATE('2024-01-26','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (27,'Natalia Blanco','natalia.blanco@mail.com','606111222','30313233B',TO_DATE('2024-01-27','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (28,'Raquel Fuentes','raquel.fuentes@mail.com','606333444','34353637C',TO_DATE('2024-01-28','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (29,'Rubén Gil','ruben.gil@mail.com','606555666','38394041D',TO_DATE('2024-01-29','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (30,'Marina León','marina.leon@mail.com','606777888','42434445E',TO_DATE('2024-01-30','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (31,'Óscar Navarro','oscar.navarro@mail.com','607111222','46474849F',TO_DATE('2024-01-31','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (32,'Teresa Vega','teresa.vega@mail.com','607333444','50515253G',TO_DATE('2024-02-01','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (33,'Alberto Torres','alberto.torres@mail.com','607555666','54555657H',TO_DATE('2024-02-02','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (34,'Paula Moreno','paula.moreno@mail.com','607777888','58596061J',TO_DATE('2024-02-03','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (35,'Iván Ruiz','ivan.ruiz@mail.com','608111222','62636465K',TO_DATE('2024-02-04','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (36,'Lourdes Castillo','lourdes.castillo@mail.com','608333444','66676869L',TO_DATE('2024-02-05','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (37,'Daniela Ramírez','daniela.ramirez@mail.com','608555666','70717273M',TO_DATE('2024-02-06','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (38,'Víctor Serrano','victor.serrano@mail.com','608777888','74757677N',TO_DATE('2024-02-07','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (39,'Natalia Muñoz','natalia.munoz@mail.com','609111222','78798081O',TO_DATE('2024-02-08','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (40,'Rubén Molina','ruben.molina@mail.com','609333444','82838485P',TO_DATE('2024-02-09','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (41,'Sonia Herrera','sonia.herrera@mail.com','609555666','86878889Q',TO_DATE('2024-02-10','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (42,'Eduardo Rojas','eduardo.rojas@mail.com','609777888','90919293R',TO_DATE('2024-02-11','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (43,'Carla Méndez','carla.mendez@mail.com','610111222','94959697S',TO_DATE('2024-02-12','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (44,'Mario Delgado','mario.delgado@mail.com','610333444','98990001T',TO_DATE('2024-02-13','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (45,'María Fernanda','maria.fernanda@mail.com','610555666','02030405U',TO_DATE('2024-02-14','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (46,'Raúl Pérez','raul.perez@mail.com','610777888','06070809V',TO_DATE('2024-02-15','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (47,'Alicia Campos','alicia.campos@mail.com','611111222','10111213W',TO_DATE('2024-02-16','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (48,'Antonio Moreno','antonio.moreno@mail.com','611333444','14151617X',TO_DATE('2024-02-17','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (49,'Cristina Navarro','cristina.navarro@mail.com','611555666','18192022Y',TO_DATE('2024-02-18','YYYY-MM-DD'));
INSERT INTO clientes (id_cliente,nombre,email,telefono,dni,fecha_registro) VALUES (50,'David Herrera','david.herrera@mail.com','611777888','22232426Z',TO_DATE('2024-02-19','YYYY-MM-DD'));

-- HABITACIONES
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (1,101,'Individual',1,1,50.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (2,102,'Doble',1,2,70.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (3,103,'Suite',1,3,120.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (4,104,'Individual',1,1,50.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (5,105,'Doble',1,2,70.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (6,106,'Suite',1,3,120.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (7,201,'Individual',2,1,55.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (8,202,'Doble',2,2,75.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (9,203,'Suite',2,3,130.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (10,204,'Individual',2,1,55.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (11,205,'Doble',2,2,75.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (12,206,'Suite',2,3,130.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (13,301,'Individual',3,1,60.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (14,302,'Doble',3,2,80.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (15,303,'Suite',3,3,140.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (16,304,'Individual',3,1,60.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (17,305,'Doble',3,2,80.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (18,306,'Suite',3,3,140.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (19,401,'Individual',4,1,65.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (20,402,'Doble',4,2,85.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (21,403,'Suite',4,3,150.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (22,404,'Individual',4,1,65.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (23,405,'Doble',4,2,85.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (24,406,'Suite',4,3,150.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (25,501,'Individual',5,1,70.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (26,502,'Doble',5,2,90.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (27,503,'Suite',5,3,160.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (28,504,'Individual',5,1,70.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (29,505,'Doble',5,2,90.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (30,506,'Suite',5,3,160.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (31,601,'Individual',6,1,75.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (32,602,'Doble',6,2,95.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (33,603,'Suite',6,3,170.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (34,604,'Individual',6,1,75.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (35,605,'Doble',6,2,95.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (36,606,'Suite',6,3,170.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (37,701,'Individual',7,1,80.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (38,702,'Doble',7,2,100.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (39,703,'Suite',7,3,180.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (40,704,'Individual',7,1,80.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (41,705,'Doble',7,2,100.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (42,706,'Suite',7,3,180.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (43,801,'Individual',8,1,85.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (44,802,'Doble',8,2,110.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (45,803,'Suite',8,3,190.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (46,804,'Individual',8,1,85.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (47,805,'Doble',8,2,110.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (48,806,'Suite',8,3,190.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (49,901,'Suite',9,3,200.00,'S');
INSERT INTO habitaciones (id_habitacion,numero,tipo,piso,capacidad,precio_noche,disponible) VALUES (50,902,'Doble',9,2,120.00,'S');

-- RESERVAS
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (1,TO_DATE('2024-03-01','YYYY-MM-DD'),TO_DATE('2024-03-05','YYYY-MM-DD'),'Activa',1,1);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (2,TO_DATE('2024-03-02','YYYY-MM-DD'),TO_DATE('2024-03-06','YYYY-MM-DD'),'Activa',2,2);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (3,TO_DATE('2024-03-03','YYYY-MM-DD'),TO_DATE('2024-03-07','YYYY-MM-DD'),'Activa',3,3);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (4,TO_DATE('2024-03-04','YYYY-MM-DD'),TO_DATE('2024-03-08','YYYY-MM-DD'),'Activa',4,4);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (5,TO_DATE('2024-03-05','YYYY-MM-DD'),TO_DATE('2024-03-09','YYYY-MM-DD'),'Activa',5,5);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (6,TO_DATE('2024-03-06','YYYY-MM-DD'),TO_DATE('2024-03-10','YYYY-MM-DD'),'Activa',6,6);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (7,TO_DATE('2024-03-07','YYYY-MM-DD'),TO_DATE('2024-03-11','YYYY-MM-DD'),'Activa',7,7);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (8,TO_DATE('2024-03-08','YYYY-MM-DD'),TO_DATE('2024-03-12','YYYY-MM-DD'),'Activa',8,8);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (9,TO_DATE('2024-03-09','YYYY-MM-DD'),TO_DATE('2024-03-13','YYYY-MM-DD'),'Activa',9,9);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (10,TO_DATE('2024-03-10','YYYY-MM-DD'),TO_DATE('2024-03-14','YYYY-MM-DD'),'Activa',10,10);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (11,TO_DATE('2024-03-11','YYYY-MM-DD'),TO_DATE('2024-03-15','YYYY-MM-DD'),'Activa',11,11);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (12,TO_DATE('2024-03-12','YYYY-MM-DD'),TO_DATE('2024-03-16','YYYY-MM-DD'),'Activa',12,12);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (13,TO_DATE('2024-03-13','YYYY-MM-DD'),TO_DATE('2024-03-17','YYYY-MM-DD'),'Activa',13,13);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (14,TO_DATE('2024-03-14','YYYY-MM-DD'),TO_DATE('2024-03-18','YYYY-MM-DD'),'Activa',14,14);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (15,TO_DATE('2024-03-15','YYYY-MM-DD'),TO_DATE('2024-03-19','YYYY-MM-DD'),'Activa',15,15);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (16,TO_DATE('2024-03-16','YYYY-MM-DD'),TO_DATE('2024-03-20','YYYY-MM-DD'),'Activa',16,16);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (17,TO_DATE('2024-03-17','YYYY-MM-DD'),TO_DATE('2024-03-21','YYYY-MM-DD'),'Activa',17,17);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (18,TO_DATE('2024-03-18','YYYY-MM-DD'),TO_DATE('2024-03-22','YYYY-MM-DD'),'Activa',18,18);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (19,TO_DATE('2024-03-19','YYYY-MM-DD'),TO_DATE('2024-03-23','YYYY-MM-DD'),'Activa',19,19);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (20,TO_DATE('2024-03-20','YYYY-MM-DD'),TO_DATE('2024-03-24','YYYY-MM-DD'),'Activa',20,20);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (21,TO_DATE('2024-03-21','YYYY-MM-DD'),TO_DATE('2024-03-25','YYYY-MM-DD'),'Activa',21,21);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (22,TO_DATE('2024-03-22','YYYY-MM-DD'),TO_DATE('2024-03-26','YYYY-MM-DD'),'Activa',22,22);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (23,TO_DATE('2024-03-23','YYYY-MM-DD'),TO_DATE('2024-03-27','YYYY-MM-DD'),'Activa',23,23);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (24,TO_DATE('2024-03-24','YYYY-MM-DD'),TO_DATE('2024-03-28','YYYY-MM-DD'),'Activa',24,24);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (25,TO_DATE('2024-03-25','YYYY-MM-DD'),TO_DATE('2024-03-29','YYYY-MM-DD'),'Activa',25,25);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (26,TO_DATE('2024-03-26','YYYY-MM-DD'),TO_DATE('2024-03-30','YYYY-MM-DD'),'Activa',26,26);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (27,TO_DATE('2024-03-27','YYYY-MM-DD'),TO_DATE('2024-03-31','YYYY-MM-DD'),'Activa',27,27);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (28,TO_DATE('2024-03-28','YYYY-MM-DD'),TO_DATE('2024-04-01','YYYY-MM-DD'),'Activa',28,28);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (29,TO_DATE('2024-03-29','YYYY-MM-DD'),TO_DATE('2024-04-02','YYYY-MM-DD'),'Activa',29,29);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (30,TO_DATE('2024-03-30','YYYY-MM-DD'),TO_DATE('2024-04-03','YYYY-MM-DD'),'Activa',30,30);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (31,TO_DATE('2024-03-31','YYYY-MM-DD'),TO_DATE('2024-04-04','YYYY-MM-DD'),'Activa',31,31);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (32,TO_DATE('2024-04-01','YYYY-MM-DD'),TO_DATE('2024-04-05','YYYY-MM-DD'),'Activa',32,32);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (33,TO_DATE('2024-04-02','YYYY-MM-DD'),TO_DATE('2024-04-06','YYYY-MM-DD'),'Activa',33,33);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (34,TO_DATE('2024-04-03','YYYY-MM-DD'),TO_DATE('2024-04-07','YYYY-MM-DD'),'Activa',34,34);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (35,TO_DATE('2024-04-04','YYYY-MM-DD'),TO_DATE('2024-04-08','YYYY-MM-DD'),'Activa',35,35);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (36,TO_DATE('2024-04-05','YYYY-MM-DD'),TO_DATE('2024-04-09','YYYY-MM-DD'),'Activa',36,36);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (37,TO_DATE('2024-04-06','YYYY-MM-DD'),TO_DATE('2024-04-10','YYYY-MM-DD'),'Activa',37,37);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (38,TO_DATE('2024-04-07','YYYY-MM-DD'),TO_DATE('2024-04-11','YYYY-MM-DD'),'Activa',38,38);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (39,TO_DATE('2024-04-08','YYYY-MM-DD'),TO_DATE('2024-04-12','YYYY-MM-DD'),'Activa',39,39);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (40,TO_DATE('2024-04-09','YYYY-MM-DD'),TO_DATE('2024-04-13','YYYY-MM-DD'),'Activa',40,40);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (41,TO_DATE('2024-04-10','YYYY-MM-DD'),TO_DATE('2024-04-14','YYYY-MM-DD'),'Activa',41,41);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (42,TO_DATE('2024-04-11','YYYY-MM-DD'),TO_DATE('2024-04-15','YYYY-MM-DD'),'Activa',42,42);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (43,TO_DATE('2024-04-12','YYYY-MM-DD'),TO_DATE('2024-04-16','YYYY-MM-DD'),'Activa',43,43);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (44,TO_DATE('2024-04-13','YYYY-MM-DD'),TO_DATE('2024-04-17','YYYY-MM-DD'),'Activa',44,44);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (45,TO_DATE('2024-04-14','YYYY-MM-DD'),TO_DATE('2024-04-18','YYYY-MM-DD'),'Activa',45,45);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (46,TO_DATE('2024-04-15','YYYY-MM-DD'),TO_DATE('2024-04-19','YYYY-MM-DD'),'Activa',46,46);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (47,TO_DATE('2024-04-16','YYYY-MM-DD'),TO_DATE('2024-04-20','YYYY-MM-DD'),'Activa',47,47);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (48,TO_DATE('2024-04-17','YYYY-MM-DD'),TO_DATE('2024-04-21','YYYY-MM-DD'),'Activa',48,48);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (49,TO_DATE('2024-04-18','YYYY-MM-DD'),TO_DATE('2024-04-22','YYYY-MM-DD'),'Activa',49,49);
INSERT INTO reservas (id_reserva,fecha_entrada,fecha_salida,estado,id_cliente,id_habitacion) VALUES (50,TO_DATE('2024-04-19','YYYY-MM-DD'),TO_DATE('2024-04-23','YYYY-MM-DD'),'Activa',50,50);

-- SERVICIOS_RESERVA
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (1,1,'Desayuno',10.00,TO_DATE('2024-03-02','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (2,2,'Desayuno',10.00,TO_DATE('2024-03-03','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (3,3,'Cena',15.00,TO_DATE('2024-03-04','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (4,4,'Spa',30.00,TO_DATE('2024-03-05','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (5,5,'Desayuno',10.00,TO_DATE('2024-03-06','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (6,6,'Cena',15.00,TO_DATE('2024-03-07','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (7,7,'Spa',30.00,TO_DATE('2024-03-08','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (8,8,'Desayuno',10.00,TO_DATE('2024-03-09','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (9,9,'Cena',15.00,TO_DATE('2024-03-10','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (10,10,'Spa',30.00,TO_DATE('2024-03-11','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (11,11,'Desayuno',10.00,TO_DATE('2024-03-12','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (12,12,'Cena',15.00,TO_DATE('2024-03-13','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (13,13,'Spa',30.00,TO_DATE('2024-03-14','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (14,14,'Desayuno',10.00,TO_DATE('2024-03-15','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (15,15,'Cena',15.00,TO_DATE('2024-03-16','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (16,16,'Spa',30.00,TO_DATE('2024-03-17','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (17,17,'Desayuno',10.00,TO_DATE('2024-03-18','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (18,18,'Cena',15.00,TO_DATE('2024-03-19','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (19,19,'Spa',30.00,TO_DATE('2024-03-20','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (20,20,'Desayuno',10.00,TO_DATE('2024-03-21','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (21,21,'Cena',15.00,TO_DATE('2024-03-22','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (22,22,'Spa',30.00,TO_DATE('2024-03-23','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (23,23,'Desayuno',10.00,TO_DATE('2024-03-24','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (24,24,'Cena',15.00,TO_DATE('2024-03-25','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (25,25,'Spa',30.00,TO_DATE('2024-03-26','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (26,26,'Desayuno',10.00,TO_DATE('2024-03-27','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (27,27,'Cena',15.00,TO_DATE('2024-03-28','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (28,28,'Spa',30.00,TO_DATE('2024-03-29','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (29,29,'Desayuno',10.00,TO_DATE('2024-03-30','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (30,30,'Cena',15.00,TO_DATE('2024-03-31','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (31,31,'Spa',30.00,TO_DATE('2024-04-01','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (32,32,'Desayuno',10.00,TO_DATE('2024-04-02','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (33,33,'Cena',15.00,TO_DATE('2024-04-03','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (34,34,'Spa',30.00,TO_DATE('2024-04-04','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (35,35,'Desayuno',10.00,TO_DATE('2024-04-05','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (36,36,'Cena',15.00,TO_DATE('2024-04-06','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (37,37,'Spa',30.00,TO_DATE('2024-04-07','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (38,38,'Desayuno',10.00,TO_DATE('2024-04-08','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (39,39,'Cena',15.00,TO_DATE('2024-04-09','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (40,40,'Spa',30.00,TO_DATE('2024-04-10','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (41,41,'Desayuno',10.00,TO_DATE('2024-04-11','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (42,42,'Cena',15.00,TO_DATE('2024-04-12','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (43,43,'Spa',30.00,TO_DATE('2024-04-13','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (44,44,'Desayuno',10.00,TO_DATE('2024-04-14','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (45,45,'Cena',15.00,TO_DATE('2024-04-15','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (46,46,'Spa',30.00,TO_DATE('2024-04-16','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (47,47,'Desayuno',10.00,TO_DATE('2024-04-17','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (48,48,'Cena',15.00,TO_DATE('2024-04-18','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (49,49,'Spa',30.00,TO_DATE('2024-04-19','YYYY-MM-DD'));
INSERT INTO servicios_reserva (id_servicio,id_reserva,servicio,precio,fecha_servicio) VALUES (50,50,'Desayuno',10.00,TO_DATE('2024-04-20','YYYY-MM-DD'));

COMMIT;
