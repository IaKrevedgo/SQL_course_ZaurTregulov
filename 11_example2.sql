/*CREATE*/

select * from employees;

CREATE TABLE students (
    student_id integer,                                                         /*�������� ������� � ��� ������*/
    name varchar2(15),
    start_date date DEFAULT round(sysdate),                                     /*�������� �������� ��� ������ � ��������� ��������*/
    scholarship number (6,2),                                                   /*������� ����� �� 6 ����, 2 ����� �������*/
    avg_score number (4,2) default 5
    ) ORGANIZATION HEAP;                                                        /*���������� �� ��������� - ��� ���������� (�����/����� �� ������*/
    
select * from students;

INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (1,'Zaur', TO_DATE('18-SEP-2019'), 1500.3, 7.8);
INSERT INTO students (student_id, name, start_date, scholarship, avg_score)
VALUES (2,'Ivan', TO_DATE('19-SEP-2019'), 800.356, 8);
INSERT INTO students (student_id, name, scholarship )
VALUES (3,'Denis', 1350.6);                                                     /*���� ���� �� ������� �������� �������� �� ��������� Start_date � avg_score*/



/*���������� SUBQUERY*/
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
    
CREATE TABLE regions2 AS (SELECT * from regions WHERE 5=6);                     /*����������� ������ ��������� ������� (�������) ��� ������*/

select * from regions2;



/*ALTER TABLE*/

select * from students;

ALTER TABLE students ADD (course number DEFAULT 3);                             /*��������� ������� ���� � ��������� ��������� � �������*/

ALTER TABLE students MODIFY (avg_score INTEGER);                                /*�� ��������� �������� ��� ������� ���� � ������� ���� ������*/

ALTER TABLE students MODIFY (avg_score number (5,3));                           /*����� ������ �������� ��� ���� ������ �� ������������� � ����� �����*/

ALTER TABLE students MODIFY (start_date date DEFAULT NULL);                     /*������� ��������� �������� ��� �������*/

INSERT INTO students (student_id, name)
VALUES (4,'Erig');                                                              

ALTER TABLE students DROP COLUMN scholarship;                                   /*������� ������� �� �������*/

ALTER TABLE departments DROP COLUMN department_id;                              /*�� ���������� ������� ��� ��� �� ������ �� �������� department_id � employees*/

ALTER TABLE students SET UNUSED COLUMN start_date;                              /*�� ���������� ������� START_DATE - ������� ��� �������*/

ALTER TABLE students DROP UNUSED COLUMNS;                                       /*������� ��� ������� �������*/ 

ALTER TABLE students RENAME COLUMN student_id TO id;                            /*������������� �������*/

ALTER TABLE students READ ONLY;                                                 /*������� ������ ��� ������. DML ������� �� �������*/

DELETE FROM students where id=1;                                                /*�� ���� ��������� � ������� ������. ������� ������� �����*/

DROP TABLE students;


/*TRUNCATE*/

TRUNCATE TABLE students;                                                        /*������� ��� ������ �� �������(������� �������)*/
                                                                                /*���� ���������� �� ������� �� DDL ������� �� �������*/
select * from students;


/*DROP*/
DROP TABLE students;                                                            /*��������� ������� �������. ���� ���������� �� ������� �� DDL ������� �� �������*/

DROP TABLE departments;                                                         /*�� ���� ������� ��� ��� ������� ������ � ������ ��������*/

