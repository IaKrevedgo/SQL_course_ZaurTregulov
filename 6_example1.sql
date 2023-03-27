/*GROUP FUNCTIONS*/
/*COUNT*/

select COUNT(*) from employees;                                                 /*���������� �����*/

select COUNT(*) from employees where salary > 5000;                             /*���������� ����� � ��������*/

select * from employees;

select COUNT(salary) from employees;                                            /*���������� ����� ��� null*/

select COUNT(commission_pct) from employees;                                    /*c null*/

select COUNT(NVL(commission_pct,0)) from employees;                             /*��� null*/

select COUNT(ALL commission_pct) from employees;                                /*������� �������*/

select COUNT(DISTINCT commission_pct) from employees;                           /*���������� ���������� ��������*/

select COUNT(DISTINCT first_name) from employees;                               /*���������� ���������� ��������*/

select COUNT(first_name), COUNT(DISTINCT first_name) from employees;            /*���������� � ������������ ����� ����������*/

select COUNT(*), COUNT(commission_pct), COUNT(DISTINCT commission_pct) 
from employees;                                                                  /*���������� � ������������ ����� � ����� ����������*/

select COUNT(DISTINCT NVL(commission_PCT,0)) from employees;                    /*������ �� ���� ���� � ����������  + 1 �������� ����������*/

select first_name, last_name, first_name||' '||last_name from employees;

select COUNT('abc') from employees;                                             /*����������� � ������ ������ ��� � ���������� ���������� �����*/
select COUNT('7') from employees;                                               /*����������� � ������ ������ ��� � ���������� ���������� �����*/
select COUNT(' ') from employees;                                               /*����������� � ������ ������ ��� � ���������� ���������� �����*/

select COUNT(salary), first_name from employees;                                 /*����� ������� �� ����� �������� ��������� �������*/


/*SUM*/

select SUM(salary) from employees;                                              /*��������� ��� null*/

select 5+null from dual;                                                        /*����� null*/

select SUM(DISTINCT commission_pct) from employees;                             /*���������� ��������*/

select SUM(salary), SUM(DISTINCT salary) from employees;                        /*��������� ��� null*/

select SUM(commission_pct), COUNT(�DISTINCT salary), COUNT(*) from employees;   /*����� ��������� � ������ ����-���������*/

select SUM('7') from employees;                                                 /*������������ 107 �������*/

select sysdate - hire_date from employees;                                      /*������� ���� ���������� ������ ���������*/

select ROUND(SUM(sysdate - hire_date)) from employees;                          /*������� ���� ����������� ��� ����������*/

select ROUND(SUM(sysdate - hire_date)/365) from employees;                      /*������� ��� ����������� ��� ����������*/

select ROUND(SUM(LENGTH(first_name))/COUNT(*)) from employees;                  /*������� ���������� ���� � ����� ���������*/


/*AVG*/
select (3+5+11)/3 from dual;

select AVG(salary) from employees;                                              /*������� ��������������*/

select AVG(salary) from employees where job_id = 'IT_PROG';

select AVG(salary), AVG(DISTINCT salary) from employees;                        /*������� ����� ���������� �������� ��*/

select AVG(commission_pct), AVG(DISTINCT commission_pct) from employees;        /*�������� ���� ������������*/

select COUNT(*) a, SUM(salary) b, AVG(commission_pct) c from employees;         /*����� ��������� ������� � ����� �������*/

select AVG(7) from employees;                                                   /*������ �������������� �� 7 ����� 7*/

select AVG(sysdate-hire_date)/365 from employees;   

select AVG(commission_pct), AVG(NVL(commission_pct,0)) from employees;          /*���� �������� ����� �������������� �� ������� �������������� ����� ������*/


/*MIN � MAX*/
select MIN(salary), MAX(salary) from employees where department_id = 50;

select MIN(DISTINCT salary), MAX(DISTINCT salary) from employees 
where department_id = 50;                                                       /* ��������� ��� ��*/

select MIN(hire_date) rano, MAX(hire_date) pozdno from employees 
where department_id = 50; 

select MIN(last_name) mini, MAX(last_name) maxi from employees 
where department_id = 50; 

select COUNT(salary), SUM(salary), AVG(salary), MIN(salary), MAX(salary) from employees;

select MAX(LENGTH(first_name)), MIN(LENGTH(first_name)) from employees;