drop database movies;

create database movies;


drop table videos;

create table videos (
  id serial8 primary key,
  urlsnipp varchar(50),
  title varchar(200),
  description text
);

insert into videos (urlsnipp, title, description) values('vXJhV_Kj4yY', 'Cody, The screaming dog', 'Dog sounds like a human');

insert into videos (urlsnipp, title, description) values('nlYlNF30bVg', 'Screaming Goats', 'Goats that scream');

insert into videos (urlsnipp, title, description) values('YhboiCVBNJg', 'Crazy Frog', 'Video of a frog screaming');

insert into videos (urlsnipp, title, description) values('BqIndw0KuDk', 'Angry Penguin', 'Penguins playing tricks');

insert into videos (urlsnipp, title, description) values('J---aiyznGQ', 'Keyboard Cat', 'Classic Vid of cat playing piano');
insert into videos (urlsnipp, title, description) values('5d7aruKYkKs', 'Cat Fail', 'Crazy cat being silly');
