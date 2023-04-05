/*OUTER JOIN*/

select * from employees;
select * from departments;

select first_name, last_name, salary, department_name
from employees e JOIN departments d ON (e.department_id = d.department_id);

select first_name, last_name, salary, department_name
from employees e LEFT OUTER JOIN departments d 
ON (e.department_id = d.department_id);

select first_name, last_name, salary, department_name
from departments d LEFT OUTER JOIN  employees e
ON (e.department_id = d.department_id);

select first_name, last_name, salary, department_name
from departments d LEFT OUTER JOIN  employees e
ON (e.department_id = d.department_id)
where department_name like '%i%';

select first_name, salary, min_salary, max_salary from employees e
LEFT OUTER JOIN jobs j ON (e.job_id = j.job_id AND salary*2 < max_salary); 

select postal_code, city, department_name, d.location_id
from locations l LEFT OUTER JOIN departments d ON (d.location_id=l.location_id)
order by location_id;

select department_name, d.department_id, first_name
from departments d LEFT OUTER JOIN employees e
ON (e.department_id = d.department_id)
where first_name is NULL;