/*Домашка 13*/

CREATE TABLE emp1000 AS (select first_name, last_name, salary, department_id
    from employees);
select * from emp1000;


DROP Table emp1000;
select * from employees;
select * from departments;
select * from locations;
select * from v1000;
CREATE FORCE VIEW v1000 AS (select first_name, last_name, salary, department_name, 
    e.city from emp1000 e JOIN departments d ON (e.department_id = d.department_id)); /*ИСПОЛЬЗУЕМ ФОРС чтобы создать вью с несуществующими столбцами*/
                        
DROP VIEW v1000;

ALTER TABLE emp1000 ADD (
    city varchar2(15));
    
ALTER VIEW v1000 compile;

CREATE SYNONYM syn1000 FOR v1000;

DROP VIEW v1000;
DROP SYNONYM syn1000;
DROP TABLE emp1000;

CREATE SEQUENCE seq1000 
    start with 12 
    increment by 4 
    maxvalue 200 cycle;
    
DROP SEQUENCE seq1000;

ALTER SEQUENCE seq1000
    NOMAXVALUE
    NOCYCLE;                                                                    /*УБИРАЕМ атрибуты последовательности*/
    
CREATE SEQUENCE seq1000 start with 12 maxvalue 200;
CREATE SEQUENCE seq1000 start with 200 maxvalue 300;

select seq1000.currval from dual; 
select seq1000.nextval from dual;
INSERT INTO employees  (employee_id, last_name, email, hire_date, job_id) 
    VALUES (seq1000.nextval, 'Denisov','SAfdgfSDF',TO_DATE('11-02-2011','dd-mm-YYYY'),'IT_PROG'); 
    
INSERT INTO employees  (employee_id, last_name, email, hire_date, job_id) 
    VALUES (seq1000.nextval, 'Velesov','poSeeeASDF',SYSDATE -5 ,'IT_PROG'); 

select * from employees where employee_id > 200;