DROP USER 'osl'@'localhost';
CREATE USER 'osl'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON * . * TO 'osl'@'localhost';
FLUSH PRIVILEGES;