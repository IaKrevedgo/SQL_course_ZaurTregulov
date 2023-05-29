/*VIEW*/

select * from employees;

CREATE VIEW fin_emp AS 
    select employee_id, job_id, salary from employees;
    
DROP VIEW fin_emp2;                                                              /*Удалить вью*/

select * from fin_emp;

CREATE VIEW fin_emp2 AS 
    select department_name, SUM(salary) sum_salary from employees e JOIN departments d
        ON (e.department_id = d.department_id) group by department_name;        /*Создание временной таблицы по селекту*/
        
select * from fin_emp2;

select department_name from fin_emp2 where sum_salary > 10000;

create view emps_with_high_salary2 AS select first_name, last_name from employees 
    where salary >=12000;

select * from emps_with_high_salary2;    

CREATE VIEW fin_emp2 AS 
    select department_name, SUM(salary) sum_salary from employees e JOIN departments d
        ON (e.department_id = d.department_id) group by department_name;

INSERT INTO fin_emp2 values ('abra-kadabra', 10000);                            /*Не дает инсертить в комплексный (сложный) VIEW*/
UPDATE fin_emp2 set department_name ='abra-kadabra' where sum_salary >5000;     /*Не дает упдате в комплексный (сложный) VIEW*/

CREATE TABLE students (
    id number,                                                                  
    name varchar2(15),
    course number,
    faculty_id number);
    
INSERT INTO students VALUES 
    (1,'Zaur', 6, 1);     
INSERT INTO students VALUES 
    (2,'Den', 2, 2);
INSERT INTO students VALUES 
    (3,'Nina', 1, 1);

create view stud_view AS select name, course from students;

select * from stud_view;

INSERT INTO stud_view values ('Ivan', 4);                                       /*Строка добавляется и в исходную таблицу*/
DELETE FROM stud_view where name = 'Ivan';                                      /*СТрока удаляетя и в исходной таблице*/
select * from students;                                                         

ALTER TABLE students MODIFY (id NULL);                                      /*После этого не даст вставить из вью в студентов, так как ID при доавлении будет NULL*/


CREATE VIEW v105 AS select SUBSTR(name,2) name, course from students;
select * from v105;
INSERT INTO v105 values ('Kolya', 3);                                           /*Не пройдет так как была использована функция*/
DELETE FROM v105 where name = 'aur';                                            /*DELETE прошел так как ничего не мешает найти эту строку*/

CREATE VIEW v106 as select DISTINCT name, course from students;
select * from v106;

INSERT INTO v106 values ('kolya', 3);                                           /*Не пройдет так как DISTINCT делает простой вью комплексным*/
DELETE FROM v106 where name = 'Den';                                            /*Не пройдет так как DISTINCT делает простой вью комплексным*/

CREATE VIEW v107 as select name n, course c from students;
select * from v107;
DROP view v107;

INSERT INTO v107 values ('kolya', 3);                                           /*C алиасами тоже все работает*/
DELETE FROM v107 where n = 'Den'; 

CREATE VIEW v108 as select rownum r, name n, course c from students;

select * from v107;

INSERT INTO v108 values (3,'kolya', 3);                                           /*C алиасами тоже все работает*/
DELETE FROM v108 where n = 'Den'; 