-- root 접속
CREATE DATABASE todoList;
CREATE USER todo@localhost;
USE MYSQL;
SHOW TABLES;
DESC USER;
GRANT ALL PRIVILEGES ON *.* TO todo@localhost;
ALTER USER 'todo'@'localhost'
IDENTIFIED WITH mysql_native_password
BY '1234';
FLUSH PRIVILEGES;