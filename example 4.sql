select *
from employees;

select first_name, last_name, salary
from employees
where salary >= 10000;

select first_name, last_name, salary
from employees
where last_name = 'King';

select *
from employees
where hire_date = '21.09.89';

select *
from departments
where location_id = 1700;

select *
from employees
where employee_id = manager_id+1000/10+1;

select *
from job_history
where job_id = 'ST_CLERK';

select *
from employees
where first_name = last_name;

select *
from employees
where ('Dr '||first_name||' '||last_name = 'Dr David Austin') OR
      ('Dr '||first_name||' '||last_name = 'Dr Steven King');
      
select *
from job_history
where start_date+364 = end_date;

select * from departments;

select first_name, last_name,salary
from employees
where salary != 9000; 