CREATE DATABASE Lng2DB
    WITH
    OWNER = wotan
    ENCODING = 'UTF8'
    LC_COLLATE = 'ru_RU.UTF-8'
    LC_CTYPE = 'ru_RU.UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
  CREATE TABLE items (
    item_id INT PRIMARY KEY,
    name      VARCHAR(20),
    type_id   INT,
    class_id  INT,
    basePrice VARCHAR(12)
  );

INSERT INTO items (type_id, name, type_id,class_id, basePrice) VALUES (,'', , ,'');