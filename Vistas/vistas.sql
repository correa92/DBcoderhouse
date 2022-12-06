
-- grupos musicales con integrantes mayores a 3
CREATE OR REPLACE VIEW grupos_mayores AS
SELECT nombre,cant_integrantes FROM grupo_musical WHERE cant_integrantes > 3;

-- cantidad de canciones que tiene un album especifico
CREATE OR REPLACE VIEW canciones_en_album AS
SELECT id_disco AS album,
COUNT(*) AS cantidad
FROM cancion
WHERE id_disco =8
GROUP BY id_disco;

-- Obtiene a las 5 bandas con mas seguidores 
CREATE OR REPLACE VIEW grupo_seguidores AS 
SELECT id_grupo AS grupo,
COUNT(*) AS cant_seguidores
FROM estadistica_usuario
GROUP BY id_grupo
ORDER BY cant_seguidores DESC
LIMIT 5;

-- obtiene la informacion del contacto de cada grupo musical
CREATE OR REPLACE VIEW info_grupo_musical AS
SELECT nombre,anio_origen,cant_integrantes, telefono,email,localidad,provincia,pais,sitio_web,cp 
FROM grupo_musical g
JOIN contacto c 
ON g.id_contacto = c.id_contacto;

-- indica que persona administra a un grupo musical
CREATE OR REPLACE VIEW admin_grupo AS
SELECT a.nombre AS nombre_admin, a.apellido,a.dni,g.nombre AS grupo_musical FROM admin a
JOIN grupo_musical g ON a.id_grupo = g.id_grupo;