/*Объединение нескольких таблиц*/

select * from regions;
select * from locations;
select * from countries;

select * from locations NATURAL JOIN countries NATURAL JOIN regions;            /*ОБъединение 3-х таблицы*/

select * from locations JOIN countries USING (country_id)               
JOIN regions USING (region_id);                                                 /*То же самое используя USING*/

select first_name, last_name, jh.job_id, start_date, end_date, department_name
from employees e JOIN job_history jh ON (e.employee_id = jh.employee_id)
JOIN departments d ON (jh.department_id = d.department_id);                     /*используем JOIN ON*/
    
    
select first_name, last_name, jh.job_id, start_date, end_date, department_name
from employees e JOIN job_history jh USING (employee_id)
JOIN departments d ON (jh.department_id = d.department_id);                     /*Используем разные Джойны, но так делать не надо - можно запутаться*/

select department_name, min(salary), max(salary)
from employees e JOIN departments d ON (e.department_id = d.department_id)
GROUP BY department_name ORDER BY department_name DESC;