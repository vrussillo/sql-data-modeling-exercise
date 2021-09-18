DROP DATABASE IF EXISTS soccerleague_db;

CREATE DATABASE soccerleague_db;

\c soccerleague_db;


CREATE TABLE Lineups
(
  id SERIAL PRIMARY KEY NOT NULL
);

CREATE TABLE Goals
(
  id SERIAL PRIMARY KEY NOT NULL
);

CREATE TABLE Results
(
  id SERIAL PRIMARY KEY NOT NULL,
  result TEXT NOT NULL
);

CREATE TABLE Matches
(
  id SERIAL PRIMARY KEY NOT NULL,
  match_id INTEGER REFERENCES Results,
  match_id INTEGER REFERENCES Lineups,
  match_id INTEGER REFERENCES Goals,
  location TEXT NOT NULL,
  match_date DATE NOT NULL,
  start_time INTEGER NOT NULL
);

CREATE TABLE Players
(
  id SERIAL PRIMARY KEY NOT NULL,
  player_id INTEGER REFERENCES Goals,
  player_id INTEGER REFERENCES Lineups,
  name TEXT NOT NULL,
  birthday DATE NOT NULL,
  height INTEGER NOT NULL
);

CREATE TABLE Teams
(
  id SERIAL PRIMARY KEY NOT NULL,
  team_id INTEGER REFERENCES Results,
  team_id INTEGER REFERENCES Lineups,
  current_team_id INTEGER REFERENCES Players,
  home_team_id INTEGER REFERENCES Matches,
  name TEXT NOT NULL,
  city TEXT NOT NULL
);

CREATE TABLE Referees
(
  id SERIAL PRIMARY KEY NOT NULL,
  head_referee_id INTEGER REFERENCES Matches,
  name TEXT NOT NULL
);

CREATE TABLE Season
(
  id SERIAL PRIMARY KEY NOT NULL,
  season_id INTEGER REFERENCES Matches,
  start_date DATE NOT NULL,
  end_date DATE NOT NULL
);

INSERT INTO Lineups(id)
VALUES
(1);

INSERT INTO Goals(id)
VALUES
(1);

INSERT INTO Results(result, id)
VALUES
(tie, 1);

INSERT INTO Matches(start_time, match_date, location, match_id, id)
VALUES
(3:00,'2021-09-18','London', 1, 1);

INSERT INTO Players (name, birthday, height, player_id, id)
VALUES
('Wesley','1972-08-02', 6.4, 1, 1);

INSERT INTO Teams (name, city, home_team_id, current_team_id, team_id, id)
VALUES
('Manchester United', 'London', 1, 1, 1, 1);

INSERT INTO Referees (name, head_referee_id, id)
VALUES
('Jason', 1, 1);

INSERT INTO Season (start_date, end_date, season_id, id)
VALUES
('2021-09-01','2022-07-01', 1, 1);


