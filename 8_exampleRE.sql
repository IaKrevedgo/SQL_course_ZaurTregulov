/*ПОВТОРЕНИЕ МАТЬ УЧЕНИЯ*/
/*SUBQUERY*/

select first_name, last_name, salary from employees
where salary > (select AVG(salary) from employees);                             

select first_name, last_name, salary , 
    salary - ROUND((select AVG(salary) from employees)) AVG 
from employees;

select * from jobs;
select * from departments;
select * from locations;
select (select MIN(min_salary) from jobs) min_zp, 
    (select MAX(LENGTH(first_name)) from employees) imya 
from dual;

select first_name, last_name from employees where
employee_id IN (select manager_id from employees);                              /* Показать список всех менеджеров!*/

select department_name, MIN(salary), MAX(salary) from 
    (select salary, department_name from employees e JOIN departments d
    ON (e.department_id = d.department_id))
    GROUP BY department_name;                                                   /*название депратамента и макс и мин зарплата в каждом департаменте*/
    

select department_id, department_name, city_name from 
        (select department_id, d.location_id, department_name from departments d
        JOIN locations l ON (d.location_id = l.location_id))
        GROUP BY department_name;

