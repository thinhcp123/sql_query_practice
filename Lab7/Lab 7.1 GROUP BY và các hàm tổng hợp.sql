use book_data;

select count(book_id) as number_book from books;

select released_year,count(released_year) as number_book from books group by released_year order by released_year;

select sum(stock_quantity) from books;

select avg(released_year) as avg_released_year from books;

select concat(author_fname,' ',author_lname),pages from books where pages = (select max(pages) from books);