/*SUBQUERRY*/ /*ПОДЗАПРОС*/                                                     /*INNER SELECT*/

select first_name, last_name, salary
from employees where salary > (select AVG(salary) from employees);              /*Список работников чья зп больше средней зп */
                                                                                /*Второй селект срабатывает первее первого*/
select * from employees;
select * from jobs;
                                                                                
select (select MIN(min_salary) from jobs) min_zp,
       (select MAX(LENGTH(first_name)) from employees) samoe_dlinnoe_imya
from dual;

select first_name, last_name from employees 
where employee_id IN (select manager_id from employees);                        /*имя и фамилия всех менеджеров. Если емполи_ид в списке этиъх номеров то выводим*/

select department_name, MIN(salary), MAX(salary) 
from (select salary, department_name from employees e JOIN departments d
ON (e.department_id = d.department_id))
GROUP BY department_name order by department_name;                              /*'создаем' запрос или таблицу и вытягиваем данные из нее*/

SELECT department_name, MIN(salary), MAX(salary) 
FROM (select salary, department_name from employees e 
JOIN departments d ON (e.department_id = d.department_id))
GROUP BY department_name 
HAVING MAX(salary) > (select 2*5000 from dual) 
    AND MIN(salary) < (select salary from employees where employee_id = 113)
ORDER BY department_name;                                                       /*Добавляем ХАВИНГ*/





