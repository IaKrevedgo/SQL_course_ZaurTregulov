select first_name, salary
from employees
order by first_name asc;

select first_name, salary
from employees
where job_id = 'IT_PROG'
order by salary;

select first_name, salary, hire_date
from employees
where job_id = 'IT_PROG'
order by first_name asc;

select first_name, salary, hire_date
from employees
where job_id = 'IT_PROG'
order by hire_date desc;

select last_name, salary, hire_date, hire_date+salary*2
from employees
where employee_id >120 
order by hire_date+salary*2;

select * from employees
order by commission_pct desc nulls last;

select * from employees
order by commission_pct desc nulls first;

select first_name, salary, hire_date
from employees
order by 3;

select job_id, first_name, last_name, salary, hire_date
from employees
order by job_id desc, last_name, 4 desc;




select * from employees
where first_ name = 'David';

select * from employees 
where job_id = 'FI_ACCOUNT';

select first_name, last_name, salary, department_id
from employees
where department_id = 50 and salary >4000;

select *
from employees
where first_name like '_a%a';

select *
from employees
where department_id in (20,30);

select *
from employees
where department_id in (50,80) 
and commission_pct is not null
order by 4;

select *
from employees
where first_name like '%n%n%';

select *
from employees
where first_name like '____%'
order by department_id desc nulls last;

select *
from employees
where (salary between 3000 and 7000) 
and (commission_pct is null) 
and (job_id in ('PU_CLERK','ST_MAN','ST_CLERK'));

select *
from employees
where first_name like '%\%%' escape '\';

select job_id, first_name, salary
from employees
where employee_id >= 120 AND job_id != 'IT_PROG'
order by job_id, first_name desc;