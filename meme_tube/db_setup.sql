drop database movies;

create database movies;


drop table videos;

create table videos (
  id serial8 primary key,
  urlsnipp varchar(50),
  title varchar(200),
  description text
);

insert into videos (urlsnipp, title, description) values('nlYlNF30bVg', 'laughing goats', 'vidoes of goats');

insert into videos (urlsnipp, title, description) values('XdkNtxqXncA', 'deamon car', 'Video of talking cats');
