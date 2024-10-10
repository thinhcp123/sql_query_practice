use cat_app;

Update cats 
set name = 'jack'
where name = "jackson";

select * from cats;

Update cats 
set name = 'Ringo'
where name = "Bitish Shorthair";

update cats 
set age = 12
where breed="Maine Coon";

delete from cats where age = 4;
delete from cats where cat_id = age;
delete from cats;