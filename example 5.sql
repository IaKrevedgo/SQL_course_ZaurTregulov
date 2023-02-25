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

select *
from employees
where not (job_id = 'SA_MAN');

select *
from employees
where last_name not like 'K%';

select *
from employees
where job_id not in ('ST_MAN','ST_CLERK');

select *
from employees
where salary not between 5000 and 6500;

select *
from employees
where commission_pct is not null;

select *
from employees
where commission_pct is not null and last_name not like '%n';

