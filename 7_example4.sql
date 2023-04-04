/*NONEQUIJOIN with ON*/

select * from jobs;

select first_name, salary, min_salary, max_salary from employees e
JOIN jobs j ON (e.job_id = j.job_id AND salary*2 < max_salary); 

select first_name, salary, min_salary, max_salary from employees e
JOIN jobs j ON (e.job_id = j.job_id and salary = max_salary);

select first_name, salary, min_salary, max_salary from employees e
JOIN jobs j ON (e.job_id = j.job_id and salary between min_salary+2000 AND max_salary-3000);



/*SELF-JOIN*/
select employee_id, first_name, manager_id from employees;

select emp1.employee_id, emp1.first_name, emp1.manager_id, emp2.first_name manager_name
from employees emp1 JOIN employees emp2 ON (emp1.manager_id = emp2.employee_id)
order by emp1.employee_id;

select  emp2.first_name manager_name, count(*)
from employees emp1 JOIN employees emp2 ON (emp1.manager_id = emp2.employee_id)
GROUP by emp2.first_name order by count(*) DESC;