use book_data;
select concat(author_fname , ' ' , author_lname ) as fullname from books;

select concat_ws(' ',author_fname,author_lname)as fullname from books;

select substring('data analyst',5,8) as result;

select replace('data analyst','analyst','science')as result;

select replace(title,' ','->') from books;

select reverse("data analyst");

select char_length('database');
select char_length(title) as title_length from books;

select upper('database');
select upper(title) from books;

select lower('DATABASE');
select lower(title) from books;