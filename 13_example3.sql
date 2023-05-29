/*SYNONYM*/
/*Не позволяет делать условия как ВЬЮ*/
/*Можно создать синоним для ВЬЮ*/

select * from hr.employees;

CREATE SYNONYM emp FOR employees;                                               /*Создаем синоним для таблицы эмплоиис*/

DROP SYNONYM emp;

select * from emp;

CREATE PUBLIC SYNONYM emp FOR employees;

DROP PUBLIC SYNONYM emp; 

select * from emp;

ALTER PUBLIC SYNONYM emp COMPILE;