create table player
(
    id_player serial primary key,
    name varchar(100) not null,
    email varchar(100) not null unique
);