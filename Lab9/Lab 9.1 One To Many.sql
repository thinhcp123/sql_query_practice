use book_shop;

create table students(
	id int primary key auto_increment,
    first_name varchar(150) not null
);

create table papers(
	student_id int,
    title varchar(150),
    grade int,
    foreign key (student_id) REFERENCES students(id)
);

INSERT INTO students (first_name) VALUES 
('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);

select * from students;

select * from papers;

select first_name,title,grade from students left join papers on id = student_id ;

select first_name,ifnull(title,'MISSING'),ifnull(grade,0) from students left join papers on id = student_id ;

select first_name,ifnull(avg(grade),0.0000) as average from students left join papers on id = student_id group by id order by average desc;

select first_name,ifnull(avg(grade),0.0000) as average,
case 
	when ifnull(avg(grade),0.0000) > 70.0000 then 'PASSING'
    Else 'FAILING'
end as passing_status 
from students left join papers on id= student_id group by id order by average desc;