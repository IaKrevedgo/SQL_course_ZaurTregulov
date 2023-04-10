/*SINGLE ROW SUBQUERRIES*/

select * from employees;
select * from departments;
select * from locations;
select * from countries;

select  first_name, last_name, salary from employees
where salary < (select MAX(salary) from employees) /5 ;

select  first_name, last_name, salary from employees
where salary > (select AVG(salary) from employees) /5 ;

select  first_name, last_name, salary from employees
where salary >= (select salary from employees where employee_id = 150);         /*Для сравнивания одного значения*/


select  first_name, last_name, salary from employees
where salary >= 
    (select salary, first_name from employees where employee_id = 150);         /*Выдвст ошибку, так как второй селект возращает несоклько значений*/
    
select  first_name, last_name, salary from employees
where salary >= (select salary from employees where employee_id > 150);         /*Выдаст ошибку так как не поддерживаютя логические операции для СИНГЛ РО */

select job_title from jobs j JOIN employees e ON (j.job_id= e.job_id)
GROUP BY job_title
HAVING AVG(salary) = 
    (select MAX(AVG(salary)) from employees GROUP BY job_id);