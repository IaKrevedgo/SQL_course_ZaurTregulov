/*SYNONYM*/
/*�� ��������� ������ ������� ��� ���*/
/*����� ������� ������� ��� ���*/

select * from hr.employees;

CREATE SYNONYM emp FOR employees;                                               /*������� ������� ��� ������� ��������*/

DROP SYNONYM emp;

select * from emp;

CREATE PUBLIC SYNONYM emp FOR employees;

DROP PUBLIC SYNONYM emp; 

select * from emp;

ALTER PUBLIC SYNONYM emp COMPILE;