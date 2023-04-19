/*CREATE*/

select * from employees;

CREATE TABLE students (
    student_id integer,                                                         /*название столбца и тип данных*/
    name varchar2(15),
    start_date date DEFAULT round(sysdate),                                     /*название столбцаб тип данных и дефолтное значение*/
    scholarship number (6,2),                                                   /*Дробное число из 6 цифр, 2 после запятой*/
    avg_score number (4,2) default 5
    ) ORGANIZATION HEAP;                                                        /*Сортировка по умолчанию - без сортировки (можно/нужно не писать*/
    
select * from students;

INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (1,'Zaur', TO_DATE('18-SEP-2019'), 1500.3, 7.8);
INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (2,'Ivan', TO_DATE('19-SEP-2019'), 800.356, 8);
INSERT INTO students (student_id, name, scholarship )
VALUES (3,'Denis', 1350.6);                                                     /*если явно не указаны значения заменяет на дефолтные Start_date и avg_score*/



/*Используем SUBQUERY*/
select * from new_emps2;
CREATE TABLE new_emps2 AS 
    (SELECT employee_id, first_name, last_name, salary, department_id 
    FROM employees);
    
select * from new_dep;

CREATE TABLE new_dep AS 
    (SELECT  department_name, max(salary) max_salary,
    MIN(salary) min_salary from employees e JOIN departments d 
    ON (d.department_id = e.department_id)
    GROUP BY department_name);
    
CREATE TABLE regions2 AS (SELECT * from regions WHERE 5=6);                     /*Скопируется только структура таблицы (столбцы) без данных*/

select * from regions2;



/*ALTER TABLE*/

select * from students;

ALTER TABLE students ADD (course number DEFAULT 3);                             /*Добавляем столбец курс с дефолтным значением в таблицу*/

ALTER TABLE students MODIFY (avg_score INTEGER);                                /*Не позволяет изменить тип столбца если в столбце есть данные*/

ALTER TABLE students MODIFY (avg_score number (5,3));                           /*Можно чучуть изменить итп чтоы данные не конфликтовали с новым типом*/

ALTER TABLE students MODIFY (start_date date DEFAULT NULL);                     /*Убираем дефолтное значение для столбца*/

INSERT INTO students (student_id, name)
VALUES (4,'Erig');                                                              

ALTER TABLE students DROP COLUMN scholarship;                                   /*Удаляем столбец из таблицы*/

ALTER TABLE departments DROP COLUMN department_id;                              /*Не получается удалить так как он связан со столбцом department_id в employees*/

ALTER TABLE students SET UNUSED COLUMN start_date;                              /*Не показывает колонку START_DATE - быстрее чем удалять*/

ALTER TABLE students DROP UNUSED COLUMNS;                                       /*УДАЛИТЬ ВСЕ СКРЫТЫЕ СТОЛБЦЫ*/ 

ALTER TABLE students RENAME COLUMN student_id TO id;                            /*Переименовать столбец*/

ALTER TABLE students READ ONLY;                                                 /*Таблица только для чтения. DML команды не пройдут*/

DELETE FROM students where id=1;                                                /*Не даст изменения в таблице делать. Удалить таблицу можно*/

DROP TABLE students;


/*TRUNCATE*/

TRUNCATE TABLE students;                                                        /*Удаляет все строки из таблицы(очищает таблицу)*/
                                                                                /*Если транзакция не закрыта то DDL команды не пройдут*/
select * from students;


/*DROP*/
DROP TABLE students;                                                            /*Полностью удаляет таблицу. Если транзакция не закрыта то DDL команды не пройдут*/

DROP TABLE departments;                                                         /*НЕ ДАСТ удалить так как столбец связан с другой таблицей*/

