/*ÄÎÌÀØÊÀ*/
select department_id,
    MAX(salary),
    MIN(salary),
    MAX(hire_date),
    MIN(hire_date),
    COUNT(first_name)
from employees
GROUP BY department_id
ORDER BY count(first_name) desc;

select SUBSTR(first_name, 1, 1) A, COUNT(first_name) B
from employees
GROUP BY SUBSTR(first_name, 1, 1)
HAVING count (*) > 1
ORDER BY 1;

select department_id, salary, count(*)
from employees
GROUP BY department_id, salary

order by department_id desc;

select TO_CHAR(hire_date,'Day'), count(*)
from employees
GROUP BY TO_CHAR(hire_date,'Day');

select department_id
from employees
GROUP BY department_id
HAVING COUNT(first_name) > 30 AND SUM(salary) > 300000;

select region_id
from countries
GROUP BY region_id
HAVING SUM(LENGTH(country_name)) > 50;

select job_id, ROUND(AVG(salary))
from employees
GROUP BY job_id
order by job_id;

select department_id
from employees
GROUP BY department_id
HAVING COUNT(DISTINCT job_id) > 1
ORDER BY department_id;

select department_id, job_id, MAX(salary), MIN(salary)
from employees
GROUP BY department_id, job_id
HAVING AVG(salary) > 10000
ORDER BY department_id;

select manager_id
from employees
where commission_pct IS NULL
GROUP BY manager_id
HAVING AVG(salary) BETWEEN 6000 AND 9000;

select ROUND(MAX(AVG(salary)), -3)
from employees
GROUP BY department_id;
