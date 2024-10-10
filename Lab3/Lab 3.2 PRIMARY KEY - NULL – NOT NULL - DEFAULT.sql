use cat_app;
create table unique_cats(
	cat_id int not null,
    name varchar(100),
    age int
);

insert into unique_cats(cat_id,name,age)
value (1, 'Fred', 23),
(2, 'Louise', 3),
(3, 'James', 3);

create table unique_cats2(
	cat_id int not null auto_increment primary key,
    name varchar(100),
    age int
    );
    
insert into unique_cats2(name,age)
value ('Skippy', 4),
('Jiff', 3),
('Jiff', 3),
('Jiff', 3),
('Skippy', 4);

SELECT 
    *
FROM
    unique_cats2;

create table employees (
	id int not null primary key auto_increment,
    first_name varchar(255) not null,
    last_name varchar(255) not null,
    middle_name varchar(255),
    age int not null,
    current_status varchar(255) not null default "employed"
);

insert into employees(first_name, last_name, age)
value ('Dora', 'Smith', 58);

select * from employees;











