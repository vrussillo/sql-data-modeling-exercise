-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space

-- Create Table/schema

CREATE TABLE planets
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_period_in_years FLOAT NOT NULL,
  orbits_around TEXT NOT NULL,
  galaxy_id INTEGER NOT NULL,
  moons_id INTEGER NOT NULL
);

CREATE TABLE galaxy
(
  id SERIAL PRIMARY KEY,
  galaxy TEXT NOT NULL
);

CREATE TABLE moons
(
  id SERIAL PRIMARY KEY,
  moons TEXT
);


-- Alter Tables

ALTER TABLE planets
    ADD    FOREIGN KEY (galaxy_id)
    REFERENCES galaxy(id)
    MATCH SIMPLE
;

ALTER TABLE planets
    ADD    FOREIGN KEY (moons_id)
    REFERENCES moons(id)
    MATCH SIMPLE
;


-- INSERT DATA

INSERT INTO galaxy
  (galaxy, id)
VALUES
('Milky Way', 1);

INSERT INTO moons (moons, id)
VALUES
('', 0),
('The Moon', 1),
('Phobos', 2),
('Deimos', 3),
('Naiad', 4),
('Thalassa', 5),
('Despina', 6),
('Galatea', 7),
('Larissa', 8),
('S/2004 N 1', 9),
('Proteus', 10),
('Triton', 11),
('Nereid', 12),
('Halimede', 13),
('Sao', 14),
('Laomedeia', 15),
('Psamathe', 16),
('Neso', 17);

INSERT INTO planets (name, orbital_period_in_years, orbits_around, galaxy_id, moons_id)
VALUES
  ('Earth', 1.00, 'The Sun', 1, 1),
  ('Mars', 1.88, 'The Sun', 1, 2, 3),
  ('Venus', 0.62, 'The Sun', 1, 0),
  ('Neptune', 164.8, 'The Sun', 1, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17),
  ('Proxima Centauri b', 0.03, 'Proxima Centauri', 1, 0),
  ('Gliese 876 b', 0.23, 'Gliese 876', 1, 0);



