/*CORRELATED SUBQUERIES*/

select first_name, last_name, salary from employees 
where salary > (select AVG(salary) from employees);

select e1.first_name, e1.last_name, e1.salary from employees e1
where e1.salary > 
    ANY(select AVG(e2.salary) from employees e2 
        where e2.department_id=e1.department_id);                               /*Зарплата больше чем средняя зарплата в их департаменте. Выполняется столько раз, столько строк в таблице employees*/
    
    

/*ПРИМЕРЫ*/
select first_name, last_name, salary from employees where department_id IN
    (select department_id from departments where location_id IN
    (select location_id from locations where country_id =
    (select country_id from countries where country_name='United Kingdom')));   /*Находим Кантри_ид, потом локейшн, потом департамент и потом выводим то что в начале*/
    

select * from jobs;

select first_name, last_name, salary from employees where job_id IN
    (select job_id from jobs where UPPER(job_title) like ('%MANAGER%')
    and salary > (select AVG(salary) from employees));
    
select first_name, last_name, salary from employees 
where salary > ALL(select salary from employees where first_name = 'David');