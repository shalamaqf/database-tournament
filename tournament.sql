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

create table registration
(
    id_player int not null,
    id_tournament int not null,
    primary key (id_player, id_tournament),
    constraint fk_player foreign key (id_player) references player(id_player),
    constraint fk_tournament foreign key (id_tournament) references tournament(id_tournament)
);