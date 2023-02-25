select *
from employees
where first_name like 'S%' and salary > 10000;

select *
from employees
where first_name like 'A%' and salary > 7000 and job_id = 'SA_REP';

select *
from employees
where first_name like 'D%' OR salary > 9000
order by first_name, salary;
