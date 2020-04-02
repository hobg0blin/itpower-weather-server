 CREATE USER 'itpower'@'localhost' IDENTIFIED BY 'power';
GRANT ALL PRIVILEGES ON itpower.* TO 'itpower'@'localhost' WITH GRANT OPTION;
flush privileges;
