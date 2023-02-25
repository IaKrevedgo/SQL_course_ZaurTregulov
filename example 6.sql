select *
from employees;

select *
from employees
where first_name like '__n%' AND commission_pct is null;

select *
from employees
where first_name like 'A%' AND job_id = 'SA_REP';

select *
from employees
where first_name like 'A%' AND job_id = 'SA_REP' 
        OR
      first_name like '__n%' AND commission_pct is null;
      
select *
from employees
where (first_name like 'A%' AND job_id = 'SA_REP' )
        OR
      (first_name like '__n%' AND commission_pct is null);
      
select first_name, last_name, department_id, job_id, commission_pct
from employees
where last_name like '%i%' and salary > employee_id *50
    OR
    job_id in ('IT_PROG', 'PU_CLERK') and commission_pct is null;
    
select first_name, last_name, department_id, job_id, commission_pct
from employees
where last_name like '%i%' 
OR
salary > employee_id *50 and job_id in ('IT_PROG', 'PU_CLERK') 
    or 
    commission_pct is null;