create database online_shop;
use online_shop;
create table book(id int primary key auto_increment, name varchar(50) not null, notes varchar(100));

create view bookview as select * from book;

insert into bookview (id, name) values (2, "War and Peace");

drop view bookview;
select * from book;
/* Trong SQL, một View là một câu truy vấn được lưu trữ trong cơ sở dữ liệu và cho phép truy cập dữ liệu từ một hoặc nhiều bảng. Khi bạn thêm dữ liệu vào một View, bạn đang thêm dữ liệu vào các bảng cơ sở dữ liệu gốc mà View được tạo từ.
Tuy nhiên, khi bạn xóa một View, bạn chỉ xóa định nghĩa của View và không ảnh hưởng đến dữ liệu trong các bảng cơ sở dữ liệu gốc. Do đó, dữ liệu trong bảng cơ sở dữ liệu không bị xóa khi bạn xóa một View.
*/