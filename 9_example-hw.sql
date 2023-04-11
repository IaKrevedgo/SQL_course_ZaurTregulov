/*ДОМАШКА*/2

select manager_id, TO_CHAR(NULL) job_id, TO_NUMBER(NULL) department_id, SUM(salary) 
from employees
GROUP BY manager_id 
UNION
select TO_NUMBER(NULL), job_id, TO_NUMBER(NULL), SUM(salary) 
from employees
GROUP BY job_id
UNION
select TO_NUMBER(NULL), TO_CHAR(NULL), department_id, SUM(salary) 
from employees
GROUP BY department_id;                                                         /*сумма зарплат дял каждой из групп*/

select department_id from employees where manager_id IN 100
MINUS
select department_id from employees where manager_id IN (145,201);      


select first_name, last_name, salary from employees 
where first_name LIKE '_a%'
INTERSECT 
select first_name, last_name, salary from employees 
where LOWER(last_name) LIKE '%s%'
order by salary DESC;                                                           /*Имена соержат букву а а фамилия букву S*/

select * from locations;
select* from countries;
select * from regions;

select location_id, postal_code, city from locations 
where country_id IN
    (select country_id from countries where country_name IN('Italy', 'Germany'))
UNION ALL
select location_id, postal_code, city from locations 
where postal_code LIKE '%9%';                                                   /*а также*/

select country_id id, country_name country, region_id region from countries 
where LENGTH(country_name) > 8
UNION
select country_id, country_name, region_id from countries 
where region_id != (select region_id from regions WHERE region_name = 'Europe')
order by country DESC;                                                          /*Старын из всех регионов кроме европы и название страны больше 8 символов*/