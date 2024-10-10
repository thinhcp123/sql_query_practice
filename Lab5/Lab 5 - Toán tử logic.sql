use book_data;

select 10!=10; -- Phep so sanh khac
SELECT 15 > 14 && 99 - 5 <= 94; -- PHep lon hon va phep nho hon hoac bang
SELECT 1 IN (5,3) || 9 BETWEEN 8 AND 10; --  hoac 


select released_year from books where released_year < 1980;

select * from books where author_lname in('Eggers','Chabon');

select * from books where author_lname like 'Lahiri%' and released_year < 2000;

select * from books where pages between 100 and 200;

select title,author_lname,
case when title like '%Stories%' then 'Short Stories'
	 when title in('Just Kids','A Heartbreaking Work of Staggering Genius') then 'Memoir'
     else 'Novel'
     end as Type from books;