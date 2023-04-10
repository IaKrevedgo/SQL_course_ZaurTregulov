/*Домашка 7 раздел ))*/

select * from regions;
select * from departments;
select * from employees;
select * from countries;
select * from locations;
select * from jobs;

select region_name, COUNT(*) 
    from employees e 
        JOIN departments d ON (e.department_id = d.department_id)
        JOIN locations l ON (d.location_id = l.location_id)
        JOIN countries c ON (l.country_id = c. country_id)
        JOIN regions r ON (c.region_id = r.region_id)
GROUP BY region_name;

select e.first_name, e.last_name, d.department_name, e.job_id, l.street_address, c.country_name, r.region_name
from employees e
    JOIN departments d ON(e.department_id = d.department_id)
    JOIN locations l ON (d.location_id = l.location_id)
    JOIN countries c ON (c.country_id = l.country_id)
    JOIN regions r ON (r.region_id = c.region_id);
    
select emp2.first_name, COUNT(emp2.first_name) count
from employees emp1 JOIN employees emp2 ON (emp1.manager_id = emp2.employee_id)
GROUP by emp2.first_name 
HAVING COUNT(emp2.first_name) > 6
order by count(*) DESC;                                                         /*SELFJOIN*/

select d.department_name, COUNT(*)
from employees e JOIN departments d USING (department_id)
GROUP BY d.department_name
HAVING COUNT (d.department_name) > 30;

select d.department_name
from employees e 
RIGHT OUTER JOIN departments d ON (e.department_id=d.department_id)
GROUP BY d.department_name
HAVING COUNT(e.first_name) = 0;

select emp1.first_name emp_name, emp1.hire_date emp_hd, emp2.first_name manager_name, emp2.hire_date man_hd 
from employees emp1 JOIN employees emp2 ON (emp1.manager_id = emp2.employee_id)
WHERE TO_CHAR(emp2.hire_date, 'YYYY') = '1997' AND emp1.hire_date < TO_DATE ('01-01-1997', 'DD-MM_YYYY')
order by emp1.employee_id;

select country_name, region_name
from countries NATURAL JOIN regions;

select first_name, last_name, salary
from employees e JOIN jobs j 
ON (e.job_id = j.job_id AND e.salary < j.min_salary + 1000);

select e.first_name, e.last_name, c.country_name
from employees e 
        FULL OUTER JOIN departments d ON (e.department_id = d.department_id)
        FULL OUTER JOIN locations l ON (d.location_id = l.location_id)
        FULL OUTER JOIN countries c ON (l.country_id = c. country_id);
   
select e.first_name, e.last_name, c.country_name
from employees e CROSS JOIN countries c;                                        /*ВСЕ страны со всеми работниками объеденились без логики*/

select r.region_name, COUNT(*) 
from employees e, departments d, locations l, countries c, regions r 
where 
    e.department_id = d.department_id AND d.location_id = l.location_id 
    AND l.country_id = c. country_id AND c.region_id = r.region_id
GROUP BY r.region_name;

select d.department_name 
from employees e, departments d 
where e.department_id (+) = d.department_id
GROUP BY d.department_name
HAVING COUNT(e.first_name) = 0;