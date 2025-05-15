create table player
(
    id_player serial primary key,
    player_name varchar(100) not null,
    email varchar(100) not null unique
);

create table tournament
(
    id_tournament serial primary key,
    tournament_name varchar(100) not null,
    location varchar(100) not null,
    tournament_date timestamp not null check (tournament_date > current_timestamp)
);

create table registration
(
    id_player int not null,
    id_tournament int not null,
    primary key (id_player, id_tournament),
    constraint fk_player foreign key (id_player) references player(id_player),
    constraint fk_tournament foreign key (id_tournament) references tournament(id_tournament)
);

alter table player
rename column name to player_name;

select * from player;
select * from tournament;

insert into player(player_name, email)
values('Adam', 'adam@gmail.com'),
      ('Jake', 'jake@gmail.com'),
      ('Fred', 'fred@gmail.com'),
      ('Mike', 'mike@gmail.com'),
      ('Tony', 'tony@gmail.com');

/* insert into player(player_name, email)
values('Bill', 'mike@gmail.com'); */

insert into tournament(tournament_name, location, tournament_date)
values('IEM', 'Katowice', '2025-06-01 15:00:00'),
      ('VCT', 'Toronto', '2025-12-01 16:30:00');


/* insert into tournament(tournament_name, location, tournament_date)
values('IEM', 'Dallas', '2025-02-01 15:00:00'); */


      