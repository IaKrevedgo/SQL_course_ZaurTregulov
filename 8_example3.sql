/*MULTIPLE ROW SUBQUERRY*/

select first_name, last_name, salary from employees 
where job_id = (select job_id from jobs where min_salary >8000);                /*������ ������*/

select first_name, last_name, salary from employees 
where job_id IN (select job_id from jobs where min_salary >8000);               /*������ ����� ����� IN*/

select first_name, last_name, salary from employees 
where job_id NOT IN (select job_id from jobs where min_salary >8000);           /*������ �� ����� ����� IN. �� ������������, ���� �� ������, ��� ��������� �� �������� NULL!!!!*/

select first_name, last_name, salary from employees 
where job_id IN (select job_id from jobs where job_id='AD_VP');                 /**/



select first_name, last_name, salary from employees 
where salary > (select salary from employees where department_id = 100);        /*������ ������*/

select first_name, last_name, salary from employees 
where salary > ANY(select salary from employees where department_id = 100);     /*������ ����� �������� � ���������. ������ ����������� ��������*/

select first_name, last_name, salary from employees 
where salary < ANY(select salary from employees where department_id = 100);     /*������ ����� �������� � ���������. ������ ����������� ��������*/


select first_name, last_name, salary from employees 
where salary > ALL(select salary from employees where department_id = 100);     /*������ ���� �������� � ���������. ������ ����������� ��������*/

select first_name, last_name, salary from employees 
where salary < ALL(select salary from employees where department_id = 100);     /*������ ���� �������� � ���������. ������ ����������� ��������*/


select DISTINCT department_name from employees e JOIN departments d
ON (e.department_id = d.department_id);                                         /*��� ������������ ��� ���� ���������*/

select department_name from departments 
where department_id IN (select distinct department_id from employees);          /*���� �����*/