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
where salary != 17000;

select * 
from employees
where first_name <'Steven'
order by first_name;

select*
from job_history
where start_date < '01.01.98';

select * 
from employees
where first_name = 'Steven'
order by first_name;

select first_name, last_name, salary
from employees
where salary between employee_id+5000 and 10000;

select *
from job_history
where start_date between '01.01.94' and '12.12.98';

select *
from employees
where first_name between 'A' and 'D';

select *
from employees
where salary >= 4000 and salary <=10000;

select *
from departments
where location_id in (1700, 2400, 1200);

select *
from departments
where location_id = 1700 OR
    location_id = 2400 OR
    location_id = 1200;

select * 
from job_history
where job_id in ('IT_PROG','ST_CLERK');

select *
from job_history
where end_date in ('31.12.99', '31.12.98', '01.05.97');

select *
from employees
where commission_pct is not null;

select *
from employees
where first_name = 'Steven';

select *
from employees
where first_name like 'S%';

select *
from employees
where first_name like '%r';

select *
from employees
where first_name like 'A%r';

select *
from employees
where first_name like 'D_n';

select *
from employees
where first_name like 'A%d%';

select *
from employees
where first_name like '__n%';

select *
from employees
where job_id like 'ST\_%' escape '\';

select *
from employees
where job_id like 'ST$_%' escape '$';