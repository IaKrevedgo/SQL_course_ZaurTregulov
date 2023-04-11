/*������� ����� 2*/
select * from jobs;
select * from employees;
select * from departments;
select * from locations;
select * from countries;

select * from employees 
where LENGTH(first_name) = (select MAX(LENGTH(first_name)) from employees);     /*���������� � ����� ������� ������*/

select * from employees
where salary > (select AVG(salary) from employees);                          /*���������� �� ������� ������ �� ���� �����������*/


select city, SUM(salary)
from employees e 
    JOIN departments d ON (e.department_id = d.department_id)
    JOIN locations l ON (l.location_id = d.location_id)
GROUP BY city                                                                   /*������ � ����� ������ �������� ��������*/
HAVING SUM(salary) = 
            (select MIN(SUM(salary))
                from employees e
                    JOIN departments d ON (e.department_id = d.department_id)
                    JOIN locations l ON (l.location_id = d.location_id)
                GROUP BY city);                                                 /*�����/������ ��� ���������� � ����� ������������ ������ �����*/
                        
select * from employees
where manager_id IN 
    (select employee_id from employees where salary > 15000);                   /*����������, �������� ������� �������� ������ 15000*/
    
select * from departments d
where department_id NOT IN (select department_id from employees 
    where d.department_id = department_id);                                     /*������������ � ������� ��� �����������*/
    
select * from departments d
where department_id NOT IN (select department_id from employees 
    where department_id IS NOT NULL);                                           /*���� �����. ������������ � ������� ��� �����������*/    
    
select * from employees
where employee_id NOT IN (select DISTINCT manager_id 
                            from employees
                            where manager_id IS NOT NULL);                      /*����� ��������� NULL ����� �� ��������*/
                            
select * from employees e
where (select COUNT(*) from employees 
        where manager_id = e.employee_id) > 6;                                  /*���� � ���������� ������� ����� � ����������� ������ 6 �����������. �orellated subquery*/
        
select * from employees
where department_id = (select department_id 
                        from departments
                         where department_name = 'IT');                         /*���������, ������� �������� � ������������ IT'*/


select * from employees
where manager_id IN (select employee_id from employees 
                    where  TO_CHAR(hire_date,'YYYY')= 1997)
        AND hire_date < TO_DATE ('01-01-1997', 'DD-MM_YYYY');                   /*����������, ��������� ������� ���������� �� ������ � 1997 � ���� ��������� ���������� �� 1997*/
        
select * from employees e
where manager_id IN (select employee_id from employees 
    where TO_CHAR(hire_date,'MM') = '01') 
AND (select LENGTH(job_title) from jobs where job_id = e.job_id) > 15;          /*����������, ��������� ������� ����������� � ������ � ����� �������� ������� ������ 15*/