/*������*/
/*ampersant substitution*/

select first_name, last_name, salary
from employees
where employee_id =130;

select first_name, last_name, salary
from employees
where employee_id =&ID;                                                         /*����� ����������� ������ ���������� �� ��������� ������*/


select first_name, last_name, salary
from employees
where first_name ='&name' AND salary >&sal;                                     /*���������� ���������� ����� � ��������, ���������� �������� ���������������, ��������� ��� ����������*/


select first_name, last_name, salary
from employees
where first_name like '%&&bukva%' 
    AND last_name like '%&bukva%';                                              /*������� ���������. ��� � ������� �������� ����� �� ������� ���� �����. ���������� ������������ ���� ��� � ������ ��� �� ����������*/
    
select first_name, last_name, &col from employees;                              /*����� �������� ����� ������� � ������� �� ���������*/

select first_name, last_name, &col from employees 
order by &col2;                                                                 /*����� �������� ����� ������� � ������� �� ��������� � ���� ����������*/

select &prodozenie;                                                             /*����� ������ ����� ������ � ����������, �������� ������ ������*/

Select &select
from &table
where &where
order by &order;                                                                /*����� ������� ������ �� ����������, ����� ��������� �� ������ ����������� �������*/

select * from students;

update students set &col3 = &value where &conditions;

commit;

UNDEFINE bukva;                                                                 /*��������� �������� ����������*/

select first_name, last_name, salary
from employees
where first_name like '%&&bukva%' 
    AND last_name like '%&bukva%';  
    
UNDEFINE bukva;                                                                 

DEFINE;                                                                         /*���������� ��� ���������� ����������*/

DEFINE bukva = t;                                                               /*����� ���������� �������� ����������*/

SET DEFINE OFF;                                                                 /*��������� ���������� �����������*/

SET DEFINE ON;                                                                  /*�������� ���������� �����������*/

