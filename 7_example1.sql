/*JOIN  - ����������� ������*/
/*INNER JOIN (NATURAL JOIN)*/

select * from employees;

select * from departments;

select e.salary s, e.first_name sd from employees e;

select * from regions;
select * from countries;

select * from regions NATURAL JOIN countries;                                   /*���������� ������� �� �������� � ����������� �������*/

select country_name, country_id, region_name, region_id
from regions r NATURAL JOIN countries c where region_name = 'Europe';           /*����� �� �������� �������� ������ ��������� ��� �� ����������� � ��������*/

select c.country_name, c.country_id, r.region_name, region_id
from regions r NATURAL JOIN countries c;                                        /*���� ����� ������ � ��������� ������*/

select first_name, last_name, salary, department_name, department_id, manager_id 
from employees e NATURAL JOIN departments d;

select * from employees NATURAL JOIN countries;                                 /*���� ������������ ��� �������� ��� ���������� �������� ������ ������������� � ���������� �����*/

select * from employees NATURAL JOIN job_history;




/*NATURAL JOIN WITH USING*/
select first_name, last_name, salary, department_name, department_id, e.manager_id e_manager, d.manager_id d_manager
from employees e JOIN departments d using (department_id);                      /*��������� ������� �� ������ ������ �����������. � ���������� �������� ����� ������ ����� �� ��������*/

select * from regions;

select * from countries;

select * from regions JOIN countries USING(region_id);                          /*�� �� ��� � Natural join, �� ��������� ���� �������*/

select first_name, last_name, jh.job_id, start_date, end_date
from employees JOIN job_history jh USING (employee_id, department_id);          /*����������� �� ���� ����������� ��������*/

select first_name, last_name, jh.job_id, start_date, end_date
from employees JOIN job_history jh USING (employee_id);                         /*����������� �� ������ ������������ �������*/

