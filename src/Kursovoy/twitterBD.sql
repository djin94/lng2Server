CREATE DATABASE twitter
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
  role_id INT REFERENCES roles ON UPDATE CASCADE ON DELETE NO ACTION
  );
create table messages (
	msg_id serial primary key,
	user_id INT REFERENCES users ON DELETE CASCADE ON UPDATE CASCADE ,
	message VARCHAR(10000),
  date DATE
);
create table private_messages (
	prmsg_id serial primary key,
	user_id_sender INT REFERENCES users (User_id) ON DELETE CASCADE ON UPDATE CASCADE ,
	user_id_recipient INT REFERENCES users (User_id) ON DELETE CASCADE ON UPDATE CASCADE ,
	message VARCHAR(10000),
  date DATE
);
INSERT INTO roles (title) VALUES ('administrator');
INSERT INTO roles (title) VALUES ('user');
INSERT INTO roles (title) VALUES ('guest');
INSERT INTO users (login, password, email, role_id) VALUES ('djin94', '123456', 'djin94@yandex.ru', 2);
INSERT INTO users (login, password, email, role_id) VALUES ('heilragnarock', '654321', 'heilragnarock@yandex.ru', 2);
INSERT INTO users (login, password, email, role_id) VALUES ('admin', 'admin', 'wotan.uber.alles@yandex.ru', 1);

