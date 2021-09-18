DROP DATABASE IF EXISTS medicalcenter_db;

CREATE DATABASE medicalcenter_db;

\c medicalcenter_db;

CREATE TABLE diagnoses
(
  id SERIAL PRIMARY KEY NOT NULL,
  notes TEXT NOT NULL
);

CREATE TABLE visits
(
  id SERIAL PRIMARY KEY NOT NULL,
  visit_id INTEGER REFERENCES diagnoses(id),
  visit_date DATE NOT NULL
);

CREATE TABLE patients 
(
  id SERIAL PRIMARY KEY NOT NULL,
  patient_id INTEGER REFERENCES visits(id),
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  birthday DATE NOT NULL,
  insurance TEXT NOT NULL
);

CREATE TABLE diseases 
(
  id SERIAL PRIMARY KEY NOT NULL,
  disease_id INTEGER REFERENCES diagnoses(id),
  name TEXT NOT NULL,
  description TEXT NOT NULL
);

CREATE TABLE doctors 
(
  id SERIAL PRIMARY KEY NOT NULL,
  doctor_id INTEGER REFERENCES visits(id),
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  specialty TEXT NOT NULL
);

INSERT INTO diagnoses (notes, id)
VALUES
('this is reaaaaaally bad', 1),
('my dude need a phoenix down bro', 2);

INSERT INTO visits (visit_date, visit_id, id)
VALUES
('2021-09-14', 1, 1),
('2019-04-06', 2, 2);

INSERT INTO patients (first_name, last_name, insurance, birthday, patient_id, id)
VALUES
('bob',  'schneider', 'blue cross', '1989-04-06', 1, 1),
('douce', 'bigalow', 'uninsured', '1922-06-05', 2, 2);

INSERT INTO diseases (name, description, disease_id, id)
VALUES
('whooping cough', 'patient is coughing up playdough', 1, 1),
('leprosy', 'patient looks like a zombie', 2, 2);

INSERT INTO doctors (first_name, last_name, specialty, doctor_id, id)
VALUES
('Henry','Jekyll','potions', 1, 1),
('Otto','Chan','radiologist', 2, 2);