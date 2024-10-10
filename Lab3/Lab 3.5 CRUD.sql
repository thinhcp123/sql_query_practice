create database shirts_db;

use shirts_db;

create table shirts_db(
	shirt_id int not null primary key auto_increment,
    article varchar(100),
    color varchar(100),
    shirt_size varchar(100),
    last_worn int
);

insert into shirts_db(article, color, shirt_size, last_worn)
value ('t-shirt', 'white', 'S', 10),
('t-shirt', 'green', 'S', 200),
('polo shirt', 'black', 'M', 10),
('tank top', 'blue', 'S', 50),
('t-shirt', 'pink', 'S', 0),
('polo shirt', 'red', 'M', 5),
('tank top', 'white', 'S', 200),
('tank top', 'blue', 'M', 15);

select * from shirts_db;

insert into shirts_db(article, shirt_size, last_worn)
value ("polo shirt","M",50);

select article,color from shirts_db;

select article, color, shirt_size, last_worn from shirts_db;

update shirts_db 
set shirt_size = "L"
where article = "polo shirt";
 
 delete from shirts_db where last_worn ="200";

