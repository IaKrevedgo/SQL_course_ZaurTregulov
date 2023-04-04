/*NATURAL JOIN WITH ON*/
select first_name, last_name, jh.job_id, start_date, end_date
from employees e JOIN job_history jh ON (e.employee_id=jh.employee_id); 

select first_name, last_name, jh.job_id, start_date, end_date,
e.employee_id, jh.employee_id
from employees e JOIN job_history jh ON (e.employee_id=jh.employee_id); 

select * from regions;
select * from departments;

select * from departments JOIN regions ON (region_id*10=department_id);

select first_name, last_name, jh.job_id, start_date, end_date
from employees e JOIN job_history jh ON (e.employee_id=jh.employee_id 
AND e.department_id=jh.department_id AND salary > 10000);



