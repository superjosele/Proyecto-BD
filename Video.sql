
DROP DATABASE  video;
CREATE DATABASE video;
USE video;


CREATE TABLE usuario(
	id INT AUTO_INCREMENT,
	rut VARCHAR(20),
	nombre TEXT,
	fono INT,
	
	PRIMARY KEY (id),
	UNIQUE (rut)
	
);
INSERT INTO usuario VALUES(NULL,"20.30.24-k","pepe paja cortez",5690203);


SELECT * FROM usuario;

CREATE TABLE formato(
	id INT AUTO_INCREMENT,
	tipo_formato VARCHAR(10),
	PRIMARY KEY (id)


);
INSERT INTO formato VALUES(NULL,"DVD");
INSERT INTO formato VALUES(NULL,"digital");
INSERT INTO formato VALUES(NULL,"VHS");
INSERT INTO formato VALUES(NULL,"blu ray");
SELECT * FROM formato;

CREATE TABLE categoria(
	id INT AUTO_INCREMENT,
	Categoria TEXT,
	PRIMARY KEY (id)


);

INSERT INTO categoria VALUES(NULL,"Accion");
INSERT INTO categoria VALUES(NULL,"Comedia");
INSERT INTO categoria VALUES(NULL,"Terror");
INSERT INTO categoria VALUES(NULL,"Suspenso");
SELECT * FROM categoria;

CREATE TABLE pelicula (
	id INT AUTO_INCREMENT,
	nombre VARCHAR(20),
	categoria_id_fk INT,
	descripcion TEXT,
	formato_id_fk INT,
	
	PRIMARY KEY (id),
	FOREIGN KEY (categoria_id_fk) REFERENCES categoria(id),
	FOREIGN KEY (formato_id_fk) REFERENCES formato(id)


);

INSERT INTO pelicula VALUES (NULL,"Rambo",(SELECT id FROM categoria WHERE id = 1),"es muy buena",(SELECT id FROM formato WHERE id = 1));
SELECT descripcion FROM pelicula;
SELECT * FROM pelicula;

CREATE TABLE arriendo (
	id INT AUTO_INCREMENT,
	fecha_emision DATE,
	fecha_entrega DATE,
	id_pelicula_fk INT,
	id_usuario_fk INT,
	
	PRIMARY KEY (id),
	FOREIGN KEY (id_usuario_fk) REFERENCES usuario(id),
	FOREIGN KEY (id_pelicula_fk) REFERENCES pelicula(id)

);
INSERT INTO arriendo VALUES (NULL,NOW(),"2020-12-25",(SELECT id FROM pelicula WHERE id = 1),(SELECT id FROM usuario WHERE id = 1));




SELECT * FROM arriendo WHERE id_pelicula_fk = 1;




SELECT * FROM arriendo;