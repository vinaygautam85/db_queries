CREATE USER 'vin1'@'localhost' IDENTIFIED BY 'vini1985';

GRANT SELECT, REFERENCES on *.* TO 'vin1'@'localhost' WITH GRANT OPTION;

flush privileges;

show grants for 'vin1'@'localhost';

create user 'vin1@localhost' IDENTIFIED BY 'vini1985';

GRANT ALL PRIVILEGES ON * . * TO 'new_user'@'localhost';

FLUSH PRIVILEGES;

GRANT CREATE, SELECT ON * . * TO 'user_name'@'localhost';

REVOKE PERMISSION_TYPE ON database_name.table_name FROM ‘user_name’@‘localhost’;
REVOKE ALL PRIVILEGES ON *.* FROM 'user_name'@'localhost';
DROP USER ‘user_name’@‘localhost’;
SHOW GRANTS FOR 'user_name'@'localhost';