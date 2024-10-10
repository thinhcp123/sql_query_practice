CREATE USER user1@localhost IDENTIFIED BY '1';
CREATE USER user2@localhost IDENTIFIED BY '1';
GRANT ALL PRIVILEGES ON *.* TO user1@localhost WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO user2@localhost WITH GRANT OPTION;
-- yc4
-- Buoc2 : Có được thực thi
-- Buoc3 : Có được thực thi
-- Buoc4 : đang chờ để thực thi
-- Buoc5 : đang chờ để thực thi
-- Buoc7 : Có, có trong bảng vì khi unlock sẽ thực thi vì khi lock table thì client session khác không được thao tác dữ liueej vào một bảng mà phải chờ tới khi được unlock mới insert được dữ liệu vào bảng

-- yc5
-- Bước 1: Có
-- Buoc2 : Có được thực thi
-- Buoc3 : KHông vì quyền read chỉ cho phép truy cập bảng với quyền đọc
-- Buoc4 : Có
-- Buoc5 : đang chờ để thực thi 
-- Buoc6 : Có
-- Buoc7 : Có  có trong bảng vì khi unlock sẽ thực thi vì khi lock table thì client session khác không được thao tác dữ liueej vào một bảng mà phải chờ tới khi được unlock mới insert được dữ liệu vào bảng


