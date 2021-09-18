-- Create DATABASE and connect

DROP DATABASE IF EXISTS soccerleague_db;

CREATE DATABASE soccerleague_db;

\c soccerleague_db;

-- Create tables/schema

CREATE TABLE IF NOT EXISTS Lineups
(
    primary_key INTEGER NOT NULL,
    team_id INTEGER,
    match_id INTEGER,
    player_id INTEGER,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS Goals
(
    primary_key INTEGER NOT NULL,
    match_id INTEGER,
    player_id INTEGER,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS Results
(
    primary_key INTEGER NOT NULL,
    results CHARACTER(15) NOT NULL,
    team_id INTEGER,
    match_id INTEGER,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS Matches
(
    primary_key INTEGER NOT NULL,
    location CHARACTER(15),
    date DATE,
    start_time TIME,
    head_referee_id INTEGER,
    season_id INTEGER,
    home_team_id INTEGER,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS Players
(
    primary_key INTEGER NOT NULL,
    name CHARACTER(15),
    birthday DATE,
    height INTEGER,
    current_team_id INTEGER,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS Season
(
    primary_key INTEGER NOT NULL,
    start_date DATE,
    end_date DATE,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS Referees
(
    primary_key INTEGER NOT NULL,
    name CHARACTER(15) NOT NULL,
    PRIMARY KEY(primary_key)
);

CREATE TABLE IF NOT EXISTS Teams
(
    primary_key INTEGER NOT NULL,
    name CHARACTER(30) NOT NULL,
    city CHARACTER(15) NOT NULL,
    PRIMARY KEY(primary_key)
);


-- Create FKs

ALTER TABLE Matches
    ADD    FOREIGN KEY (head_referee_id)
    REFERENCES Referees(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Matches
    ADD    FOREIGN KEY (season_id)
    REFERENCES Season(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Results
    ADD    FOREIGN KEY (match_id)
    REFERENCES Matches(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Goals
    ADD    FOREIGN KEY (match_id)
    REFERENCES Matches(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Goals
    ADD    FOREIGN KEY (player_id)
    REFERENCES Players(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Lineups
    ADD    FOREIGN KEY (team_id)
    REFERENCES Teams(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Lineups
    ADD    FOREIGN KEY (match_id)
    REFERENCES Matches(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Lineups
    ADD    FOREIGN KEY (player_id)
    REFERENCES Players(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Players
    ADD    FOREIGN KEY (current_team_id)
    REFERENCES Teams(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Matches
    ADD    FOREIGN KEY (home_team_id)
    REFERENCES Teams(primary_key)
    MATCH SIMPLE
;
    
ALTER TABLE Results
    ADD    FOREIGN KEY (team_id)
    REFERENCES Teams(primary_key)
    MATCH SIMPLE
;

-- Insert Data

INSERT INTO Teams (name, city, primary_key)
VALUES
('Manchester United', 'London', 1);

INSERT INTO Players (name, birthday, height, current_team_id, primary_key)
VALUES
('Wesley','1972-08-02', 6.4, 1, 1);

INSERT INTO Referees (name, primary_key)
VALUES
('Jason', 1);

INSERT INTO Season (start_date, end_date, primary_key)
VALUES
('2021-09-01','2022-07-01', 1);

INSERT INTO Matches(start_time, date, location, head_referee_id, season_id, home_team_id, primary_key)
VALUES
('14:00:00','2021-09-18','London',1, 1, 1, 1);

INSERT INTO Lineups(team_id, match_id, player_id, primary_key)
VALUES
(1, 1 ,1 ,1);

INSERT INTO Goals(match_id, player_id, primary_key)
VALUES
(1, 1, 1);

INSERT INTO Results(results, team_id, match_id, primary_key)
VALUES
('tie', 1, 1, 1);


