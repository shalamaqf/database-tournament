--create a table for player
create table player
(
    id_player serial primary key,
    player_name varchar(100) not null,
    email varchar(100) not null unique
);

-- create a table for tournament
create table tournament
(
    id_tournament serial primary key,
    tournament_name varchar(100) not null,
    location varchar(100) not null,
    tournament_date timestamp not null check (tournament_date > current_timestamp)
);

-- create a table for registration
create table registration
(
    id_player int not null,
    id_tournament int not null,
    primary key (id_player, id_tournament),
    constraint fk_player foreign key (id_player) references player(id_player),
    constraint fk_tournament foreign key (id_tournament) references tournament(id_tournament)
);

-- rename column name in player table
alter table player
rename column name to player_name;


-- select queries for the table
select * from player;
select * from tournament;
select * from registration;

-- insert some values to player table
insert into player(player_name, email)
values('Adam', 'adam@gmail.com'),
      ('Jake', 'jake@gmail.com'),
      ('Fred', 'fred@gmail.com'),
      ('Mike', 'mike@gmail.com'),
      ('Tony', 'tony@gmail.com');

/* insert into player(player_name, email)
values('Bill', 'mike@gmail.com'); */


-- insert some values to tournament table
insert into tournament(tournament_name, location, tournament_date)
values('IEM', 'Katowice', '2025-06-01 15:00:00'),
      ('VCT', 'Toronto', '2025-12-01 16:30:00');

insert into tournament(tournament_name, location, tournament_date)
values('ESL', 'Prague', '2025-07-01 17:00:00');


/* insert into tournament(tournament_name, location, tournament_date)
values('IEM', 'Dallas', '2025-02-01 15:00:00'); */


-- insert some values to registration table
insert into registration(id_player, id_tournament)
values(1, 3),
      (3, 2),
      (4, 3);

insert into registration(id_player, id_tournament)
values(1, 2);

/* insert into registration(id_player, id_tournament)
values(5, 2),
      (5, 2); */


-- we will use inner join --
select player.player_name, tournament.tournament_name, tournament_date, tournament.location
from registration
inner join player on registration.id_player = player.id_player
inner join tournament on registration.id_tournament = tournament.id_tournament;


-- try some joins --
select player.player_name, tournament.tournament_name, tournament_date, tournament.location
from registration
left join player on registration.id_player = player.id_player
left join tournament on registration.id_tournament = tournament.id_tournament;

select player.player_name, tournament.tournament_name, tournament_date, tournament.location
from registration
right join player on registration.id_player = player.id_player
right join tournament on registration.id_tournament = tournament.id_tournament;

select player.player_name, tournament.tournament_name, tournament_date, tournament.location
from registration
full join player on registration.id_player = player.id_player
full join tournament on registration.id_tournament = tournament.id_tournament;

