CREATE DATABASE IF NOT EXISTS bandas;
USE bandas;

CREATE TABLE estadistica_banda (
	id_estadistica INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	cant_seguidores INT DEFAULT '0',
    cant_reacciones INT DEFAULT '0'
);

CREATE TABLE genero (
	id_genero INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_genero VARCHAR(30)
);

CREATE TABLE redes_sociales (
	id_redes INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    red1 VARCHAR(50) UNIQUE,
    red2 VARCHAR(50) UNIQUE,
    red3 VARCHAR(50) UNIQUE
);


CREATE TABLE contacto (
	id_contacto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    telefono INT NOT NULL UNIQUE,
    email VARCHAR(50) NOT NULL UNIQUE,
    direccion VARCHAR(120) NOT NULL,
    localidad VARCHAR(50) NOT NULL,
    provincia VARCHAR(30) NOT NULL,
    pais VARCHAR(30) NOT NULL,
    sitio_web VARCHAR(200) UNIQUE,
    cp VARCHAR(10)
);

CREATE TABLE establecimiento (
	id_lugar INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40) NOT NULL,
    capacidad INT NOT NULL,
    id_contacto INT,
    CONSTRAINT FK_establecimiento_contacto
    FOREIGN KEY (id_contacto)
    REFERENCES contacto(id_contacto)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE grupo_musical (
	id_grupo INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    cant_integrantes INT,
	nombre VARCHAR(50) NOT NULL,
    anio_origen DATE NOT NULL,
    imagen_banda VARCHAR(200) DEFAULT 'imagen-generica.jpg',
    id_contacto INT,
    id_estadistica_banda INT,
    id_redes INT,
    id_genero INT,
	CONSTRAINT FK_grupomusical_contacto
    FOREIGN KEY (id_contacto)
    REFERENCES contacto(id_contacto)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_grupomusical_estadisticas
    FOREIGN KEY (id_estadistica_banda)
    REFERENCES estadistica_banda (id_estadistica)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_grupomusical_redes
    FOREIGN KEY (id_redes)
    REFERENCES redes_sociales (id_redes)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_grupomusical_genero
    FOREIGN KEY (id_genero)
    REFERENCES genero(id_genero)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE evento (
	id_evento INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    precio_ticket DECIMAL(8,2) NOT NULL,
	hora TIME NOT NULL,
    fecha DATE NOT NULL,
    link_ticket VARCHAR(200),
    imagen_evento VARCHAR(200) DEFAULT 'imagen-generica.jpg',
    id_lugar INT,
    id_grupo INT,
    CONSTRAINT FK_evento_establecimiento
    FOREIGN KEY (id_lugar)
    REFERENCES establecimiento(id_lugar)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_evento_grupo_musical
    FOREIGN KEY (id_grupo)
    REFERENCES grupo_musical(id_grupo)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE integrantes (
	id_integrantes INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    nombre_pila VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    edad INT NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    imagen_integrante VARCHAR(200) DEFAULT 'imagen-generica.jpg',
    id_redes INT ,
    id_grupo INT,
    CONSTRAINT FK_integrantes_redessociales
    FOREIGN KEY (id_redes)
    REFERENCES redes_sociales(id_redes)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_integrantes_grupo_musical
    FOREIGN KEY (id_grupo)
    REFERENCES grupo_musical(id_grupo)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE videoclip (
	id_videoclip INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    link VARCHAR(200) NOT NULL,
    duracion INT NOT NULL,
    imagen_video VARCHAR(200),
    id_grupo INT,
    CONSTRAINT FK_videoclip_grupo_musical
    FOREIGN KEY (id_grupo)
    REFERENCES grupo_musical(id_grupo)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE discografia (
	id_disco INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_lanzamiento DATE NOT NULL,
    imagen_cd VARCHAR(200) DEFAULT 'imagen-generica.jpg',
    id_grupo_musical INT,
    CONSTRAINT FK_discografia_grupo_musical
    FOREIGN KEY (id_grupo_musical)
    REFERENCES grupo_musical(id_grupo)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE TABLE cancion (
	id_cancion INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    link VARCHAR(200) NOT NULL,
    duracion INT NOT NULL,
    id_disco INT,
    CONSTRAINT FK_cancion_discografia
    FOREIGN KEY (id_disco)
    REFERENCES discografia(id_disco)
		ON DELETE CASCADE
        ON UPDATE CASCADE    
);

CREATE TABLE usuario (
	id_user INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    user VARCHAR(30) NOT NULL UNIQUE,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    dni VARCHAR(11) NOT NULL UNIQUE,
    id_grupo INT,
    id_cancion INT,
    id_discografia INT,
    id_videoclip INT,
    CONSTRAINT FK_usuario_grupo
    FOREIGN KEY (id_grupo)
    REFERENCES grupo_musical(id_grupo)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_usuario_cancion
    FOREIGN KEY (id_cancion)
    REFERENCES cancion(id_cancion)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_usuario_discografia
    FOREIGN KEY (id_discografia)
    REFERENCES discografia(id_disco)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	CONSTRAINT FK_usuario_videoclip
    FOREIGN KEY (id_videoclip)
    REFERENCES videoclip (id_videoclip)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE admin (
	id_admin INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    dni VARCHAR(10) NOT NULL UNIQUE,
    id_grupo INT,
    id_contacto INT,
    CONSTRAINT FK_admin_grupo
    FOREIGN KEY (id_grupo)
    REFERENCES grupo_musical(id_grupo)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT FK_admin_contacto
    FOREIGN KEY (id_contacto)
    REFERENCES contacto(id_contacto)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);






