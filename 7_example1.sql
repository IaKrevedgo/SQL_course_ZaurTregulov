/*JOIN  - объеденение таблиц*/
/*INNER JOIN (NATURAL JOIN)*/

select * from employees;

select * from departments;

select e.salary s, e.first_name sd from employees e;

select * from regions;
select * from countries;

select * from regions NATURAL JOIN countries;                                   /*Объеденяет таблицы по столбцам с одинкаовыми именами*/

select country_name, country_id, region_name, region_id
from regions r NATURAL JOIN countries c where region_name = 'Europe';           /*Можно не уточнять название таблиц потомучто они не дублируются в табдицах*/

select c.country_name, c.country_id, r.region_name, region_id
from regions r NATURAL JOIN countries c;                                        /*ТОже самое только с названием таблиц*/

select first_name, last_name, salary, department_name, department_id, manager_id 
from employees e NATURAL JOIN departments d;

select * from employees NATURAL JOIN countries;                                 /*Если обхеденяются две табилццы без одинаковых столбцов строки перемножаются и полцчается хрень*/

select * from employees NATURAL JOIN job_history;




/*NATURAL JOIN WITH USING*/
select first_name, last_name, salary, department_name, department_id, e.manager_id e_manager, d.manager_id d_manager
from employees e JOIN departments d using (department_id);                      /*указываем столбцы по какому делаем объеденение. К одинаковым колонкам пишем алиасы чтобы не путаться*/

select * from regions;

select * from countries;

select * from regions JOIN countries USING(region_id);                          /*То же что и Natural join, но указываем явно столбец*/

select first_name, last_name, jh.job_id, start_date, end_date
from employees JOIN job_history jh USING (employee_id, department_id);          /*Объеденение по двум совпадающим столбцам*/

select first_name, last_name, jh.job_id, start_date, end_date
from employees JOIN job_history jh USING (employee_id);                         /*Объединение по одному совпадающему столбцу*/

