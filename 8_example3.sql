/*MULTIPLE ROW SUBQUERRY*/

select first_name, last_name, salary from employees 
where job_id = (select job_id from jobs where min_salary >8000);                /*Выдаст ошибку*/

select first_name, last_name, salary from employees 
where job_id IN (select job_id from jobs where min_salary >8000);               /*Вместо равно пишем IN*/

select first_name, last_name, salary from employees 
where job_id NOT IN (select job_id from jobs where min_salary >8000);           /*Вместо НЕ равно пишем IN. Не использовать, если не уверен, что подзапрос не содержит NULL!!!!*/

select first_name, last_name, salary from employees 
where job_id IN (select job_id from jobs where job_id='AD_VP');                 /**/



select first_name, last_name, salary from employees 
where salary > (select salary from employees where department_id = 100);        /*Выдаст ошибку*/

select first_name, last_name, salary from employees 
where salary > ANY(select salary from employees where department_id = 100);     /*Больше ЛЮБОЙ зарплаты в подсписке. Больше минимальной зарплаты*/

select first_name, last_name, salary from employees 
where salary < ANY(select salary from employees where department_id = 100);     /*Меньше ЛЮБОЙ зарплаты в подсписке. Меньше минимальной зарплаты*/


select first_name, last_name, salary from employees 
where salary > ALL(select salary from employees where department_id = 100);     /*Больше ВСЕХ зарплаты в подсписке. Больше максимально зарплаты*/

select first_name, last_name, salary from employees 
where salary < ALL(select salary from employees where department_id = 100);     /*Меньше ВСЕХ зарплаты в подсписке. Меньше минимальной зарплаты*/


select DISTINCT department_name from employees e JOIN departments d
ON (e.department_id = d.department_id);                                         /*Все департаменты где есть работники*/

select department_name from departments 
where department_id IN (select distinct department_id from employees);          /*Тоже самое*/