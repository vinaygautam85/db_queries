CREATE USER 'vin1'@'localhost' IDENTIFIED BY 'vini1985';

GRANT SELECT, REFERENCES on *.* TO 'vin1'@'localhost' WITH GRANT OPTION;

flush privileges;

show grants for 'vin1'@'localhost';