use cat_app;
create table people(
	first_name varchar(20),
    last_name varchar(20),
    age int
);

insert into people(first_name,last_name,age) 
value('Tina', 'Belcher', 13),
('Bob', 'Belcher', 42),
('Linda', 'Belcher', 45),
('Phillip', 'Frond', 38),
('Calvin', 'Fischoeder', 70);

SELECT 
    *
FROM
    people;

Drop table people;
show tables