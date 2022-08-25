CREATE DATABASE IF NOT EXISTS database_example;

GRANT ALL PRIVILEGES ON database_example.* TO 'myuser'@'%' IDENTIFIED BY 'mysql';
GRANT ALL PRIVILEGES ON database_example.* TO 'myuser'@'localhost' IDENTIFIED BY 'mysql';

USE database_example;

CREATE TABLE IF NOT EXISTS users
(
    `id` INT(10) PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);

INSERT INTO users (id, name) VALUES (1, 'Pedro');
INSERT INTO users (id, name) VALUES (2, 'Lucas');
INSERT INTO users (id, name) VALUES (3, 'Juan');