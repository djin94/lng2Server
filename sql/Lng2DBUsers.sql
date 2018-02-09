CREATE DATABASE Lng2DBUsers
    WITH
    OWNER = wotan
    ENCODING = 'UTF8'
    LC_COLLATE = 'ru_RU.UTF-8'
    LC_CTYPE = 'ru_RU.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
create table roles(
	role_id serial primary key,
	title VARCHAR(50)
);
create table users (
	User_id serial primary key,
	login VARCHAR(30),
	password VARCHAR(30),
	email VARCHAR(50),
  role_id INT REFERENCES roles ON UPDATE CASCADE ON DELETE NO ACTION,
  date_start DATE,
  date_end DATE
  );
INSERT INTO roles (title) VALUES ('administrator');
INSERT INTO roles (title) VALUES ('user');
INSERT INTO roles (title) VALUES ('primary user');

INSERT INTO users (login, password, email, role_id) VALUES ('djin94', '123456', 'djin94@yandex.ru', 2);
INSERT INTO users (login, password, email, role_id) VALUES ('heilragnarock', '654321', 'heilragnarock@yandex.ru', 2);
INSERT INTO users (login, password, email, role_id) VALUES ('admin', 'admin', 'wotan.uber.alles@yandex.ru', 1);