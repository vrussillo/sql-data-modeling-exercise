DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY NOT NULL,
  title TEXT NOT NULL,
  notes TEXT NOT NULL,
  location TEXT NOT NULL
);

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY NOT NULL,
  region_id INTEGER REFERENCES posts,
  name TEXT NOT NULL
);

CREATE TABLE Users
(
  id SERIAL PRIMARY KEY NOT NULL,
  preferred_region_id INTEGER REFERENCES posts,
  user_id INTEGER REFERENCES posts,
  username VARCHAR(15) UNIQUE NOT NULL,
  encrypted_password VARCHAR(15) NOT NULL
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY NOT NULL,
  category_id INTEGER REFERENCES posts,
  name TEXT NOT NULL
);


INSERT INTO posts (title, notes, location, id)
VALUES
('selling guitar','buy my guitar, it is brand spankin new','Los Angeles', 1),
('cat sitter','in need of a cat sitter','Burlington', 2);

INSERT INTO regions (name, region_id, id)
VALUES
('California', 1 ,1),
('Vermont', 2 ,2);

INSERT INTO Users (username, encrypted_password, user_id, preferred_region_id, id)
VALUES
('sandwhichking', 'mustard123', 1, 1, 1),
('shrekislove', 'shrekislife', 2, 2, 2);

INSERT INTO categories (name, category_id, id)
VALUES
('Music Equipment Sale', 1, 1),
('Animal Watch', 2, 2);
