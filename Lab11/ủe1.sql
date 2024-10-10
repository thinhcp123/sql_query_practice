create database lab;
use lab;
create table student(
id int primary key auto_increment,
name varchar(100)
);
insert into student(name) values('name A'),('name B');

use lab;
lock tables student write;
select * from student;

insert into student(name) values('name C');
use lab;
unlock table;

use lab;
lock tables student read;

use lab;
select * from student;

insert into student(name) values('name E');

use lab;
unlock table;

select * from student;
