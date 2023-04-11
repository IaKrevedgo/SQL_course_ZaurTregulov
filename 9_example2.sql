/*������� SET OPERATORS*/

select first_name, salary from employees where first_name LIKE '%a%'
INTERSECT
select first_name, salary from employees where first_name LIKE '%e%'            /*������� ���������� � ������� � � � � �����*/
MINUS
select first_name, salary from employees where first_name LIKE '%l%';           /*� ��� ����� l*/


select first_name, salary from employees where first_name LIKE '%a%'
UNION
select first_name, salary from employees where first_name LIKE '%e%'            /*���������� ����� � ������� � � � � �����*/
MINUS
select first_name, salary from employees where first_name LIKE '%l%';           /*� ��� ����� l*/


select first_name, salary from employees where first_name LIKE '%a%'
UNION
(select first_name, salary from employees where first_name LIKE '%e%'            /*������� �������� ����� � ������ l*/
MINUS
select first_name, salary from employees where first_name LIKE '%l%');           /*����� ���������� � ������� � ������ �*/

select manager_id from employees where department_id = 20
INTERSECT
select manager_id from employees where department_id = 30
MINUS
select manager_id from employees where department_id = 40;                       /*��������, ������� �������� � � 20 � � 30 ������������, �� �� �������� � 40*/


select department_id dep, SUM(salary) from employees
GROUP BY department_id
UNION
select job_id, SUM(salary) from employees
GROUP BY job_id;                                                                /*����� ������*/

select department_id dep, TO_CHAR(null) job, SUM(salary) from employees
GROUP BY department_id
UNION
select TO_NUMBER(NULL), job_id, SUM(salary) from employees
GROUP BY job_id;                                                                /*��������� ������� � NULL, ����� ���������� ������� � ������� ������ �������*/