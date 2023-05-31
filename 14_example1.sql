/*РАЗНОЕ*/
/*ampersant substitution*/

select first_name, last_name, salary
from employees
where employee_id =130;

select first_name, last_name, salary
from employees
where employee_id =&ID;                                                         /*Оракл позволяется менять переменную не записывая заново*/


select first_name, last_name, salary
from employees
where first_name ='&name' AND salary >&sal;                                     /*Стринговые переменные пишем в ковычках, спрашивает значения последовательно, указывает имя амперсанта*/


select first_name, last_name, salary
from employees
where first_name like '%&&bukva%' 
    AND last_name like '%&bukva%';                                              /*Двойной амперсант. Имя и фамилия содержит букву из запроса один разыы. Переменная записывается ОДИН раз и второй раз не спрашивает*/
    
select first_name, last_name, &col from employees;                              /*Можно заменить любой столбец в селекте на амперсант*/

select first_name, last_name, &col from employees 
order by &col2;                                                                 /*Можно заменить любой столбец в селекте на амперсант и даже сортировку*/

select &prodozenie;                                                             /*Можно писать целый запрос в амперсанте, оставиви только селект*/

Select &select
from &table
where &where
order by &order;                                                                /*Можно сделать селект из переменных, чтобы постоянно не писать конструкцию селекта*/

select * from students;

update students set &col3 = &value where &conditions;

commit;

UNDEFINE bukva;                                                                 /*Обнуление двойного амперсанта*/

select first_name, last_name, salary
from employees
where first_name like '%&&bukva%' 
    AND last_name like '%&bukva%';  
    
UNDEFINE bukva;                                                                 

DEFINE;                                                                         /*Показывает все привязаные переменные*/

DEFINE bukva = t;                                                               /*Можно определить значение переменной*/

SET DEFINE OFF;                                                                 /*Выключить функционал амперсантов*/

SET DEFINE ON;                                                                  /*Включить функционал амперсантов*/

