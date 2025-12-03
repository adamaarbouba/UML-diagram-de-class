
drop DATABASE gamingclub;
CREATE DATABASE Gamingclub; USE
    Gamingclub;
CREATE TABLE member(
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(40) UNIQUE,
    join_date DATE,
    subscription BOOLEAN
); CREATE TABLE game(
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    game_name VARCHAR(50),
    game_studio VARCHAR(50),
    game_genera VARCHAR(20),
    has_tournament BOOLEAN,
    game_price DECIMAL(4, 2)
); CREATE TABLE lending(
    lending_id INT PRIMARY KEY AUTO_INCREMENT,
    lending_date_start DATE,
    lending_date_end DATE,
    game_id INT,
    member_id INT,
    FOREIGN KEY(game_id) REFERENCES game(game_id),
    FOREIGN KEY(member_id) REFERENCES member(member_id)
); CREATE TABLE tournament(
    tournament_id INT PRIMARY KEY AUTO_INCREMENT,
    tournament_capacity INT,
    tournament_prize_pool DECIMAL(6, 2),
    tournament_start_date DATE,
    tournament_end_date DATE,
    tournament_duration DATE,
    game_id INT,
    member_id INT,
    FOREIGN KEY(game_id) REFERENCES game(game_id),
    FOREIGN KEY(member_id) REFERENCES member(member_id)
); CREATE TABLE tournament_result(
	tournament_result varchar(20),
    tournament_ranking int,
    tournament_id int,
    member_id int,
    FOREIGN KEY (tournament_id) REFERENCES tournament(tournament_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);

INSERT INTO member (username, phone_number, email, join_date, subscription)
VALUES
('johndoe88', '555-0101', 'john.doe@example.com', '2023-01-15', true),
('alice_wondr', '555-0102', 'alice.w@another.org', '2023-03-22', false),
('mike_tango', '555-0103', 'mike.t@corpmail.net', '2024-05-01', true),
('sara_green', '555-0104', 'sara.g@mymail.co', '2022-11-30', true),
('tech_guy_01', '555-0105', 'techguy@server.com', '2024-06-10', false),
('linda_day', '555-0106', 'linda.d@webmail.info', '2023-09-05', false),
('patel_rj', '555-0107', 'r.patel@india.in', '2024-02-14', true),
('greg_jones', '555-0108', 'greg.j@mailservice.biz', '2022-07-01', true),
('firefly22', '555-0109', 'firefly22@gmail.com', '2023-12-08', true),
('ocean_lover', '555-0110', 'ocean.l@sea.com', '2024-04-18', false);

INSERT INTO game (game_name, game_studio, game_genera, has_tournament, game_price) VALUES
('Realm of Valor', 'Dragonforge Games', 'MMORPG', TRUE, 49.99),
('Drift King 5', 'Speedster Devs', 'Racing', TRUE, 59.95),
('Silent Witness', 'Mystery Interactive', 'Adventure', FALSE, 15.00),
('Block Craft', 'Pixel Dreams', 'Sandbox', FALSE, 24.50),
('Aether Blitz', 'Sky Fighters Co.', 'Strategy', TRUE, 30.25),
('The Last Spire', 'Grim Lore Studios', 'Action-RPG', FALSE, 69.99);

INSERT INTO tournament (tournament_capacity, tournament_prize_pool, tournament_start_date, tournament_end_date, game_id, member_id)
VALUES
(128, 2500.00, '2025-12-10', '2025-12-12', 1, 3), 
(64, 1000.50, '2025-12-20', '2025-12-20', 2, 8),
(32, 750.00, '2026-01-05', '2026-01-08', 5, 1),
(256, 5000.00, '2026-02-14', '2026-02-16', 1, 9),
(16, 350.75, '2026-03-01', '2026-03-01', 2, 4);

INSERT INTO lending (lending_date_start, lending_date_end, game_id, member_id) VALUES
('2024-10-01', '2024-10-05', 3, 1),
('2024-09-15', '2024-10-15', 6, 4),
('2024-11-20', '2024-12-04', 2, 7),
('2024-11-28', '2024-12-30', 5, 10),
('2024-11-25', '2024-11-30', 4, 2);

INSERT INTO tournament_result (tournament_result, tournament_ranking, tournament_id, member_id)
VALUES
('Winner', 1, 3, 3),
('Qualifier', 8, 1, 5),
('Participated', 15, 4, 2),
('Runner-up', 2, 4, 6);


SELECT * FROM tournament where tournament_id = 3;

SELECT * FROM member;

SELECT * FROM game;

SELECT lending_id,lending_date_start,lending_date_end,lending.member_id,username,phone_number,email FROM lending inner join member on 
lending.member_id = member.member_id;


SELECT username,tournament_id,tournament_ranking FROM member inner join tournament_result on member.member_id = tournament_result.member_id;

SELECT member_id,username,phone_number,email  FROM member where subscription = 1; 


SELECT game.game_id,game_name from  lending inner join game on lending.game_id = game.game_id;

SELECT member_id,username, subscription from member ;