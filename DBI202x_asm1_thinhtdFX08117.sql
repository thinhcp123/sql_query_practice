use hr;

-- 1 Truy vấn first_name, last_name, job_id và salary của các nhân viên có tên bắt đầu bằng chữ “S”

SELECT first_name, last_name, job_id, salary FROM employees WHERE first_name LIKE 'S%';

-- 2 Viết truy vấn để tìm các nhân viên có số lương (salary) cao nhất

Select employee_id, last_name, job_id, max(salary) from employees group by employee_id limit 1;  

-- 3.3. Viết truy vấn để tìm các nhân viên có số lương lớn thứ hai.Ví dụ có 5 nhân viên có mức lương lần lượt là 4, 4, 3, 3, 2 thì kết quả  đúng của mức lương lớn thứ hai sẽ là 3,3
 
select  employee_id,first_name, last_name, job_id,salary from employees 
where salary = (select DISTINCT salary from employees order by salary desc limit 1 offset 1);
 
-- 4. Viết truy vấn để tìm các nhân viên có số lương lớn thứ ba. Tương tự như yêu cầu 3

select employee_id,first_name, last_name, job_id,salary from employees
where salary = (select distinct salary from employees order by salary desc limit 1 offset 2);

-- 5. Viết truy vấn để hiển thị mức lương của nhân viên cùng với người quản lý tương ứng, tên nhân viên và quản lý kết hợp từ first_name và last_name	
 select concat(e.first_name,' ',e.last_name) as employee, e.salary as emp_sal,
		concat(m.first_name,' ',m.last_name) as manager, m.salary as mgr_sal
from employees as e
join  employees as m on e.manager_id = m.employee_id;


-- 6. Viết truy vấn để tìm số lượng nhân viên cần quản lý của mỗi người quản lý, tên quản lý kết hợp từ first_name và last_name
select m.employee_id as employee_id, concat(m.first_name,' ',m.last_name) as manager_name,count(e.manager_id) as number_of_reportees
from employees e , employees m
where m.employee_id = e.manager_id
group by m.employee_id
order by number_of_reportees desc;

-- 7. Viết truy vấn để tìm được số lượng nhân viên trong mỗi phòng ban sắp xếp theo thứ tự số nhân viên giảm dần


select department_name,count(employees.employee_id) as emp_count
from departments
join employees on employees.department_id = departments.department_id
group by employees.department_id
order by emp_count desc;

-- 8. Viết truy vấn để tìm số lượng nhân viên được thuê trong mỗi năm sắp xếp theo thứ tự số lương nhân viên giảm dần và nếu số lượng nhân viên bằng nhau thì sắp xếp theo năm tăng dần

 select year(hire_date) as hired_year,
	count(employee_id) as employees_hired_count
 from employees 
 group by hired_year
 order by employees_hired_count desc,hired_year asc;
 
 -- 9. Viết truy vấn để lấy mức lương lớn nhất, nhỏ nhất và mức lương trung bình của các nhân viên (làm tròn mức lương trung bình về số nguyên)


SELECT 
    MIN(salary) AS min_sal,
    MAX(salary) AS max_sal,
    ROUND(AVG(salary)) AS avg_sal
FROM
    employees;


-- 10. Viết truy vấn để chia nhân viên thành ba nhóm dựa vào mức lương, tên nhân viên được kết hợp từ first_name và last_name, kết quả sắp xếp theo tên thứ tự tăng dần
 SELECT 
    CONCAT(first_name, ' ', last_name) AS employee,
    salary,
    CASE
        WHEN salary BETWEEN 2000 AND 5000 THEN 'low'
        WHEN salary BETWEEN 5000 AND 10000 THEN 'mid'
        ELSE 'high'
    END AS salary_level
FROM
    employees
ORDER BY employee;


-- 11. Viết truy vấn hiển thị họ tên nhân viên và số điện thoại theo định dạng (_ _ _)-(_ _ _)-(_ _ _ _). Tên nhân viên kết hợp từ first_name và last_name, kết quả hiển thị như hình vẽ dưới đây

 select 
	concat(first_name,' ',last_name) as employee,
    replace(phone_number,'.','-') as phone_number
from employees;
	
-- 12. Viết truy vấn để tìm các nhân viên gia nhập vào tháng 08-1994, tên nhân viên kết hợp từ first_name và last_name

select 
	concat(first_name,' ',last_name) as employee,
    hire_date
from employees
where month(hire_date) = 8 and year(hire_date) = 1994;

-- 13. Viết truy vấn để tìm những nhân viên có mức lương cao hơn mức lương trung bình của các nhân viên, kết quả sắp xếp theo thứ tự tăng dần của department_id

select 
	concat(e.first_name,e.last_name) as name,
	e.employee_id,
    d.department_name,
    d.department_id,
    e.salary
from employees as e 
join departments as d on e.department_id = d.department_id
where e.salary > (select avg(salary) from employees)
order by department_id;

-- 14. Viết truy vấn để tìm mức lương lớn nhất ở mỗi phòng ban, kết quả sắp xếp theo thứ tự tăng dần của department_id
select
	d.department_id,
    d.department_name as department,
    max(e.salary) as maximum_salary
from departments as d
join employees as e on e.department_id = d.department_id
group by e.department_id
order by d.department_id;

-- 15. Viết truy vấn để tìm 5 nhân viên có mức lương thấp nhất
select 
	first_name,last_name,employee_id,salary
from employees
order by salary asc limit 5;

-- 16. Viết truy vấn để hiển thị tên nhân viên theo thứ tự ngược lại
select 
	lower(first_name) as name,
    lower(reverse(first_name)) as name_in_reverse
from employees;

-- 17. Viết truy vấn để tìm những nhân viên đã gia nhập vào sau ngày 15 của tháng
select 
	employee_id,
    concat(first_name,' ',last_name),
    hire_date
from employees
where day(hire_date) > 15;


-- 18. Viết truy vấn để tìm những quản lý và nhân viên làm trong các phòng ban khác nhau, kết quả sắp xếp theo thứ tự tăng dần của tên người quản lý (tên nhân viên và quản lý kết hợp từ first_name và last_name)
select
	concat(m.first_name,' ',m.last_name) as manager,
    concat(e.first_name,' ',e.last_name) as employee,
    m.department_id as mgr_dept,
    e.department_id as emp_dept
from employees e, employees m
where e.department_id != m.department_id and e.manager_id = m.employee_id
order by manager;


-- advance Hoàn thành câu truy vấn 18 và sử dụng biến trong câu truy vấn thứ 4

Set @three_salary = (select distinct salary from employees order by salary desc limit 1 offset 2);

select
	employee_id,first_name, last_name, job_id,salary
from employees
where salary = @three_salary;
 
 
 
 
 
 
 
 
 
 