/*���������� ���� ������*/
/*SUBQUERY*/

select first_name, last_name, salary from employees
where salary > (select AVG(salary) from employees);                             

select first_name, last_name, salary , 
    salary - ROUND((select AVG(salary) from employees)) AVG 
from employees;

select * from jobs;
select * from departments;
select * from locations;
select (select MIN(min_salary) from jobs) min_zp, 
    (select MAX(LENGTH(first_name)) from employees) imya 
from dual;

select first_name, last_name from employees where
employee_id IN (select manager_id from employees);                              /* �������� ������ ���� ����������!*/

select department_name, MIN(salary), MAX(salary) from 
    (select salary, department_name from employees e JOIN departments d
    ON (e.department_id = d.department_id))
    GROUP BY department_name;                                                   /*�������� ������������ � ���� � ��� �������� � ������ ������������*/
    

select department_id, department_name, city from 
        (select department_id, d.location_id, department_name, city from departments d
        JOIN locations l ON (d.location_id = l.location_id))
ORDER BY department_id;                                                         /*� ������ ������ ��������� ������ �����������*/


select department_id, department_name, city from 
        (select department_id, d.location_id, department_name, city from departments d
        JOIN locations l ON (d.location_id = l.location_id)
        WHERE UPPER(city) != 'SEATTLE')                                         /*��������� ����� ������ ������. ���� ����� ������ � �������� �������. ���������� ����������*/
ORDER BY department_id;                                                         /*� ������ ������ ��������� ������ �����������*/


select department_name, MIN(salary), MAX(salary) from 
    (select salary, department_name from employees e JOIN departments d
    ON (e.department_id = d.department_id))
    GROUP BY department_name
HAVING MAX(salary) > (select 2*5000 from dual) 
   AND MIN(salary) < (select salary from employees where employee_id = 113)
ORDER BY department_name;                                                       /*���������� Having*/  


/*SINGLE ROW*/

select * from employees
where salary < (select MAX(salary) from employees) / 5;                         /*����� ����� � ������ �������� ������ ��� ������������ �� /5*/

select first_name, last_name, salary from employees
where salary > (select AVG(salary) from employees);                             /*�� ������ ��� ������� �� �� ��������*/

select first_name, last_name, salary from employees
where salary >= (select salary from employees where employee_id = 180);         /*�� ����� ��� ����� ��� � ��������� � ��=180*/

select first_name, last_name, salary from employees
where salary >= (select salary, first_name 
    from employees where employee_id = 180);                                    /*������ ������*/
    
select first_name, last_name, salary from employees
where salary >= (select salary from employees where employee_id > 180);         /*������ ������. ��� ������������ �multiple row. C ����������� ����������� ������ ���� ��������� ��������*/


select first_name, last_name, salary from employees
where salary >= (select salary from employees where employee_id > 180);

select job_title from jobs j JOIN employees e ON (j.job_id = e.job_id)
GROUP BY job_title
HAVING AVG(salary) =  (select MAX(AVG(salary)) from employees GROUP BY job_id); /*������� ������� ����������� �� ����� ������� �� JOB_ID;


/*MULTIPLE ROW SUBQUERY*/

select * from jobs;

select first_name, last_name, salary from employees
where job_id IN (select job_id from jobs where min_salary > 8000);              /*������ = ���� ����������� IN*/


select first_name, last_name, salary from employees
where job_id NOT IN (select job_id from jobs where min_salary > 8000);          /*����� ���� �������� ��� � ���������� ���� NULL*/


select first_name, last_name, salary from employees
where job_id IN (select job_id, min_salary from jobs where min_salary > 8000);  /*������ ������*/

select first_name, last_name, salary from employees
where job_id IN (select job_id from jobs where job_id = 'AD_VP');

select first_name, last_name, salary from employees
where salary > ANY(select salary from employees where department_id = 100);     /*������� ���� �������� �� ����������. ����� ������������ MIN*/ 

select first_name, last_name, salary from employees
where salary > ALL(select salary from employees where department_id = 100);     /*������� ���� �������� �� ����������. �� ����� ������ ���� ������ ��� ������ �����. ����� ������������ MAX*/ 

select DISTINCT department_name from employees e JOIN departments d ON
    (e.department_id = d.department_id);                                        /*������������� �������� ���� ���������*/
    
select department_name from departments
    where department_id IN (select distinct department_id from employees);      /*������������ � ������� ���� ���������� ����� SUBQUERY*/
    
select department_id, department_name from departments
    where department_id NOT IN (select e.department_id from employees e
    JOIN departments d ON (e.department_id = d.department_id));                 /*������������, � ������� ��� ����������� ����� SUBQUERY � JOIN. ������ ����� SUBQUERY �� ����������*/
    
    
    
/*CORRELATED SUBQUERY*/

select first_name, last_name, salary from employees
where salary > (select AVG(salary) from employees);

select e1.first_name, e1.last_name, e1.salary from employees e1
where e1.salary > (select AVG(e2.salary) from employees e2 
    where (e1.department_id = e2.department_id))                                
order by salary desc;                                                           /*�� ������ ��� �� �� ������������*/

select * from jobs;
select * from employees;
select * from departments;
select * from locations;
select * from countries;

select first_name, last_name, salary from employees where department_id IN
    (select department_id from departments where location_id IN
    (select location_id from locations where country_id = 
    (select country_id from countries where country_name= 'United Kingdom')));  /*����� ����������, ������� �������� � United Kingdom*/
    
select first_name, last_name, salary from employees where job_id IN
    (select job_id from jobs where UPPER(job_title) LIKE '%MANAGER%')
    AND salary > (select AVG(salary) from employees);                           /*��������� ������� ������������ ������ � ������ �� ��������*/
    
    
select first_name, last_name, salary from employees 
where salary > ALL(select salary from employees where first_name = 'David');    /*��������� ������� ������������ ������, ��� ����������� �����*/   

