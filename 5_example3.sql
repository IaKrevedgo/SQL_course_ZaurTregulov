/*��������� �������*/

select LENGTH(UPPER(Sysdate)) from dual; /* ������� 2*/

select SUBSTR (sysdate, add_months('23-mar-23',3)) from dual; /* ����������� ��� ��� ���������� ���� � ����� �����*/

select first_name, LENGTH (first_Name), ROUND (123.456789, LENGTH (first_name))
from employees;                                                         /* ��������� ����� �� ���������� �������� � first_name*/

SELECT first_name, employee_id, LENGTH(first_name),
SUBSTR (first_name, LENGTH(employee_id)),
LENGTH (SUBSTR (first_name, LENGTH(employee_id)))
from employees;

SELECT TO_DATE('23-03-23', 'dd-MM-RR'), /*�� ������ ����*/
TO_CHAR(TO_DATE('23-03-23', 'dd-MM-RR'), 'day'),    /*���� �� ����*/
LENGTH(TO_CHAR (TO_DATE('23-03-23','dd-MM-RR'), 'fmday')) /*����� ���*/
FROM DUAL;

select first_name, last_name, phone_number,
TO_NUMBER (SUBSTR(phone_number, INSTR(phone_number, '.') + 1), '999.9999') * 10000 as form_numb
from employees where employee_id < 130;



/*GENERAL FUNCIONS*/

/*NVL*/

select NVL(18,19) from dual;                        /*���� ������ �������� �� null �� ���������� ���*/

select NVL(null, 19) from dual;                     /*���� ������ �������� null �� ���������� ������ ��������*/

select NVL(null, null) from dual;

select first_name, commission_pct, NVL(commission_pct,0) from employees;            /*�������� ��� null �� 0*/

select first_name, NVL(SUBSTR(first_name, 6), 'Name is too short') from employees; /* ������� ������������� � �������� ����� ���� ��� ����i� 6*/

select first_name, commission_pct, NVL(salary*commission_pct, 500) bonus from employees; /*���� �������� ��� �� ����� 500, ���� ���� ������� �� ����� �������� �� ��������*/

select first_name, commission_pct, NVL(salary*commission_pct, 0)+500 bonus from employees; /*���� �������� ��� �� ����� 500, ���� ���� ������� �� ����� �������� �� ��������*/



/*NVL2*/

select NVL2(18,19,20) from dual;

select NVL2(null,19,20) from dual;

select first_name,NVL2(commission_pct, commission_pct, 0) from employees;

select first_name, NVL2(commission_pct,'����','���') from employees;            /*���� �� ���� �� ������� ������ ��������, ���� ���� �� ������ ��������*/


/*NULIF*/

select NULLIF(19,19) from dual;                                                 /*���������� NULL ���� �������� ����� � 1 �������� ���� �� �����*/

select NULLIF(18,19) from dual;                                                 /*���������� NULL ���� �������� ����� � 1 �������� ���� �� �����*/

select NULLIF('dff','dff') from dual;                                           /*���������� NULL ���� �������� ����� � 1 �������� ���� �� �����*/

select NULLIF(1||5, '15') from dual;

select NULLIF(TO_DATE('18-sep-87'),TO_DATE('18/sep/87')) from dual;

select country_id, country_name,
NVL2(NULLIF(country_id, UPPER(SUBSTR(country_name,1,2))), '���������� ���', 'Sovpadenie naydeno') sravnenie
from countries;


/*COALESCE*/

select COALESCE (3,4,5,6-5,Null) from dual;                                     /*���������� ����� �� NULL*/

select COALESCE (null,4,5,6-5,Null) from dual;                                  /*���������� ����� �� NULL*/

select COALESCE (null,null,Null) from dual;                                     /*���������� ����� �� NULL, ���� ������ �� ���� ���������� ����*/

select COALESCE (17,18) from dual;                                              /*� ����� ����������� ������ NVL(val1,val2)*/

select first_name, commission_pct, manager_id, salary,
COALESCE (commission_pct, manager_id, salary) info
from employees;
