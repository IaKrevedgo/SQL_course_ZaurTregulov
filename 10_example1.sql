/*DML �������*/
/*INSERT*/

select * from employees;
select * from countries;

INSERT INTO countries VALUES('SW', 'Sweden','1');
INSERT INTO countries VALUES('GR', 'Greece');                                   /*������ ������. ��� ��� ���� 3 ��������*/

INSERT INTO countries (country_id, country_name, region_id) 
VALUES('NR', 'Norway','1');                                                     /*���������� ��������� � ��������� ��������*/

INSERT INTO countries (region_id, country_id, country_name)
VALUES(1, 'GR', 'Greece');                                                      /*�������� �������� � �������� ����� ������ �� � ��� ������� ��� � �������*/

INSERT INTO countries (country_id, country_name) 
VALUES('PR', 'Portugal');                                                       /*����� ��������� �� ��� �������� ��� �������� �������� ����� ����� NULL*/

INSERT INTO countries 
VALUES('FL','Finland',null);                                                           

INSERT INTO countries (country_id, country_name, region_id) 
VALUES('CR', 'Croatia',5);                                                      /*������ - ��������� � �������� � ������� ������� ������ 4*/


select * from employees;

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (210, 'Tregulov', 'TREGULOV', '18-SEP-2019', 'IT_PROG');                 /*�� ������ ������� ���������*/

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (211, INITCAP('tregulov'), UPPER('tregulov1'), 
        TO_DATE('18-SEP-2019','DD-MON-YYYY'), UPPER('IT_PROG'));                /*���������� ��������� ����� �������*/
        

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (200+12, INITCAP('tregulov'), UPPER('tregulov2'), 
        SYSDATE, UPPER('IT_PROG')); 
    
CREATE TABLE new_emps                                                           /*������� ����� �������*/
(
emp_id integer,
name varchar2 (20),
start_date date,
job varchar2 (10)
);

INSERT INTO new_emps (emp_id, name, start_date)
(select employee_id, first_name, hire_date 
    from employees where employee_id > 200);                                    /*������������� ���������*/

select * from new_emps;

INSERT INTO new_emps
(select employee_id, first_name, hire_date, job_id
    from employees where employee_id > 200);                                    /*��� �������� �������� ������ ���� ����� �� ���������� ������� �������� � �������*/
    
    
CREATE TABLE emps_with_high_salary(
name varchar2 (20),
salary integer
);

CREATE TABLE emps_with_dept_100(
name varchar2 (20),
salary integer
);

CREATE TABLE some_emps(
name varchar2 (20),
salary integer
);

INSERT ALL

WHEN department_id = 100 THEN
INTO emps_with_dept_100 VALUES (first_name, salary)
WHEN salary > 15000 THEN
INTO emps_with_high_salary (name) VALUES (last_name)
WHEN 5=5 THEN
INTO some_emps (name, salary) VALUES (first_name, salary)                       /*� ����� ������*/

SELECT first_name, last_name, salary, department_id 
FROM employees
WHERE LENGTH (first_name) >5;


select * from emps_with_dept_100;
select * from emps_with_high_salary;
select * from some_emps;