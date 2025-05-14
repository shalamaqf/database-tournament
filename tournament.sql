create table player
(
    id_player serial primary key,
    name varchar(100) not null,
    email varchar(100) not null unique
);

create table tournament
(
    id_tournament serial primary key,
    tournament_name varchar(100) not null,
    location varchar(100) not null,
    tournament_date timestamp default current_timestamp check (tournament_date > current_timestamp)
);