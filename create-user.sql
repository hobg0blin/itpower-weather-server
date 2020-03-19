CREATE USER 'itpower'@'localhost' IDENTIFIED BY 'it!+P0w3r!';
GRANT ALL PRIVILEGES ON itpower.* TO 'node'@'localhost' WITH GRANT OPTION;
flush privileges;
