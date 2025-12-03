CREATE DATABASE Gamingclub; USE
    Gamingclub;
CREATE TABLE member(
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    phone_number VARCHAR(20),
    email VARCHAR(40),
    join_date DATE,
    subscription BOOLEAN
); CREATE TABLE game(
    game_id INT PRIMARY KEY AUTO_INCREMENT,
    game_name VARCHAR(50),
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
    tournament_duration DATE,
    game_id INT,
    member_id INT,
    FOREIGN KEY(game_id) REFERENCES game(game_id),
    FOREIGN KEY(member_id) REFERENCES member(member_id)
);

CREATE TABLE tournament_result(
	tournament_result varchar(20),
    tournament_ranking int,
    tournament_id int,
    member_id int,
    FOREIGN KEY (tournament_id) REFERENCES tournament(tournament_id),
    FOREIGN KEY (member_id) REFERENCES member(member_id)
);