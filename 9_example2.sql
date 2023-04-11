/*ПРИМЕРЫ SET OPERATORS*/

select first_name, salary from employees where first_name LIKE '%a%'
INTERSECT
select first_name, salary from employees where first_name LIKE '%e%'            /*Сколько работников с буквами а и е в имени*/
MINUS
select first_name, salary from employees where first_name LIKE '%l%';           /*и нет буквы l*/


select first_name, salary from employees where first_name LIKE '%a%'
UNION
select first_name, salary from employees where first_name LIKE '%e%'            /*Объединяем имена с буквами а и е в имени*/
MINUS
select first_name, salary from employees where first_name LIKE '%l%';           /*и нет буквы l*/


select first_name, salary from employees where first_name LIKE '%a%'
UNION
(select first_name, salary from employees where first_name LIKE '%e%'            /*Сначала отнимаем имена с буквой l*/
MINUS
select first_name, salary from employees where first_name LIKE '%l%');           /*затем объеденяем с именами с буквой а*/

select manager_id from employees where department_id = 20
INTERSECT
select manager_id from employees where department_id = 30
MINUS
select manager_id from employees where department_id = 40;                       /*Менеджер, который работает и в 20 и в 30 департаменте, но не работает в 40*/


select department_id dep, SUM(salary) from employees
GROUP BY department_id
UNION
select job_id, SUM(salary) from employees
GROUP BY job_id;                                                                /*БУДЕТ ошибка*/

select department_id dep, TO_CHAR(null) job, SUM(salary) from employees
GROUP BY department_id
UNION
select TO_NUMBER(NULL), job_id, SUM(salary) from employees
GROUP BY job_id;                                                                /*Добавляем столбцы с NULL, чтобы объеденить столбцы с разными типами даннымм*/