use hr;
select * from employees;
select * from departments;
-- 1. Truy vấn first_name, last_name, job_id và salary của các nhân viên có tên bắt đầu bằng chữ “S”
select  first_name, last_name, job_id ,salary from employees where first_name like 's%';

-- 2. Viết truy vấn để tìm các nhân viên có số lương (salary) cao nhất
select  employee_id,first_name, last_name, job_id, salary from employees order by salary desc limit 1;
-- 3. Viết truy vấn để tìm các nhân viên có số lương lớn thứ hai. Ví dụ có 5 nhân viên có mức lương lần lượt là 4, 4, 3, 3, 2 thì kết quả  đúng của mức lương lớn thứ hai sẽ là 3,3
select  employee_id,first_name, last_name, job_id,salary from employees 
where salary = (select salary from employees order by salary desc limit 1,1);

-- 4. Viết truy vấn để tìm các nhân viên có số lương lớn thứ ba. Tương tự như yêu cầu 3
select  employee_id,first_name, last_name, job_id,salary from employees 
where salary = (select salary from employees order by salary desc limit 3,1);

--  5. Viết truy vấn để hiển thị mức lương của nhân viên cùng với người quản lý tương ứng, tên nhân viên và quản lý kết hợp từ first_name và last_name
select 
	concat(e.first_name, ' ',e.last_name) as employee, e.salary as emp_sal,
    concat(m.first_name,' ',m.first_name) as manager, m.salary as mgr_sal
	from employees as e
    join employees as m on e.manager_id = m.employee_id;
 -- 6. Viết truy vấn để tìm số lượng nhân viên cần quản lý của mỗi người quản lý, tên quản lý kết hợp từ first_name và last_name
select 
	m.employee_id,concat(m.first_name,' ',m.last_name)as manager_name,count(e.manager_id) as number_of_reportees
	from employees as e
    join employees as m on e.manager_id = m.employee_id
    group by m.employee_id,m.first_name,m.last_name
    order by number_of_reportees desc;

-- 7. Viết truy vấn để tìm được số lượng nhân viên trong mỗi phòng ban sắp xếp theo thứ tự số nhân viên giảm dần
select 
	department_name, count(employee_id) as emp_count
    from employees
    join departments on departments.department_id = employees.department_id
    group by department_name
    order by emp_count desc;
--  8.Viết truy vấn để tìm số lượng nhân viên được thuê trong mỗi năm sắp xếp theo thứ tự số lương nhân viên giảm dần và nếu số lượng nhân viên bằng nhau thì sắp xếp theo năm tăng dần
select 
	year(hire_date) as hire_year,
    count(employee_id) as employees_hired_count
	from employees
    group by hire_year
    order by
    employees_hired_count desc,
    hire_year asc;