use mysql;
show tables;

select * from mysql.user;

-- se crea un usuario administrador y otro lector
CREATE USER 'administrador@localhost';
CREATE USER 'lector@localhost';

-- otorga los permisos SELECT, UPDATE, INSERT de todas las tablas al usuario administrador
GRANT SELECT, UPDATE, INSERT ON *.* TO 'administrador@localhost';

-- otorga solo el permiso de lectura de todas las tablas al usuario lector
GRANT SELECT ON *.* TO 'lector@localhost';

-- verifica que permisos tiene el usuario administrador y lector
SHOW GRANTS FOR 'administrador@localhost';
SHOW GRANTS FOR 'lector@localhost';